package battlefield 
{
	import flash.geom.Point;
	import sinterface.battle.IBattle;
	import sinterface.battle.IBuff;
	import sinterface.battle.IMapTile;
	import sinterface.battle.ISkill;
	import sinterface.battle.ISoldier;
	import sinterface.game.ITacticCondition;
	import sinterface.game.ITacticInfo;
	import tools.ArrayTools;
	import tools.MapTitleTools;
	
	public class Controller 
	{
		
		/**
		 * 战斗进度
		 */
		//public var time:uint;
		
		/**
		 * 每次经过时间
		 */
		//public var timeStep:uint;
		public var battle:IBattle;
		
		private var _soldierArr:Array;
		
		private var _curSoldier:ISoldier;
		
		private var _curTactic:ITacticInfo;
		private var _battleInfo:Object;
		
		
		public function Controller() 
		{
			
		}
		
		public function getReport(battle:IBattle):Object
		{
			this.battle = battle;
			_soldierArr = battle.getSoldiers();
			_battleInfo = getBattleInfo();
			var result:Array = [];
			var team1:int = 0;
			var team2:int = 0;
			
			for (var i:int = 0, leni:int = _soldierArr.length; i < leni; i++) {
				_curSoldier = _soldierArr[i];
				if (_curSoldier.team == 0) {
					team1++;
				}else {
					team2++;
				}
				
				
				var buffReport:Array = _curSoldier.getBuffReport();
				if (buffReport && buffReport.length > 0) {
					result = result.concat(buffReport);
				}
				_curSoldier.updateTurn();
				
				if (!_curSoldier.checkTurn()) {
					result.push(_curSoldier.getStatusReport());
					continue;
				}
				
				if (_curSoldier.nextTime > battle.time) {
					continue;
				}
				
				var tacticReport:Object = getTacticReport();
				if (tacticReport) {
					_curSoldier.updateTime();
					result.push(tacticReport);
				}
			}
			
			battle = null;
			_soldierArr = null;
			_curSoldier = null;
			_curTactic = null;
			
			if (team1 == 0 || team2 == 0) {
				return {end:1,type:"result",win:team1 > 0 ? 1 : 2};
			}
			
			return {report:result};
		}
		
		
		private function getBattleInfo():Object
		{
			var result:Object = { };
			
			for (var i:int = 0,len:int = _soldierArr.length; i < len; i++) {
				var soldier:ISoldier = _soldierArr[i];
				if (result[soldier.team] == null)
				{
					result[soldier.team] = { hp:0, mp:0, dead:0,hpmin:1,mpmin:1,position:new Point() };
				}
				var teamInfo:Object = result[soldier.team];
				if (soldier.hp == 0) 
				{
					teamInfo.dead += 1;
				}
				teamInfo.hp += soldier.hp / soldier.info.attr.hp;
				teamInfo.mp += soldier.mp / soldier.info.attr.mp;
				teamInfo.hpmin = teamInfo.hp < teamInfo.hpmin ? teamInfo.hp : teamInfo.hpmin;
				teamInfo.mpmin = teamInfo.mp < teamInfo.mpmin ? teamInfo.mp : teamInfo.mpmin;
				teamInfo.position = teamInfo.position.add(soldier.getPosition());
				(teamInfo.position as Point).normalize(teamInfo.position.length / 2);
				teamInfo.position.x = int(teamInfo.position.x);
				teamInfo.position.y = int(teamInfo.position.y);
			}
			return result;
		}
		
		private function getTacticReport():Object
		{
			var arrTactic:Array = _curSoldier.getTactics();
			_curTactic = null;
			
			for (var i:int = 0,leni:int=arrTactic.length; i < leni; i++) {
				_curTactic = arrTactic[i];
				var targets:Array = getTargets();				
				if (targets.length >= _curTactic.targetNum) {
					var re:Object = getActionReport(targets)
					if (re)
					{
						return re; 
					}
				}
			}
			
			return null;
		}
		
		private function getActionReport(targets:Array):Object 
		{
			if (targets.length > _curTactic.targetNum) {
					targets.length = _curTactic.targetNum;
			}else if (targets.length == 0) {
				return null;
			}
			
			switch(_curTactic.actionType) {
				case ActionType.SKILL:
					if (!checkSkillActive(int(_curTactic.actionValue)))
					{
						return null
					}
					
					var skill:ISkill = _curSoldier.getSkill(int(_curTactic.actionValue));
					
					if (skill.checkDistance(_curSoldier.getDistance(targets[0].lastPosition))) {
						return skill.getReport(_curSoldier,targets);
					}
					
					return null;
					
					
				case ActionType.MOVE:
					if (_curTactic.actionValue == "1") {
						var p1:Point = _battleInfo[_curSoldier.team ].position;
						var p2:Point = _battleInfo[(_curSoldier.team + 1) % 2].position;
						var p:Point = p1.add(p1.subtract(p2));
						return _curSoldier.getMoveReport(p);
					}else {
						return _curSoldier.getMoveReport(targets[0].getPosition());
					}
					
					break;
			}
			
			return null;
		}
		
		private function checkSkillActive(id:int):Boolean
		{
			var skill:ISkill = _curSoldier.getSkill(id);
			if (skill == null) {
				trace("没有找到技能 skill:" + id);
				return false;
			}
			
			if (_curSoldier.getSkillTime(id) > battle.time) {
				return false;
			}
			
			
			if (skill.costType > 0) {
				switch(skill.costType)
				{
					case 1:
						if (_curSoldier.info.attr.mp < skill.cost) {
							return false;
						}
						break;
				}
			}
			
			return true;
		}
		
		private function getTargets():Array 
		{
			var result:Array = [];
			switch(_curTactic.targetType) {
				case TargetType.ONESELF:
					result.push(_curSoldier);
					break;
				case TargetType.ENEMY:
					result = battle.getEnemyTeam(_curSoldier.team);
					break;
				case TargetType.TEAMMATE:
					result = battle.getMyTeam(_curSoldier.team);
				case "posotion":
					var tempArr:Array = battle.getEnemyTeam(_curSoldier.team);
					var pArr:Array = new Array();
					for each (var item:ISoldier in tempArr) 
					{
						pArr.push(item.getPosition());
					}
					
					findPositon(pArr,2);
					
					break;
			}
			
			var conditionArr:Array = _curTactic.getTargetCondition();
			
			for (var i:int = result.length - 1; i > -1; i--) {
				var flag:Boolean = true;
				for each (var condition:ITacticCondition in conditionArr) 
				{
					if (checkCondition(condition, result[i]) == false) {
						flag = false;
						break;
					}
				}
				if (_curTactic.actionType == "skill") {
					if (flag && !checkSkillActive(int(_curTactic.actionValue)))
					{
						flag = false;
					}
					if (flag && !checkSkillTarget(result[i])) {
						flag = false;
					}
				}
				
				
				if (flag == false) {
					result.splice(i, 1);
				}
			}
			
			
			return result;
		}
		
		private function findPositon(v:Array,num:int):void 
		{
			
		}
		
		private function checkSkillTarget(v:ISoldier):Boolean 
		{
			var skill:ISkill = _curSoldier.getSkill(int(_curTactic.actionValue));
			if (skill == null) {
				return false;
			}
			
			return skill.range >= _curSoldier.getDistance(v.getPosition());
		}
		
		private function checkCondition(condtion:ITacticCondition,v:*):Boolean
		{
			switch(condtion.content) {
				case CompareContent.HP:
					var value1:Number = v.hp;
					break;
				case CompareContent.MP:
					value1 = v.mp;
					break;
				case CompareContent.DISTANCE:
					value1 = _curSoldier.getDistance(v.getPosition());
					break;
				case "underattack":
					value1 = _curSoldier.status.underattack;
					break;
				case "hero":
					value1 = _curSoldier.id;
					break;
				default:
					break;
			}
			
			var value2:Number = condtion.value;
			
			switch(condtion.type) {
				case "=":
					return value1 == value2;
				case ">":
					return value1 > value2;
				case "<":
					return value1 < value2;
				case "t":
					return true;
			}
			
			
			
			return false;
		}
	}
}
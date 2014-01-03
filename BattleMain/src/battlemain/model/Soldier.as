package battlemain.model 
{
	import battlemain.report.ReportBuff;
	import battlemain.report.ReportDamage;
	import battlemain.report.ReportMove;
	import battlemain.report.ReportStatus;
	import flash.geom.Point;
	import sinterface.battle.IDamage;
	import sinterface.battle.ISkill;
	import sinterface.battle.ISoldier;
	import sinterface.game.IAttributeInfo;
	import sinterface.game.ISoldierInfo;
	import sinterface.game.IStatus;
	import tools.data.ListGroup;
	import tools.MapTitleTools;
	
	public class Soldier extends TeamerModel implements ISoldier
	{
		private var _id:int;
		private var _info:ISoldierInfo;
		private var _tactics:Array;
		private var _buffs:Array;
		private var _attr:IAttributeInfo
		private var _status:StatusModel;
		
		public var name:String;
		public var skillData:ListGroup;
		
		private var _lastTime:uint;
		private var _hp:int;
		private var _mp:int;
		private var _dSkills:Array;
		private var _lastPosition:Point;
		
		public var _skillcds:Object;
		
		
		public function Soldier(v:ISoldierInfo) 
		{
			_tactics = new Array();
			_buffs = new Array();
			_skillcds = new Object();
			_dSkills = new Array();
			
			initInfo(v);
			initSkill();
			initStatus();
		}
		
		public function initInfo(v:ISoldierInfo):void
		{
			_info = v;
			_attr = _info.attr.clone();
			_hp = _attr.hp;
			_mp = _attr.mp;
			
			_lastPosition = new Point();
		}		
		
		//TODO:updateTurn
		public function updateTurn():void
		{
			_mp += info.attr.regeneration;
			if (_mp > info.attr.mp) {
				_mp = info.attr.mp;
			}
			_status.updateStatus();
			_lastPosition = getPosition();
		}
		
		public function checkTurn():Boolean
		{
			return _status.stun == 0
		}
		
		public function setData(value:Object):void
		{
			id = value.id;
			team = value.team;
			setPosition(new Point(value.x, value.y));
		}
		
		public function setTactics(value:Array):void
		{
			_tactics = value;
		}
		
		public function getMoveReport(value:Point):Object
		{
			var mReport:ReportMove = new ReportMove();
			mReport.sid = id;
			mReport.from = getPosition();
			mReport.to = value;
			
			var pArr:Array = MapTitleTools.move(getPosition(),value,_info.attr.speed);
			if (pArr.length > 0) {
				setPosition(pArr[pArr.length - 1]);
			}
			mReport.result = getPosition();
			mReport.path = pArr;
			return mReport;
		}
		
		public function getTactics():Array
		{
			return _tactics.concat();
		}
		
		public function getTacticById(v:int):TacticModel
		{
			for (var i:int = 0; i < _tactics.length; i++) 
			{
				if (_tactics[i].id == v) {
					return _tactics[i];
				}
			}
			return null;
		}
		
		//----------------------------------------
		//TODO:skill
		//----------------------------------------
		
		public function initSkill():void
		{
			skillData = new ListGroup();
			
			var tempSkillArr:Array = _info.getSkills();
			for (var i:int = tempSkillArr.length - 1; i > -1; i--) {
				addSkill(new SkillModel(tempSkillArr[i]));
			}
		}
		
		public function getSkills():Array
		{
			return skillData.source;
		}
		
		public function addSkill(value:SkillModel):void
		{
			skillData.add(value);
		}
		
		public function getSkill(id:int):ISkill
		{
			return skillData.getItemById(id);
		}
		
		public function getSkillTime(id:int):int
		{
			return _skillcds[id] ? _skillcds[id] : 0;
		}
		
		public function setSkillTime(id:int,t:int):void
		{
			if (!_skillcds[id]) {
				_skillcds[id] = 0;
			}
			_skillcds[id] = t;
		}
		
		public function setDuSkill(skill:SkillModel):void
		{
			_dSkills.push(skill);
		}
		
		//----------------------------------------
		//TODO:buff
		//----------------------------------------
		public function addBuff(value:BuffModel):void
		{
			if (!value) {
				return;
			}
			executeBuff(value);
			_buffs.push(value);
		}
		
		public function getBuffReport():Array
		{
			var result:Array = new Array();
			for (var i:int = _buffs.length - 1; i >= 0; i--) {
				var bm:BuffModel = _buffs[i];
				if (bm.duration <= 0) {
					_buffs.splice(i, 1);
					continue;
				}
				
				if (bm.nextTime <= GameMain.instance.bf.time) {
					result.push(executeBuff(bm));
				}
			}
			if (result.length == 0) {
				return null;
			}
			return result;
		}
		
		
		private function executeBuff(v:BuffModel):ReportBuff
		{
			v.lastTime = GameMain.instance.bf.time;
			v.duration--;
			
			var result:ReportBuff = new ReportBuff();
			result.buffid = v.info.id;
			result.sid = id;
			
			var damageArr:Array = v.damages;
			for each (var item:DamageModel in damageArr) {
				item.setAdd(v.ad, v.ap);
				result.damageReport.push(getDamageReport(item));
			}
			return result;
		}
		
		public function removeBuff(value:BuffModel):void
		{
			if (_buffs.indexOf(value) > -1) {
				_buffs.splice(_buffs.indexOf(value), 1);
			}
			clearBuff(value);
		}
		
		private function clearBuff(v:BuffModel):void
		{
			var damageArr:Array = v.damages;
			for each (var item:DamageModel in damageArr) {
				
				switch(item.type) {
					case 10:
						_status.resetStatus(10);
						break;
				}
			}
		}
		
		//----------------------------------------
		//TODO:damage
		//----------------------------------------
		
		public function getDamageReport(value:IDamage):Object
		{
			executeDamage(value  as DamageModel);
			
			var result:ReportDamage = new ReportDamage();
			result.sid = id;
			result.damageType = value.type;
			
			switch(value.type) {
				case 1://wuli
				case 2://mofa
				case 3://jiaxue
					result.damage = value.getDamage()
					break;
				default:
					result.damage = value.getDamage()
					break;
			}
			return result;
		}
		
		private function defanceDamage(value:DamageModel):void
		{
			
		}		
		
		private function executeDamage(v:DamageModel):void
		{
			defanceDamage(v);
			
			switch(v.type) {
				case 1://wuli
				case 2://mofa
					hp -= v.getDamage();
					_status.setStatus(1, info.attr.cdTime * 2);
					break;
				case 3://jiaxue
					hp += v.getDamage();
					break;
				case 4://buff
					var buffModel:BuffModel = GameMain.instance.getBuffModel(v.base);
					buffModel.ad = v.ad;
					buffModel.ap = v.ap;
					addBuff(buffModel);
					break;
				case 10://xuanyun
					_status.setStatus(10,v.getDamage());
					break;
				case 12://shuxingzengqiang
					//var dModel:DamageModel = dModelArr[j];
					//var aModel:AttributeModel =  GameData.instance.data.attributes.getItemById(dModel.base);
					
					break;
				default:
					hp -= v.getDamage();
					_status.setStatus(1, info.attr.cdTime * 2);
					break;
			}
		}
		
		//----------------------------------------
		//TODO:status
		//----------------------------------------
		private function initStatus():void 
		{
			_status = new StatusModel();
		}
		
		public function getStatusReport():Object
		{
			return new ReportStatus(this);
		}
		
		
		//----------------------------------------
		//TODO:interface
		//----------------------------------------
		
		public function get lastTime():uint
		{
			return _lastTime;
		}
		
		public function set lastTime(value:uint):void
		{
			_lastTime = value;
		}
		
		public function get nextTime():uint
		{
			return _lastTime + _info.attr.cdTime;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function updateTime():void
		{
			_lastTime += _info.attr.cdTime;
		}
		
		public function get hp():int 
		{
			return _hp;
		}
		
		public function set hp(value:int):void 
		{
			if (value < 0) {
				value = 0;
			}
			_hp = value;
		}
		
		public function get mp():int 
		{
			return _mp;
		}
		
		public function set mp(value:int):void 
		{
			_mp = value;
		}
		
		public function getBuffs():Array
		{
			return null;
		}
		
		public function get info():ISoldierInfo
		{
			return _info;
		}
		
		public function get status():IStatus 
		{
			return _status;
		}
		
		public function get lastPosition():Point 
		{
			return _lastPosition;
		}
		
		public function set lastPosition(value:Point):void 
		{
			_lastPosition = value;
		}
		
		
	}
}
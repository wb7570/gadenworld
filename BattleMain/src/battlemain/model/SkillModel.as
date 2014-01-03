package battlemain.model 
{
	import battlemain.report.ReportDamage;
	import battlemain.report.ReportSkill;
	import flash.geom.Point;
	import sinterface.battle.IDamage;
	import sinterface.battle.ISkill;
	import sinterface.battle.ISoldier;
	import sinterface.game.ISkillInfo;
	
	public class SkillModel implements ISkill
	{
		private var _id:int;
		
		private var _lastTime:uint;
		
		private var _info:ISkillInfo;
		
		public var vectDamage:Vector.<DamageModel>;
		
		public var land:Point;
		
		public function SkillModel(value:ISkillInfo) 
		{
			setSkill(value);
		}
		
		public function setSkill(value:ISkillInfo):void
		{
			id = value.id;
			_info = value;
			
			vectDamage = new Vector.<DamageModel>();
			var tempModels:Array = _info.getDamageModes();
			for (var i:int = tempModels.length - 1; i > -1; i--) {
				vectDamage.unshift(new DamageModel(tempModels[i]));
			}
		}
		
		public function addDamage(value:IDamage):void
		{
			vectDamage.push(value);
		}
		
		public function checkDistance(v:int):Boolean
		{
			return v <= range;
		}
		
		public function checkTarget(d:Point,v:ISoldier=null):Boolean
		{
			return false;
		}
		
		public function getReport(player:ISoldier,targets:Array):Object
		{
			_lastTime += cold;
			
			var result:ReportSkill = new ReportSkill();
			result.sid = player.id;
			result.skillId = id;
			
			if (type == 3 && targets.length > 0) {
				land = targets[0].getPosition();
				(player as Soldier).setDuSkill(this);
			}
			
			var tempArr:Array = [];
			for (var i:int = 0, leni:int = targets.length; i < leni; i++) {
				var targetPlayer:ISoldier = targets[i];
				for (var j:int = 0,lenj:int=vectDamage.length; j < lenj; j++) 
				{
					var damageModel:DamageModel = vectDamage[j] as DamageModel;
					damageModel.setAdd(player.info.attr.attack, player.info.attr.magic);					
					
					
					var dReport:ReportDamage =  targetPlayer.getDamageReport(damageModel) as ReportDamage;
					tempArr.push(dReport);
				}
			}
			result.damageReport = tempArr;
			
			
			player.setSkillTime(id, GameMain.instance.bf.time + cold);
			if (costType > 0) {
				switch(costType)
				{
					case 1:
						player.mp -= cost;
						break;
				}
			}
			
			return result;
		}
		
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
			return _lastTime + _info.cold;
		}
		
		public function get duration():int 
		{
			return _info.duration;
		}
		
		public function get cast():int 
		{
			return _info.cast;
		}
		
		public function get cost():int 
		{
			return _info.cost;
		}
		
		public function get costType():int 
		{
			return _info.costType;
		}
		
		public function get area():int 
		{
			return _info.area;
		}
		
		public function get areaType():int 
		{
			return _info.areaType;
		}
		
		public function get range():int 
		{
			return _info.range;
		}
		
		public function get cold():int 
		{
			return _info.cold;
		}
		
		public function get level():int 
		{
			return _info.level;
		}
		
		public function get type():int 
		{
			return _info.type;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
	}
}
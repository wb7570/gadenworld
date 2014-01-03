package battlefield 
{
	/**
	 * ...
	 * @author 
	 */
	public class Soldier 
	{
		public var id:int;
		public var time:uint;
		public var timeStep:uint;
		public var vectCondition:Vector.<Condition>;
		public var vectSkill:Vector.<SkillModel>;
		public var player:IPlayer;
		public var battle:IBattle;
		
		public function Soldier(value:Object) 
		{
			
		}
		
		public function get nextTime():uint
		{
			return time + timeStep;
		}
		
		public function getRepoet(nowTime:Number,player:IPlayer,battle:IBattle):Object
		{
			this.player = player;
			this.battle = battle;
			time = nowTime;
			
			var result:Object = {};
			for (var i:int = 0,leni:int=vectCondition.length; i < leni; i++) {
				if (checkCondition(vectCondition[i]))
				{
					var targets:Array = getTargets(vectCondition[i]);
				}
			}
			return result;
		}
		
		private function getTargets(value:Condition):Array 
		{
			var result:Array = [];
			switch(value.targetType) {
				case TargetType.ONESELF:
					var tempTargets:Array = [player];		
					break;
				case TargetType.ENEMY:
					tempTargets = battle.getEnemyTeam(player);
					break;
				case TargetType.TEAMMATE:
					tempTargets = battle.getMyTeam(player);
					break;
			}
			
			
			for (var i:int = 0, leni:int = tempTargets.length; i < leni; i++) {
				
			}
			
			return result;
		}
		
		private function checkCondition(value:Condition):Boolean 
		{
			switch(value.actionType) {
				case ActionType.SKILL:
					if (!checkSkill(value.actionValue))
					{
						return false;
					}					
					return true;
					break;
			}
			
			return false;
		}
		
		private function checkSkill(id:int):Boolean
		{
			var sModel:SkillModel = getSkill(id);
			if (sModel == null) {
				return false;
			}
			
			if (sModel.nextTime > time) {
				return false;
			}
			
			
			return false;
		}
		
		public function getSkill(id:int):SkillModel
		{
			for (var i:int = 0,leni:int=vectSkill.length; i < leni; i++) {
				if (vectSkill[i].id == id)
				{
					return vectSkill[i];
				}
			}
			return null;
		}
	}

}
package battlemain.model 
{
	import sinterface.battle.ISoldier;
	import sinterface.game.ITacticInfo;
	
	public class TacticModel implements ITacticInfo
	{
		private var _heroId:int;
		private var _id:int;
		private var _actionType:String;
		private var _actionValue:String;
		private var _actionConditions:Array;
		private var _targetNum:int;
		private var _targetType:String;
		private var _targetConditions:Array;
		
		
		public function TacticModel(v:Object=null) 
		{
			if (v) {
				setData(v);
			}
		}
		
		public function setData(v:Object):void
		{
			heroId = v.heroId;
			id = v.id;
			actionType = v.actionType;
			actionValue = v.actionValue;
			targetType = v.targetType;
			targetNum = v.targetNum;
			_actionConditions = getConditionArr(v.actionConditions);
			_targetConditions = getConditionArr(v.targetConditions);
		}
		
		private function getConditionArr(v:Array):Array
		{
			var result:Array = new Array();
			
			for (var i:int = 0; i < v.length; i++) {
				result.push(new TacticConditionModel(v[i]));
			}
			
			return result;
		}
		
		public function getTargetCondition():Array
		{
			return _targetConditions.concat();
		}
		
		public function getActionCondition():Array
		{
			return _actionConditions;
		}
		
		public function get actionType():String 
		{
			return _actionType;
		}
		
		public function set actionType(value:String):void 
		{
			_actionType = value;
		}
		
		public function get targetNum():int 
		{
			return _targetNum;
		}
		
		public function set targetNum(value:int):void 
		{
			_targetNum = value;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get targetType():String 
		{
			return _targetType;
		}
		
		public function set targetType(value:String):void 
		{
			_targetType = value;
		}
		
		public function get actionValue():String 
		{
			return _actionValue;
		}
		
		public function set actionValue(value:String):void 
		{
			_actionValue = value;
		}
		
		public function get heroId():int 
		{
			return _heroId;
		}
		
		public function set heroId(value:int):void 
		{
			_heroId = value;
		}
		
		
		//public function getReport(player:ISoldier,targets:Array):Object
		//{
			//(player as Soldier).updateTime();
			//switch(_actionType) {
				//case "skill":
					//var skillbase:SkillModel = player.getSkill(_actionValue) as SkillModel;
					//return skillbase.getReport(player,targets);
					//break;
				//case "closed":
					//var tempD:int = player.getDistance(targets[0].getPosition());
					//var tempT:IPlayer = targets[0];
					//for (var i:int = 1,leni:int=targets.length; i < leni; i++) {
						//if (player.getDistance(targets[i].getPosition()) < tempD)
						//{
							//tempT = targets[i];
						//}
					//}
					//return player.getClosedReport(tempT.getPosition());
				//case "move":
					//return player.getMoveReport(_targetValue);
				//case "keep":
					//return player.getKeepReport(getPlayerById(_targetValue).getPosition());
			//}
			//return null;
		//}
		
		//private function getPlayerById(value:int):ISoldier
		//{
			//return Main.instance.gameMain.bf.getPlayerById(value);
		//}
	}
}
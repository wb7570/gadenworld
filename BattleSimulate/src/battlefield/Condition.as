package battlefield 
{
	/**
	 * ...
	 * @author 
	 */
	public class Condition 
	{
		public var id:int;
		
		public var order:int;
		
		/**
		 * 比较内容
		 */
		public var compareContent:String;
		
		/**
		 * 比较类型
		 */
		public var comparisonType:String;
		/**
		 * 比较值
		 */
		public var comparisonValue:int
		
		/**
		 * 动作类型
		 */
		public var actionType:String;
		/**
		 * 动作值
		 */
		public var actionValue:Object;
		/**
		 * 目标类型
		 */
		public var targetType:String;
		/**
		 * 目标数量
		 */
		public var targetNum:int;
		
		public function Condition() 
		{
			
		}
		
		
		public function isReady():Boolean
		{
			return false;
		}
		
		public function actionIsReady():Boolean
		{
			
			switch(actionType) {
				case ActionType.SKILL:
					
					break;
			}
			
			return false;
		}
	}

}
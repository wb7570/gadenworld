package sinterface.game 
{
	
	public interface ITacticCondition 
	{
		/**
		 * 比较内容
		 */
		function get content():String;
		
		/**
		 * 比较类型
		 */
		function get type():String;
		/**
		 * 比较值
		 */
		function get value():int
	}
	
}
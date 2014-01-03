package sinterface.battle 
{
	
	public interface ITactic 
	{		
		/**
		 * 比较内容
		 */
		function get compareContent():String;
		
		/**
		 * 比较类型
		 */
		function get comparisonType():String;
		/**
		 * 比较值
		 */
		function get comparisonValue():int
		
		/**
		 * 动作类型
		 */
		function get actionType():String;
		/**
		 * 动作值
		 */
		function get actionValue():int;
		/**
		 * 目标类型
		 */
		function get targetType():String;
		/**
		 * 目标数量
		 */
		function get targetNum():int;
		
		function get targetValue():*;
		
		function getReport(player:ISoldier, targets:Array):Object;
		
		
	}
}
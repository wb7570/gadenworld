package sinterface.game 
{
	public interface ITacticInfo 
	{
		
		function get id():int;
		function get actionType():String;
		function get targetType():String;
		function get targetNum():int;
		function get actionValue():String;
		
		function getTargetCondition():Array
		function getActionCondition():Array
		
	}

}
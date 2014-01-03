package sinterface.game 
{
	public interface ISoldierInfo 
	{
		function get id():int 
		
		function get name():String 
		
		function get icon():String 
		
		function get symbol():String 
		
		function get attr():IAttributeInfo 
		
		function get base():IAttributeInfo 
		
		function get mult():IAttributeInfo 
		
		function get team():int 
		
		function set team(value:int):void 
		
		function get profession():String 
		
		function getSkills():Array
	}
}
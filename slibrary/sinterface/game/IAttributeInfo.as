package sinterface.game 
{
	public interface IAttributeInfo 
	{
		function get id():int
		function get hp():int
		function set hp(value:int):void 
		function get mp():int
		function set mp(value:int):void 
		function get cdTime():int
		function set cdTime(value:int):void 
		function get speed():int
		function set speed(value:int):void 
		function get attack():int
		function set attack(value:int):void 
		function get magic():int
		function set magic(value:int):void 
		function get type():int 
		function set type(value:int):void 
		function get regeneration():int 
		function set regeneration(value:int):void 
		function clone():IAttributeInfo
	}
}
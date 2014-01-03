package sinterface 
{
	/**
	 * ...
	 * @author 
	 */
	public interface IPlayerInfo 
	{
		function get id():int
		function get hp():int
		function set hp(value:int):void
		function get mp():int
		function set mp(value:int):void
		function get attackdistance():int
		function set attackdistance(value:int):void
		function get cdTime():int
		function set cdTime(value:int):void
		function get speed():int
		function set speed(value:int):void
		function get attack():int
		function set attack(value:int):void
		function get magic():int		
	}
}
package sinterface.battle 
{
	
	/**
	 * ...
	 * @author 
	 */
	public interface ITimer 
	{
		function get id():int;
		function get lastTime():uint;
		function set lastTime(value:uint):void;
		function get nextTime():uint;
		function updateTime():void;
	}
	
}
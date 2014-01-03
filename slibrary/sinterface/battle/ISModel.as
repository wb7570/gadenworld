package sinterface.battle
{
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author 
	 */
	public interface ISModel extends IEventDispatcher
	{
		function getDefinition(value:String):*;
		
		function get modelType():String;
		
		function get modelName():String;
		
		function set modelName(value:String):void
		
		function init():void
	}
}
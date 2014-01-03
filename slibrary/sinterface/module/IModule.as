package sinterface.module 
{
	
	public interface IModule 
	{
		function getDefinition(value:String):*;
		
		function get modelType():String;
		
		function get modelName():String;
		
		function set modelName(value:String):void
		
		function init(v:Object=null):void
	}
	
}
package 
{
	import battlefield.Condition;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import sinterface.ISModel;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite implements ISModel
	{
		
		public function Main():void 
		{
			
			//new Condition();
			
			//var d:* = getDefinition("battlefield.Condition");
		}
		
		public function getDefinition(value:String):*
		{
			return ApplicationDomain.currentDomain.getDefinition(value);
		}
		
		public function get modelType():String
		{
			
		}
		
		public function get modelName():String
		{
			
		}
		
		public function set modelName(value:String):void
		{
			
		}
		
		public function init():void
		{
			
		}
	}
}
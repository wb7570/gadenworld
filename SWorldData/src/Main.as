package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import sinterface.ISModel;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite
	{
		
		public function Main():void 
		{
			//if (stage) init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//private function init(e:Event = null):void 
		//{
			//removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			//
			//
		//}
		
		public function get modelType():String
		{
			return "sWorldData";
		}
		
		
		private var _modelName:String;
		public function get modelName():String
		{
			return _modelName;
		}
		
		public function set modelName(value:String):void
		{
			_modelName = value;
		}
		
		public function getDefinition(value:String):*
		{
			if (ApplicationDomain.currentDomain.hasDefinition(value) == false) {
				return null;
			}
			return ApplicationDomain.currentDomain.getDefinition(value);
		}
	}
	
}
package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import sinterface.module.IGameUI;
	import starling.core.Starling;
	import sui.GameWindows;
	
	public class GameUI extends Sprite implements IGameUI
	{
		static public var instance:GameUI;
		
		public var starling:Starling;
		public var data:Object;
		
		public function GameUI() 
		{
			instance = this;
			//addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		//private function addToStageHandler(e:Event):void 
		//{
			//removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			
			
		//}
		
		public function setData(v:Object):void
		{
			data = v;
		}
		
		public function getDefinition(value:String):*
		{
			return null;
		}
		
		public function get modelType():String
		{
			return "gameui";
		}
		
		public function get modelName():String
		{
			return "gameui";
		}
		
		public function set modelName(value:String):void
		{
			
		}
		
		public function init(v:Object=null):void
		{
			data = v
			starling = new Starling(GameWindows, stage);
			starling.start();
		}
	}

}
package  
{
	import field.BattlefieldMain;
	import flash.display.Sprite;
	import flash.events.Event;
	import sinterface.battle.IBattlefield;
	import starling.core.Starling;
	/**
	 * ...
	 * @author 
	 */
	public class SBattlefield extends Sprite implements IBattlefield
	{
		static public var instance:SBattlefield;
		
		private var _starling:Starling;
		public var mapInfo:Object;
		//public var bf:IBattle;
		
		public function SBattlefield() 
		{
			instance = this;
			mapInfo = new Object();
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			
			//if (bf) {
				_starling = new Starling(BattlefieldMain, stage);
				_starling.start();
			//}
		}
		
		public function getDefinition(value:String):*
		{
			return null;
		}
		
		public function get modelType():String
		{
			return "BattlefieldMain"
		}
		
		public function get modelName():String
		{
			return "BattlefieldMain"
		}
		
		public function set modelName(value:String):void
		{
			
		}
		
		public function init():void
		{
			
		}
		
		public function setBattleField(value:IBattle):void
		{
			//bf = value;
			//if (stage) {
				//_starling = new Starling(BattlefieldMain, stage);
				//_starling.start();
			//}
			
		}
		
		public function setMap(symbol:String, positions:Array):void
		{
			mapInfo.symbol = symbol;
			mapInfo.positions = positions;
		}
		
		public function setHeros(value:Array):void
		{
			
		}
		
		public function setReport(value:Array):void
		{
			BattlefieldMain.instance.setReport(value);
		}
	}

}
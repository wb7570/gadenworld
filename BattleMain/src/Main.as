package 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import sinterface.battle.ISModel;
	import tools.AssetTool;
	import tools.load.LoaderManager;
	import tools.LoaderTool;
	import tools.MapTitleTools;
	import tools.queue.Queue;
	import tools.queue.QueueCallbackMethod;
	
	public class Main extends Sprite 
	{
		static public var instance:Main;
		
		public var manager:SModelManager;
		public var gameMain:GameMain;
		
		public function Main():void 
		{
			instance = this;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			//ApplicationDomain.currentDomain.domainMemory.
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			manager = new SModelManager();
			
			var context:LoaderContext = new LoaderContext(true,new ApplicationDomain());
			//LoaderTool.load(LoaderTool.TEXT, "lowerbody.xml",xmlLoadComplete,["lowerbody"]);
			//LoaderTool.load(LoaderTool.TEXT, "upperbody.xml",xmlLoadComplete,["upperbody"]);
			//LoaderTool.load(LoaderTool.TEXT, "head.xml",xmlLoadComplete,["head"]);
			//LoaderTool.load(LoaderTool.TEXT, "weapon.xml",xmlLoadComplete,["weapon"]);
			//LoaderTool.load(LoaderTool.BMD, "lowerbody.png",bmdLoadComplete,["lowerbody"]);
			//LoaderTool.load(LoaderTool.BMD, "upperbody.png",bmdLoadComplete,["upperbody"]);
			//LoaderTool.load(LoaderTool.BMD, "head.png",bmdLoadComplete,["head"]);
			//LoaderTool.load(LoaderTool.BMD, "weapon.png",bmdLoadComplete,["weapon"]);
			//LoaderTool.load(LoaderTool.SWF, "assets.swf", null, null, null);
			//LoaderTool.load(LoaderTool.SWF, "SBattlefield.swf", loadComplete2, null, null);
			LoaderTool.load(LoaderTool.SWF, "GameData.swf", loadComplete2, null, null);
			LoaderTool.load(LoaderTool.SWF, "BattleSimulate.swf", loadComplete, null, null);
			//LoaderTool.load(LoaderTool.SWF, "BattlefieldModule.swf", loadComplete, null, null);
			
		}
		
		private function xmlLoadComplete(txt:String,key:String):void 
		{
			AssetTool.addXml(key,new XML(txt));
		}
		
		private function bmdLoadComplete(bmd:BitmapData,key:String):void 
		{
			AssetTool.addBmd(key,bmd);
		}
		
		private function loadComplete2(e:DisplayObjectContainer):void 
		{
			manager.addModel(e as ISModel);
		}
		
		private function loadComplete(e:DisplayObjectContainer):void 
		{
			manager.addModel(e as ISModel);
			
			gameMain = new GameMain();
			gameMain.init();
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			gameMain.gameTurn();
		}
		
		//private function creatMap():void 
		//{
			//var map:Sprite = new Sprite();
			//
			//MapTitleTools.initTools(50, 40);
			//var pArr:Array = MapTitleTools.getTitle6Postions(20, 20);
			//for (var i:int = 0,leni:int=pArr.length; i < leni; i++) 
			//{
				//var cl:* = ApplicationDomain.currentDomain.getDefinition("assets.title6");
				//var spTitle:Sprite = new cl()
				//spTitle.x = pArr[i].x;
				//spTitle.y = pArr[i].y;
				//map.addChild(spTitle);
			//}
			//addChild(map);
			//
			//map.addEventListener(MouseEvent.CLICK, map_clickHandler);
		//}
		
		private function map_clickHandler(e:MouseEvent):void 
		{
			trace(mouseX, mouseY, MapTitleTools.getIndexPositions(mouseX, mouseY));
		}
	}
}
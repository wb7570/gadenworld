package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import module.ModuleBase;
	import sinterface.module.IBattleSimulate;
	import sinterface.module.IBattleWorldModule;
	import sinterface.module.IGameData;
	import sinterface.module.IGameUI;
	import tools.data.ListGroup;
	import tools.queue.Queue;
	import tools.queue.QueueMethod;
	public class BattleMain extends Sprite
	{
		//public var moduleData:ModuleBase;
		//public var moduleSimulate:ModuleBase;
		
		static public var instance:BattleMain;
		
		public var modules:ListGroup;
		public var gameMain:GameMain;
		
		public function BattleMain() 
		{
			instance = this;
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			modules = new ListGroup("name");
			var moduleArr:Array = getModuleInfo();
			var queueArr:Array = new Array();
			
			for (var i:int = 0; i < moduleArr.length; i++) {
				var d:Object = moduleArr[i]
				var mBase:ModuleBase = new ModuleBase(d.id, d.url)
				modules.add(mBase);
				
				if (d.type == 1)
				{
					queueArr.push(mBase);
				}
			}
			queueArr.push(new QueueMethod(loadComplete));
			new Queue(queueArr).execute();
			
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			gameMain.gameTurn();
		}
		
		private function loadComplete():void
		{
			startGame();
		}
		
		private function startGame():void 
		{
			gameMain = new GameMain();
			gameMain.mGameData = modules.getItemById("gameData").content as IGameData;
			gameMain.mSimulate = modules.getItemById("battleSimulate").content as IBattleSimulate;
			gameMain.mWorld = modules.getItemById("battleworld").content as IBattleWorldModule;
			gameMain.mUI = modules.getItemById("gameUI").content as IGameUI
			
			//addChild(gameMain.mWorld as DisplayObject);
			addChild(gameMain.mUI as DisplayObject);
			gameMain.init();
		}
		
		private function getModuleInfo():Array
		{
			var result:Array = [
			
			{id:"gameData",url:"GameData.swf",type:1}
			,{id:"battleSimulate", url:"BattleSimulate.swf", type:1 }
			,{id:"battleworld", url:"BWS.swf", type:1 }
			,{id:"gameUI", url:"GameUI.swf", type:1 }
			
			
			,{id:"battlefield",url:"Battlefield.swf",type:2}
			
			]
			
			
			return result;
		}
	}
}
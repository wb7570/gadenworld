package  
{
	import battlemain.BattleField;
	import battlemain.model.BuffModel;
	import battlemain.model.DamageModel;
	import battlemain.model.Soldier;
	import battlemain.model.TacticModel;
	import battlemain.report.ReportMove;
	import flash.geom.Point;
	import flash.text.TextField;
	import rpc.RpcServer;
	import sinterface.battle.ISWorldBattle;
	import sinterface.game.IBuffInfo;
	import sinterface.game.IHeroInfo;
	import sinterface.game.ISoldierInfo;
	import sinterface.game.IUserInfo;
	import sinterface.module.IBattleSimulate;
	import sinterface.module.IBattleWorldModule;
	import sinterface.module.IGameData;
	import sinterface.module.IGameUI;
	import tools.data.ListArrayGroup;
	import tools.data.ListGroup;
	import tools.LayoutTool;
	import tools.MapTitleTools;
	
	public class GameMain 
	{
		static public var instance:GameMain
		
		private var bModel:ISWorldBattle;
		
		public var bf:BattleField;
		public var server:RpcServer;		
		private var _myTactic:ListArrayGroup;
		
		public var userData:IUserInfo;
		public var mGameData:IGameData;
		public var mSimulate:IBattleSimulate;
		public var mWorld:IBattleWorldModule;
		public var mUI:IGameUI
		private var _heroId:int;
		
		private var _txtGroup:Object;
		
		public function GameMain() 
		{
			instance = this;
			server = new RpcServer();
			
			_heroId = 0;
		}
		
		public function init():void
		{
			//server.aSend("getInfo",null,getInfoHandler);
			mGameData.init();
			mSimulate.init();
			MapTitleTools.initTools(20);
			userData = mGameData.getUser();
			bf = new BattleField();
			initMyTatic()
			
			start();
		}
		
		//private function getInfoHandler(value:Object=null):void 
		//{
			//MapTitleTools.initTools(80, 48);
			//bModel =  Main.instance.manager.getModel("battleSimulate") as ISWorldBattle;
			//start();
		//}
		
		public function start():void
		{
			var team1:Array = getSoldier(userData.getHeros(),0);
			var team2:Array = getSoldier(userData.getHeros(),1);
			
			bf = new BattleField();
			bf.addSoldiers(team1);
			bf.addSoldiers(team2);
			bf.setMapdata( 
			{ team1: { point:new Point(2,2), formation: {5:new Point(0,0),6:new Point(0,1),7:new Point(0,2),8:new Point(0,3) } }
			, team2: { point:new Point(12, 12), formation: {1:new Point(0,0),2:new Point(0,1),3:new Point(0,2),4:new Point(1,2) } } } 
			);
			
			mWorld.initMap(20);
			mWorld.initSoldier(bf.getSoldiers());
			
			
			//initUI();
			gameTurn();
			
			mUI.init( { heros:bf.getSoldiers() } );
			
		}
		
		public function getSoldier(heros:Array,team:int):Array
		{
			
			var result:Array = new Array();
			var i:int = 0;
			for each (var item:IHeroInfo in heros) {
				i++;
				_heroId++;
				var sInfo:ISoldierInfo = item.getSoldier();
				var soldier:Soldier = new Soldier(sInfo);
				soldier.team = team;
				soldier.id = _heroId;
				soldier.name = sInfo.name;
				
				var tArr:Array = _myTactic.getItemById(sInfo.id);
				tArr.sortOn("id", Array.NUMERIC);
				soldier.setTactics(tArr);
				result.push(soldier);
			}
			
			return result;
		}
		
		private var _id:int;
		public function gameTurn():void 
		{			
			var report:Object = mSimulate.getRport(bf);
			if (report.end == 1) {
				//trace("11111");
				mWorld.addReport(report.report);
			}else {
				//show(report.report);
				bf.time += 4;
				mWorld.addReport(report.report);
			}
			
			
			//_id = setTimeout(gameTurn, 1000);
		}
		
		private function showHp():void 
		{
			for each (var item:Soldier in bf.getSoldiers()) 
			{
				trace(item.id, item.hp);
			}
		}
		
		private function show(report:Array):void 
		{			
			var s:String = "\n时间:" + bf.time;
			for each (var arr:Object in report) 
			{
				if (arr is Array) {
					for each (var item:Object in arr) 
					{
						if (item is ReportMove) {
						
						}else {
							s += "\n" + item.toString();
						}
					}
				}else {
					s += "\n" + arr.toString();
				}
				
				
			}
			
			var txt:TextField = _txtGroup["info"];
			txt.appendText( "\n" + s);
			txt.scrollV = int.MAX_VALUE;
			showInfo()
		}
		
		public function setTactic(value:Array):void
		{
			_myTactic = ListGroup.createListArrayGroup(value,TacticModel,"heroId");
		}
		
		
		private function getTacticInfo():Array 
		{			
			var result:Array = [
			
			//zhan	
			{heroId:1,id:1,actionType:"skill",targetType:"enemy",actionValue:8,actionConditions:[],targetConditions:[{content:"hp",type:"<",value:"100"}],targetNum:1}
			,{heroId:1,id:2,actionType:"skill",targetType:"enemy",actionValue:1,actionConditions:[],targetConditions:[{content:"hp",type:"<",value:"120"}],targetNum:1}
			,{heroId:1,id:3,actionType:"skill",targetType:"enemy",actionValue:1,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:1,id:4,actionType:"move",targetType:"enemy",actionValue:0,actionConditions:[],targetConditions:[],targetNum:1}
			//fa
			,{heroId:2,id:1,actionType:"skill",targetType:"enemy",actionValue:9,actionConditions:[],targetConditions:[{content:"distance",type:"<",value:4}],targetNum:2}
			,{heroId:2,id:2,actionType:"skill",targetType:"enemy",actionValue:5,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:2,id:3,actionType:"skill",targetType:"enemy",actionValue:2,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:2,id:4, actionType:"move", targetType:"enemy", actionValue:0, actionConditions:[], targetConditions:[], targetNum:1 }
			//dao
			,{heroId:3,id:1,actionType:"move",targetType:"oneself",actionValue:1,actionConditions:[],targetConditions:[{content:"hp",type:"<",value:"100"},{content:"underattack",type:">",value:"0"}],targetNum:1}
			,{heroId:3,id:2,actionType:"skill",targetType:"enemy",actionValue:6,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:3,id:3,actionType:"skill",targetType:"enemy",actionValue:3,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:3,id:4, actionType:"move", targetType:"enemy", actionValue:0, actionConditions:[], targetConditions:[], targetNum:1 }
			//mu
			,{heroId:4,id:2,actionType:"skill",targetType:"teammate",actionValue:7,actionConditions:[],targetConditions:[{content:"hp",type:"<",value:"100"}],targetNum:1}
			,{heroId:4,id:3,actionType:"skill",targetType:"enemy",actionValue:4,actionConditions:[],targetConditions:[],targetNum:1}
			,{heroId:4,id:4, actionType:"move", targetType:"enemy", actionValue:0, actionConditions:[], targetConditions:[], targetNum:1 }
			
			//,{heroId:102,id:1,actionType:"skill",targetType:"enemy",actionValue:1,actionConditions:[],targetConditions:[],targetNum:1}
			//,{heroId:102,id:2,actionType:"move",targetType:"enemy",actionValue:0,actionConditions:[],targetConditions:[],targetNum:1}
			//,{heroId:103,id:1,actionType:"skill",targetType:"enemy",actionValue:1,actionConditions:[],targetConditions:[],targetNum:1}
			//,{heroId:103,id:2,actionType:"move",targetType:"enemy",actionValue:0,actionConditions:[],targetConditions:[],targetNum:1}
			]
			
			return result;
		}
		
		
		//----
		//TODO:static data
		//----
		
		public function getBuffModel(id:int):BuffModel
		{
			var buff:IBuffInfo = (mGameData.getStaticData().buff as ListGroup).getItemById(id);
			if (buff) {
				return new BuffModel(buff);
			}
			return null;
		}
		
		public function getDamageModels(id:int):Array
		{
			var arr:Array = (mGameData.getStaticData().damage as ListGroup).getItemById(id);
			
			var result:Array = new Array();
			for (var i:int = 0; i < arr.length; i++) {
				result.push(new DamageModel(arr[i]));
			}
			return result;
		}
		
		
		//----
		//TODO:UI
		//----
		private function initUI():void 
		{
			_txtGroup = new Object();
			
			var arr:Array = bf.getSoldiers();
			var temp1:Array = new Array();
			var temp2:Array = new Array();
			
			var txt:TextField = new TextField();
			txt.text = "team1";
			txt.x = 10;
			txt.height = 18;
			txt.width = 260;
			BattleMain.instance.addChild(txt);
			temp1.push(txt);
			
			txt = new TextField();
			txt.text = "team2";
			txt.x = 300;
			txt.height = 18;
			txt.width = 260;
			BattleMain.instance.addChild(txt);
			temp2.push(txt);
			
			for each (var item:Soldier in arr) {
				txt = new TextField();
				txt.name = "s" + item.id;
				
				txt.text = getInfo(item);
				_txtGroup[txt.name] = txt;
				txt.height = 38;
				txt.width = 260;
				//txt.x = item.team == 0 ? 10 : 300;
				
				if (item.team == 0) {
					txt.x = 10;
					temp1.push(txt);
				}else {
					txt.x = 300;
					temp2.push(txt);
				}
				
				BattleMain.instance.addChild(txt);
			}
			
			LayoutTool.arrangeY(5, temp1);
			LayoutTool.arrangeY(5, temp2);
			
			txt = new TextField();
			txt.y = 200;
			txt.width = 400;
			txt.height = 300;
			txt.name = "info";
			_txtGroup[txt.name] = txt;
			BattleMain.instance.addChild(txt);
		}
		
		private function showInfo():void
		{
			var arr:Array = bf.soldiers;
			for each (var item:Soldier in arr) {
				var txt:TextField = _txtGroup["s" + item.id];
				txt.text = getInfo(item);
			}
		}
		
		private function getInfo(v:Soldier):String
		{
			return v.name + " \t" + fixNum(v.hp) + "/" + fixNum(v.info.attr.hp) + " \t" +  fixNum(v.mp) + "/" + fixNum(v.info.attr.mp) + " \n" + v.nextTime + "\t" + v.getPosition().toString();
		}
		
		private function fixNum(v:int):String
		{
			return String("000" + v).slice( -3);
		}
	}
}
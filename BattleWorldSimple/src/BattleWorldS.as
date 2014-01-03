package  
{
	import battleworlds.Avatar;
	import battleworlds.MapTitle6;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	import sinterface.battle.ISoldier;
	import sinterface.module.IBattleWorldModule;
	import sui.popup.PopupBase;
	import tools.data.ListGroup;
	import tools.MapTitleTools;
	
	public class BattleWorldS extends Sprite implements IBattleWorldModule
	{
		private var box:Sprite;
		private var _soldierGroup:ListGroup;
		private var _report:Array;
		private var _playing:Boolean;
		public var mapInfo:Object;
		
		static public var instance:BattleWorldS;
		
		public function BattleWorldS() 
		{
			instance = this;
			
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			_soldierGroup = new ListGroup();
			_report = new Array();
			_playing = false;
			mapInfo = new Object();
			box = new Sprite();
			addChild(box);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			//initMap(30);
			initEvent();
			
			//var p:PopupBase = new PopupBase();
			//p.x = p.y = 200;
			//addChild(p);
		}
		
		private function initEvent():void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		
		private var _overAvatar:Avatar;
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			//trace(MapTitleTools.getIndexPositions(box.mouseX, box.mouseY),mouseX,mouseY);
			var p:Point = MapTitleTools.getIndexPositions(box.mouseX, box.mouseY);
			var oa:Avatar = mapInfo[p.x * 100 + p.y];
			if (oa) {
				if (_overAvatar) {
					if (_overAvatar != oa) {
						_overAvatar.hideTips();
						_overAvatar = oa;
						_overAvatar.showTips();
					}
				}else {
					_overAvatar = oa;
					_overAvatar.showTips();
				}
				
			}else {
				if (_overAvatar) {
					_overAvatar.hideTips();
					_overAvatar = null;
				}
			}
			
			
		}
		
		public function initMap(v:int):void
		{
			MapTitleTools.initTools(v);
			trace("wh:", MapTitleTools.tw, MapTitleTools.th);
			
			var arr:Array = MapTitleTools.getTitle6Postions(20, 20);
			for (var i:int = 0; i < arr.length; i++) 
			{
				var t:DisplayObject = getTilte();
				t.x = arr[i].x;
				t.y = arr[i].y;
				box.addChild(t);
			}
		}
		
		private function getTilte():DisplayObject
		{
			return new MapTitle6();
		}
		
		
		public function initSoldier(v:Array):void
		{
			for each (var item:ISoldier in v) {
				var a:Avatar = getSolider(item);
				var p:Point = item.getPosition();
				mapInfo[p.x * 100 + p.y] = a;
				p = MapTitleTools.getMapPosition(p.x, p.y);
				a.x = p.x;
				a.y = p.y;
				box.addChild(a);
				_soldierGroup.add(a);
			}
		}
		
		private function getSolider(item:ISoldier):Avatar 
		{
			var a:Avatar = new Avatar();
			a.initAvatar(item);
			return a;
		}
		
		public function addReport(v:Array):void
		{
			_report = _report.concat(v);
			
			if (_playing == false && _report.length > 0) {
				_playing = true;
				playReport();
			}
		}
		
		private function playReport(v:int=0):void 
		{
			if (_report.length == 0) {
				_playing = false;
				return;
			}
			
			var report:Object = _report.shift();
			
			if (v != 0 && v != report.time) {
				_report.unshift(report);
				setTimeout(playReport, 2000);
				return;
			}
			
			
			switch(report.type) {
				case "move":
					var a:Avatar = _soldierGroup.getItemById(report.sid);
					
					mapInfo[report.from.x * 100 + report.from.y] = null;
					mapInfo[report.result.x * 100 + report.result.y] = a;
					//a.setPosition(MapTitleTools.getMapPosition(report.result.x, report.result.y));
					a.moveFollowPath(report.path);
					break;
				case "skill":
					var a1:Avatar = _soldierGroup.getItemById(report.sid);
					a1.exSkill(1);
					var drArr:Array = report.damageReport;
					for (var i:int = 0; i < drArr.length; i++) {
						var a2:Avatar = _soldierGroup.getItemById(drArr[i].sid);
						a2.addHP( -drArr[i].damage);
					}
					break;
				case "result":
					
					break;
			}
			
			//playReport(report.time);
			setTimeout(playReport, 2000);
		}
		
		public function getDefinition(value:String):*
		{
			
		}
		
		public function get modelType():String
		{
			return "battleWorld";
		}
		
		public function get modelName():String
		{
			return "battleWorld";
		}
		
		public function set modelName(value:String):void
		{
			
		}
		
		public function init(v:Object=null):void
		{
			
		}
	}
}
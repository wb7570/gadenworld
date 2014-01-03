package field 
{
	import feathers.themes.AeonDesktopTheme;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.setTimeout;
	import sinterface.IBattle;
	import sinterface.IPlayer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import tools.AssetTool;
	import tools.data.ListGroup;
	import tools.MapTitleTools;
	/**
	 * ...
	 * @author 
	 */
	public class BattlefieldMain extends Sprite 
	{
		static public var instance:BattlefieldMain;
		
		protected var theme:AeonDesktopTheme;
		
		
		public var land:BLand;
		
		private var _groupAvatar:ListGroup
		
		public function BattlefieldMain() 
		{
			instance = this;
			_reports = new Array();
			_groupAvatar = new ListGroup();
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			theme = new AeonDesktopTheme(stage);
			
			
			land = new BLand();
			addChild(land);
			
			createHero();
			
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		private function touchHandler(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.MOVED)
			if (touch) {
				x -= touch.previousGlobalX - touch.globalX;
				y -= touch.previousGlobalY - touch.globalY;
			}
			
			//var touch:Touch = e.getTouch(stage, TouchPhase.MOVED)
		}
		
		private function createHero():void 
		{
			var bf:IBattle = SBattlefield.instance.bf;
			
			var players:Vector.<IPlayer> = bf.getPlayers();
			
			
			for (var i:int = 0,leni:int=players.length; i < leni; i++) {
				var info:Object = players[i].getHeroInfo();
				
				var symbol:String = info.symbol;
				
				symbol = "";
				
				var lowerbodyXml:XML = AssetTool.getXml("lowerbody");
				var upperbodyXml:XML = AssetTool.getXml("upperbody");
				var headXml:XML = AssetTool.getXml("head");
				var weaponXml:XML = AssetTool.getXml("weapon");
				
				var lowerbodyBmd:BitmapData = AssetTool.getBmd("lowerbody");
				var upperbodyBmd:BitmapData = AssetTool.getBmd("upperbody");
				var headBmd:BitmapData = AssetTool.getBmd("head");
				var weaponBmd:BitmapData = AssetTool.getBmd("weapon");
			
				
				var atlaslowerbody:TextureAtlas = new TextureAtlas(Texture.fromBitmapData(lowerbodyBmd), lowerbodyXml);
				var atlasupperbody:TextureAtlas = new TextureAtlas(Texture.fromBitmapData(upperbodyBmd), upperbodyXml);
				var atlashead:TextureAtlas = new TextureAtlas(Texture.fromBitmapData(headBmd), headXml);
				var atlasweapon:TextureAtlas = new TextureAtlas(Texture.fromBitmapData(weaponBmd), weaponXml);
				
				var avatar:HeroAvatar = new HeroAvatar();
				avatar.initMovie(atlaslowerbody, atlasupperbody, atlashead, atlasweapon);
				avatar.id = info.id;
				avatar.setPoint(MapTitleTools.getMapPosition(players[i].getPosition().x,players[i].getPosition().y));
				//avatar.x = 100 + i * 100;
				//avatar.y = 300;
				addChild(avatar);
				_groupAvatar.add(avatar);
			}
		}
		
		public function getAvatar(id:int):HeroAvatar
		{
			return _groupAvatar.getItemById(id);
		}
		
		
		private var _reports:Array;
		private var _play:Boolean = false;
		public function setReport(value:Array):void
		{
			
			_reports = _reports.concat(value);
			
			if (_play == false) {
				_play = true;
				playReport();
			}
			
			
		}
		
		private function foceAvatar(v:HeroAvatar):void
		{
			x = v.x - stage.x / 2;
			y = v.y - stage.y / 2;
		}
		
		private function playReport():void 
		{
			if (_reports.length == 0) {
				_play = false;
				return;
			}
			
			var report:Object = _reports.shift();
			var avatar:HeroAvatar = _groupAvatar.getItemById(report.player);
			foceAvatar(avatar);
			
			switch(report.type) {
				case "move":
					avatar.moveTo(MapTitleTools.getMapPosition(report.result.x, report.result.y));
					break;
				case "skill":
					avatar.doSkillReport(report);
					avatar
					break;
				case "damage":
					break;
			}
			
			
			
			setTimeout(playReport,2000);
		}
		
		
		public function showText(txt:String,sx:Number,sy:Number):void
		{
			var tf:TextField = new TextField(100, 20, txt);
			tf.x = sx;
			tf.y = sy;
			
			
		}
	}

}
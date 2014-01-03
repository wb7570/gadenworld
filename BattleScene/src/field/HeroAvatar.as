package field 
{
	import flash.geom.Point;
	import sinterface.IPlayerInfo;
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import tools.MapTitleTools;
	
	public class HeroAvatar extends Sprite implements IAnimatable
	{
		
		public var mcLowerbody:MovieClip;
		public var mcUpperbody:MovieClip;
		public var mcHead:MovieClip;
		public var mcWeapon:MovieClip;
		private var _mcInfo:Array;
		
		private var _atlasLowerbody:TextureAtlas;
		private var _atlasUpperbody:TextureAtlas;
		private var _atlasHead:TextureAtlas;
		private var _atlasWeapon:TextureAtlas;
		
		
		private var _action:String;
		private var _direct:int;
		
		public var id:int;
		public var heroInfo:IPlayerInfo
		
		public function HeroAvatar() 
		{
			//_action = "Idle";
			//_direct = 4;
		}
		
		public function initMovie(atlasLowerbody:TextureAtlas,atlasUpperbody:TextureAtlas,atlasHead:TextureAtlas,atlasWeapon:TextureAtlas):void
		{
			//var texture:Texture = Texture.fromBitmap(new AtlasTexture());
			//var xml:XML = XML(new AtlasXml());
			//var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			// 创建位图动画
			//var movie:MovieClip = new MovieClip(atlas.getTextures("flight_"), 10);
			//movie.loop = false; // default: true
			//addChild(movie);
			
			
			_atlasLowerbody = atlasLowerbody;
			_atlasUpperbody = atlasUpperbody;
			_atlasHead = atlasHead;
			_atlasWeapon = atlasWeapon;
			
			
			
			
			doAction("Idle", 4,true);
		}
		
		private var _actionLoop:Boolean;
		private var _another:Boolean;
		
		private var _actionComplete:Function
		// 9 1 3
		// 8   2
		//12 4 6
		private var anotherDirect:Object = {1:4,3:9,2:8,6:12,4:1,12:6,8:2,9:3};
		public function doAction(value:String, direct:int, loop:Boolean=false,complete:Function=null):void
		{			
			_another = false;
			var movieInfo:Object = getMovieInfo(value, direct);
			if (movieInfo == null) {
				
				movieInfo = getMovieInfo(value, anotherDirect[direct]);
				if (movieInfo) {
					_another = true;
				}else {
					return;
				}
				
			}
			
			_actionLoop = loop;
			_action = value;
			_direct = direct;
			_mcInfo = getMovies(movieInfo.items);
			setBody(movieInfo.items,complete);
			
			Starling.juggler.add(this);
		}
		
		private function setBody(value:Array,complete:Function=null):void
		{
			var t1:Vector.<Texture> = new Vector.<Texture>();
			var t2:Vector.<Texture> = new Vector.<Texture>();
			var t3:Vector.<Texture> = new Vector.<Texture>();
			var t4:Vector.<Texture> = new Vector.<Texture>();
			
			for (var i:int = 0,leni:int=value.length; i < leni; i++) {
				t1.push(_atlasLowerbody.getTexture("lowerbody_" + value[i]));
				t2.push(_atlasUpperbody.getTexture("upperbody_" + value[i]));
				t3.push(_atlasHead.getTexture("head_" + value[i]));
				t4.push(_atlasWeapon.getTexture("weapon_" + value[i]));
			}
			
			if (mcLowerbody) {
				removeChild(mcLowerbody);
				removeChild(mcUpperbody);
				removeChild(mcHead);
				removeChild(mcWeapon);
			}
			
			mcLowerbody = new MovieClip(t1, 6);
			mcUpperbody = new MovieClip(t2, 6);
			mcHead = new MovieClip(t3, 6);
			mcWeapon = new MovieClip(t4, 6);
			
			if (_another) {
				scaleX = -1;
			}else {
				scaleX = 1;
			}
			
			if (_actionLoop == false || complete != null) {
				
				if (complete != null) {
					_actionComplete = complete;
				}
				
				mcUpperbody.addEventListener(Event.COMPLETE, mc_completeHandler);
			}
			
			addChild(mcLowerbody);
			addChild(mcUpperbody);
			addChild(mcHead);
			addChild(mcWeapon);
		}
		
		private function mc_completeHandler(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.COMPLETE, mc_completeHandler);
			doAction("Idle", _direct, true);
			
			if (_actionComplete != null) {
				_actionComplete();
				_actionComplete = null;
			}
		}
		
		private function getMovies(value:Array):Array
		{
			var movieAction:Array = AvatarAssets.movieInfoPath;
			
			var result:Array = new Array();
			
			for (var i:int = 0,leni:int=value.length; i < leni; i++) 
			{
				result.push(movieAction[value[i]-1]);
			}
			return result;
		}
		
		private function getMovieInfo(value:String,direct:int):Object
		{
			var movieAction:Array = AvatarAssets.movieAction;
			for (var i:int = 0,leni:int=movieAction.length; i < leni; i++) {
				var movieInfo:Object = movieAction[i]
				if (movieInfo.action == value && movieInfo.direct == direct)
				{
					return movieInfo;
				}
			}
			return null;
		}
		
		
		public function advanceTime(time:Number):void
		{
			if (!mcLowerbody) {
				return;
			}
			
			mcLowerbody.advanceTime(time);
			mcUpperbody.advanceTime(time);
			mcHead.advanceTime(time);
			mcWeapon.advanceTime(time);
			mcWeapon.readjustSize();
			
			var index:int = mcLowerbody.currentFrame;
			
			var infoArr:Array = _mcInfo[index].items;
			
			mcLowerbody.x = infoArr[0].x;
			mcLowerbody.y = infoArr[0].y;
			
			mcUpperbody.x = infoArr[1].x;
			mcUpperbody.y = infoArr[1].y;
			
			mcHead.x = infoArr[2].x;
			mcHead.y = infoArr[2].y;
			
			mcWeapon.x = infoArr[3].x;
			mcWeapon.y = infoArr[3].y;
			
			
			
			if (_action == "Walk") {
				
				if (_direct & 8) {
					x -= (_moveFoot > Math.abs(_toPostion.x - x)) ? Math.abs(_toPostion.x - x) : _moveFoot;
				}else if (_direct & 2) {
					x += (_moveFoot > Math.abs(_toPostion.x - x)) ? Math.abs(_toPostion.x - x) : _moveFoot;
				}
				
				if (_direct & 1) {
					y -= (_moveFoot > Math.abs(_toPostion.y - y)) ? Math.abs(_toPostion.y - y) : _moveFoot;
				}else if (_direct & 4) {
					y += (_moveFoot > Math.abs(_toPostion.y - y)) ? Math.abs(_toPostion.y - y) : _moveFoot;
				}
				
				//if (x != _toPostion.x) {
					//x += _toPostion.x > x ? 1 : -1
				//}
				//if (y != _toPostion.y) {
					//y += _toPostion.y > y ? 1 : -1;
				//}
				
				var _tempDirect:int = getMoveDirect(_toPostion);
				if (_tempDirect == 0) {
					doAction("Idle", _direct,true);
				}else if (_tempDirect != _direct) {
					doAction("Walk", _tempDirect,true);
				}
			}
		}
		
		public function getPoint():Point
		{
			return new Point(x, y);
		}
		
		public function setPoint(v:Point):void
		{
			x = v.x;
			y = v.y;			
		}
		
		
		private var _moveFoot:int = 4;
		private var _toPostion:Point;
		public function moveTo(v:Point):void
		{
			_toPostion = v;
			_direct = getMoveDirect(_toPostion);
			doAction("Walk", _direct,true);
		}
		
		private function getMoveDirect(v:Point):int
		{
			var result:int = 0;
			if (x != v.x) {
				result += v.x > x ? 2 : 8
			}
			if (y != v.y) {
				result += v.y > y ? 4 : 1;
			}
			return result;
		}
		
		
		
		public function doReport(v:Object):void
		{
			//heroInfo.updateTime();
			_report = v;
			
			switch(_report.type) {
				case "move":
					doMoveReport(_report);
					break;
				case "skill":
					doSkillReport(_report);
					break;
				case "damage":
					doDamageReport(_report);
					break;
				
			}
		}
		
		private var _report:Object
		public function doSkillReport(v:Object):void
		{
			var damageReport:Array = v.damageReport;
			doAction("Attack", _direct,false,doSkillReportCompleteHandler);
		}
		
		private function doSkillReportCompleteHandler():void
		{
			
		}
		
		public function doMoveReport(v:Object):void
		{
			moveTo(MapTitleTools.getMapPosition(v.result.x, v.result.y));
		}
		
		public function doDamageReport(v:Object):void
		{
			heroInfo.hp -= 10;
			
			
		}
	}

}
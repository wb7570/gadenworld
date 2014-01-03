package battleworlds 
{
	import com.greensock.easing.BackOut;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.hybrid.ui.ToolTip;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import sinterface.battle.ISoldier;
	import tools.MapTitleTools;
	
	public class Avatar extends Sprite
	{
		[Embed(source = "/../bin/zhanshi.png")]
		private var AvatarZhanshi:Class;
		[Embed(source = "/../bin/fashi.png")]
		private var AvatarFashi:Class;
		[Embed(source = "/../bin/daozei.png")]
		private var AvatarDaozei:Class;
		[Embed(source = "/../bin/mushi.png")]
		private var AvatarMushi:Class;
		private var toolTip:ToolTip;
		
		public var info:ISoldier;
		
		public function Avatar() 
		{
			
		}
		
		public function get id():int
		{
			return info.id;
		}
		
		public function initAvatar(item:ISoldier):void
		{
			info = item;
			
			switch(int(item.info.profession)) {
				case 1://zhan
					var a:DisplayObject = new AvatarZhanshi()
					break;
				case 2://fa
					a = new AvatarFashi()
					break;
				case 3://dao
					a = new AvatarMushi()
					break;
				case 4://mu
					a = new AvatarMushi()
					break;
			}
			a.width = MapTitleTools.tw;
			a.height = MapTitleTools.th;
			addChild(a);
			
			//addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
		}
		
		public function showTips():void 
		{
			if (toolTip == null) {
				toolTip = new ToolTip();
				toolTip.hook = true;
				toolTip.cornerRadius = 20;
				toolTip.autoSize = true;
				toolTip.align = "right";
			}
			
			toolTip.show( this, getSInfo() );
			
		}
		
		private function getSInfo():String 
		{
			var result:String = "";
			result += MapTitleTools.getIndexPositions(x, y).toString();
			result += "\n" + info.info.name;
			result += "\n" + "hp:" + info.hp + "/" + info.info.attr.hp;
			result += "\n" + "mp:" + info.mp + "/" + info.info.attr.mp;
			return result;
		}
		
		public function hideTips():void
		{
			toolTip.hide();
			toolTip = null;
		}
		
		public function exSkill(id:int):void
		{
			var tl:TimelineMax = new TimelineMax();
			tl.append(new TweenMax(this, 0.3, { x:x + 5, y:y - 5 } ));
			tl.append(new TweenMax(this, 0.3, { x:x, y:y } ));
			tl.play();
			
		}
		
		public function addHP(v:int):void
		{
			var tf:TextField = new TextField();
			tf.text = "-" + v;
			tf.setTextFormat(new TextFormat(null, 16, 0xff2200, true));
			tf.x = width / 2;
			tf.y = height / 2;
			addChild(tf);
			
			if (info.hp <= 0) {
				
			}
			
			new TweenMax(tf, 0.6, {x:tf.x + 10,y:tf.y-30,alpha:0.6,ease:BackOut.ease,onComplete:addHpTweenComplete,onCompleteParams:[tf] } );
		}
		
		private function addHpTweenComplete(v:TextField):void 
		{
			removeChild(v);
		}
		
		public function setPosition(v:Point):void
		{
			//BattleWorldS.instance.mapInfo[x * 100 + y] = null;
			//x = v.x;
			//y = v.y;
			//BattleWorldS.instance.mapInfo[x * 100 + y] = this;
			TweenMax.to(this, 1, { x:v.x, y:v.y } );
		}
		
		private var _path:Array;
		public function moveFollowPath(v:Array):void
		{
			_path = v;
			if (_path && _path.length > 0) {
				moveToNext();
			}
		}
		
		private function moveToNext():void 
		{
			if (_path.length == 0) {
				return;
			}
			var p:Point = _path.shift();
			p = MapTitleTools.getMapPosition(p.x, p.y);
			TweenMax.to(this, 0.4, { x:p.x, y:p.y, onComplete:moveToNext } );
		}
		
		public function getPosition():Point
		{
			return new Point(x, y);
		}
	}

}
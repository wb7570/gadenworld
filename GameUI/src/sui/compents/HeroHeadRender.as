package sui.compents 
{
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	public class HeroHeadRender extends RenderBase
	{
		private var _txt:TextField;
		private var _q:Quad;
		private var de:DelayedCall;
		
		public function HeroHeadRender() 
		{
			setSize(100, 40);
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_q = new Quad(100, 40,0x869ca7);
			addChild(_q);
			
			_txt = new TextField(100, 40, "");
			_txt.border = true;
			addChild(_txt);
			
		}
		
		override protected function commitData():void 
		{
			super.commitData();
			if (data) {
				_txt.text = data.info.name;
			}
		}
		
		override protected function touchHandler(event:TouchEvent):void 
		{
			super.touchHandler(event);
		}
		
		
		override public function set isSelected(value:Boolean):void 
		{
			super.isSelected = value;
			
			if (value) {
				_q.color = 0xffffff;
			}else {
				_q.color = 0x869ca7;
			}
		}
		
		//override protected function touchHoverHandler():void 
		//{
			//super.touchHoverHandler();
			//_q.color = 0xffffff;
			//
			//if (de) {
				//de.reset(reset, .3);
			//}else {
				//de = Starling.juggler.delayCall(reset, .3);
			//}
			//
		//}
		//
		//private function reset():void 
		//{
			//de = null;
			//_q.color = 0x869ca7;
		//}
	}

}
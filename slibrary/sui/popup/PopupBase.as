package sui.popup 
{
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.core.FeathersControl;
	import feathers.core.PopUpManager;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import sui.compents.GButton;
	
	public class PopupBase extends FeathersControl
	{
		public var btnClose:Button;
		
		public function PopupBase(tw:Number=400,th:Number=400) 
		{
			setSize(tw, th);
			
			initPopup();
		}
		
		protected function initPopup():void 
		{
			var img:Quad = new Quad(explicitWidth, explicitHeight, 0xEEEEEE);
			img.alpha = 0.8;
			addChild(img);
			
			img = new Quad(explicitWidth-10, explicitHeight-10, 0xEEEEEE);
			img.x = img.y = 5;
			addChild(img);
			
			btnClose = new Button();
			btnClose.addEventListener(Event.TRIGGERED, btnClose_triggeredHandler);
			btnClose.y = 10;
			btnClose.x = explicitWidth - 100;
			addChild(btnClose);
		}
		
		private function btnClose_triggeredHandler(e:Event):void 
		{
			close();
		}
		
		private var _callout:Callout;
		public function show():void
		{
			PopUpManager.addPopUp(this, true, false);
			PopUpManager.centerPopUp(this);
		}
		
		public function close():void 
		{
			PopUpManager.removePopUp(this)
		}
	}
}
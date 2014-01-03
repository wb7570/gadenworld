package sui.dialog 
{
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import starling.events.Event;
	import starling.text.TextField;
	import sui.compents.GButton;
	import sui.popup.PopupBase;
	
	public class PopupCreateTargetCondition extends PopupBase
	{
		private var _txt:TextInput;
		
		public function PopupCreateTargetCondition() 
		{
			super(500, 300);
		}
		
		override protected function initPopup():void 
		{
			super.initPopup();
			
			_txt = new TextInput();
			_txt.text = "hp > 0";
			_txt.x = 180;
			_txt.y = 180;
			addChild(_txt);
			
			var btnConfirm:Button = new Button();
			btnConfirm.addEventListener(Event.TRIGGERED, btnConfirm_triggeredHandler);
			btnConfirm.x = 200;
			btnConfirm.y = 270;
			addChild(btnConfirm);
		}
		
		private function btnConfirm_triggeredHandler(e:Event):void 
		{
			var s:String = _txt.text;
			var tempArr:Array = s.split(" ");
			
			trace(tempArr);
			close();
		}
	}

}
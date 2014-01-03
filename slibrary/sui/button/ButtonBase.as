package sui.button 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import sui.popup.PopupBase;
	
	public class ButtonBase extends PopupBase
	{
		public var txtLabel:TextField;
		
		private var _label:String;
		
		public function ButtonBase() 
		{
			init();
		}
		
		private function init():void 
		{
			txtLabel = new TextField();
			addChild(txtLabel);
			drawBG(200, 20);
			
			addEventListener(MouseEvent.CLICK
		}
		
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			txtLabel.text = value;
			_label = value;
		}
		
		
		
		
	}

}
package sui 
{
	import feathers.controls.Screen;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class ScreenBase extends Screen
	{
		public var mainBox:Sprite;
		
		public function ScreenBase() 
		{
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			mainBox = new Sprite();
			mainBox.y = 35;
			addChild(mainBox);
		}
		
		public function refresh():void
		{
			
		}
	}

}
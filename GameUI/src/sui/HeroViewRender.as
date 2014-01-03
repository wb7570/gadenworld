package sui 
{
	import starling.text.TextField;
	import sui.compents.RenderBase;
	/**
	 * ...
	 * @author 
	 */
	public class HeroViewRender extends RenderBase
	{
		public var txtName:TextField;
		public var txtStatue:TextField;
		public var txtEnergy:TextField;
		
		public function HeroViewRender() 
		{
			setSize(620, 50);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
		}
	}

}
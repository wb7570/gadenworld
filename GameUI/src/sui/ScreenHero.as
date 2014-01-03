package sui 
{
	import feathers.controls.List;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import starling.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class ScreenHero extends ScreenBase
	{
		public var listHero:List;
		
		public function ScreenHero() 
		{
			
		}
		
		private function initUI():void
		{
			listHero = new List();
			listHero.height = 500;
			listHero.width = 640;
			listHero.isSelectable = true;
			var layout:HorizontalLayout = new HorizontalLayout()
			layout.gap = 5;
			listHero.layout = layout;
			listHero.addEventListener(Event.CHANGE, list_changeHandler );
			
			var lc:ListCollection = new ListCollection();
			listHero.itemRendererType = HeroViewRender;
			listHero.dataProvider = lc;
			addChild(listHero);
		}
		
		private function list_changeHandler(e:Event):void 
		{
			
		}
		
		override public function refresh():void 
		{
			//var heros:Array = MainUI.instance.data.heros;
			//listHero.dataProvider.data = heros;
		}
	}
}
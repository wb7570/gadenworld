package sui 
{
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import sinterface.battle.ISoldier;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import sui.compents.HeroHeadRender;
	import sui.data.TacticContant;
	import tools.LayoutTool;
	
	public class ScreenTactics extends ScreenBase
	{
		private var heros:Array;
		private var heroBox:Sprite;
		private var taticBox:Sprite;
		static public const NAME:String = "tactics";
		public var listHero:List;
		public var listTactic:List;
		
		
		
		public function ScreenTactics() 
		{
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			initUI();
		}
		
		private function initUI():void
		{
			heroBox = new Sprite();
			mainBox.addChild(heroBox);
			taticBox = new Sprite();
			taticBox.y = 120;
			mainBox.addChild(taticBox);
			
			listHero = new List();
			listHero.height = 60;
			listHero.width = 720;
			listHero.isSelectable = true;
			var layout:HorizontalLayout = new HorizontalLayout()
			layout.gap = 5;
			listHero.layout = layout;
			listHero.addEventListener(Event.CHANGE, list_changeHandler );
			var lc:ListCollection = new ListCollection();
			listHero.itemRendererType = HeroHeadRender;
			lc.data = [];
			listHero.dataProvider = lc;
			listHero.x = 10;
			heroBox.addChild(listHero);
			
			listTactic = new List();
			listTactic.height = 360;
			listTactic.width = 720;
			listTactic.isSelectable = true;
			var layout2:VerticalLayout = new VerticalLayout();
			layout2.gap = 20;
			listTactic.layout = layout2;
			lc = new ListCollection();
			lc.data = [];
			listTactic.itemRendererType = TacticsRender;
			listTactic.dataProvider = lc;
			listTactic.x = 10;
			taticBox.addChild(listTactic);
			
			showHeros();
			showTactics();
		}
		
		private function showHeros():void 
		{
			heros = GameUI.instance.data.heros;
			
			var tempArr:Array = new Array();
			for each (var item:ISoldier in heros) {
				tempArr.push(item);
			}
			
			listHero.dataProvider.data = tempArr;
		}
		
		private function list_changeHandler(e:Event):void 
		{
			showTactics();
		}
		
		private function showTactics():void 
		{
			clearTacticBox();
			
			var soldier:ISoldier = listHero.selectedItem as ISoldier;
			if (soldier == null) {
				return;
			}
			var tArr:Array = soldier.getTactics();
			listTactic.dataProvider.data = tArr;
			listTactic.validate();
		}
		
		private function clearTacticBox():void 
		{
			//while (taticBox.numChildren > 0) {
				//taticBox.removeChildAt(0);
			//}
			
		}
		
		override public function refresh():void 
		{
			super.refresh();
			//listHero.dataProvider.data = [ { }, { }, { } ];
		}
		
		public function saveCongfig():void
		{
			
		}
	}
}
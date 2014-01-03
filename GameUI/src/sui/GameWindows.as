package sui 
{
	import feathers.controls.ButtonGroup;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.AeonDesktopTheme;
	import starling.animation.Transitions;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import tools.LayoutTool;
	/**
	 * ...
	 * @author 
	 */
	public class GameWindows extends Sprite
	{
		static public var instance:GameWindows;
		
		public var mBar:MoneyBar;
		protected var theme:AeonDesktopTheme;
		private var _navigator:ScreenNavigator;
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		
		public function GameWindows() 
		{
			instance = this;
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			theme = new AeonDesktopTheme(stage);
			
			initUI();
			initShow();
			initMenuButtons();
		}
		
		private function initUI():void 
		{
			_navigator = new ScreenNavigator();
			addChild(_navigator);
			
			_transitionManager = new ScreenSlidingStackTransitionManager(_navigator);
			_transitionManager.duration = 0.4;
			_transitionManager.ease = Transitions.EASE_OUT_BACK;
			
			_navigator.addEventListener(FeathersEventType.TRANSITION_COMPLETE, navigator_transitionCompleteHandler );
			_navigator.addScreen(ScreenMain.NAME, new ScreenNavigatorItem(ScreenMain));
			_navigator.addScreen(ScreenTactics.NAME, new ScreenNavigatorItem(ScreenTactics));
			
			_navigator.showScreen(ScreenTactics.NAME);
		}
		
		private function navigator_transitionCompleteHandler(e:Event):void 
		{
			(_navigator.activeScreen as Object).refresh();
		}
		
		private function initShow():void 
		{
			var txt:TextField = new TextField(40, 30, "time");
			var txt2:TextField = new TextField(120, 30, new Date().toDateString());
			txt.border = true;
			txt2.border = true;
			addChild(txt)
			addChild(txt2)
			
			LayoutTool.arrangeX(5, [txt, txt2]);
			
			mBar = new MoneyBar();
			mBar.x = 400;
			addChild(mBar);
			
			initMenuButtons();
			
		}
		
		private function initMenuButtons():void 
		{
			var group:ButtonGroup = new ButtonGroup();
			group.direction = ButtonGroup.DIRECTION_HORIZONTAL;
			group.y = 570;
			group.layoutData
			addChild(group);
			group.dataProvider = new ListCollection([
					{ label: "btn1",triggered:null},
					{ label: "btn2",triggered:null},
					{ label: "btn3",triggered:null},
					{ label: "btn4"}
				]);
			//_gameFlag = false;
			
			addChild(group);
		}	
		
		public function get navigator():ScreenNavigator 
		{
			return _navigator;
		}
	}
}
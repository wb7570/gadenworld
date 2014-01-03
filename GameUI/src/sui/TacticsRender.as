package sui 
{
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import sinterface.battle.ISoldier;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import sui.compents.RenderBase;
	import sui.compents.TacticConditionRender;
	import sui.data.TacticContant;
	
	public class TacticsRender extends RenderBase
	{
		private var _label1:TextField;
		private var _label2:TextField;
		private var _listType:PickerList;
		private var _listSkill:PickerList;
		private var _listCondition:List;
		private var _listConditionTarget:PickerList;
		
		public function TacticsRender() 
		{
			setSize(720, 40);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_listType = getPickerList();
			_listType.dataProvider.data = [ { label:"skill" }, { label:"move" }];
			addChild(_listType);
			_listType.validate();
			
			_listSkill = getPickerList("id");
			addChild(_listSkill);
			_listSkill.validate();
			
			_listCondition = new List();
			var layout:HorizontalLayout = new HorizontalLayout()
			layout.gap = 5;
			_listCondition.layout = layout;
			_listCondition.width = 720;
			_listCondition.height = 28;
			_listCondition.itemRendererType = TacticConditionRender;
			_listCondition.dataProvider = new ListCollection([ ])
			addChild(_listCondition);
			_listCondition.validate();
			
			_listConditionTarget = getPickerList();
			_listConditionTarget.dataProvider.data = [ { label:"myself" }, { label:"teamate" }, { label:"enemy" } ];
			
			//_listConditionTarget.selectedIndex = _listConditionTarget.dataProvider.data.indexOf("teamate");
			addChild(_listConditionTarget);
			_listConditionTarget.validate()
			
			_label1 = new TextField(50, 26, "目标:");
			addChild(_label1);
			_label2 = new TextField(50, 26, "行为:");
			addChild(_label2);
			
			_label1.x = 0;
			_listConditionTarget.x = 50;
			_listCondition.x = 120;
			
			
			_label2.x = 0;
			_listType.x = 50;
			_listSkill.x = 120;
			
			_label2.y = 30;
			_listType.y = 30;
			_listSkill.y = 30;
		}
		
		
		static private const TARGETTYPES:Array = ["myself", "teamate", "enemy"];
		private function getPickerList(labelField:String="label"):PickerList 
		{
			var result:PickerList = new PickerList();
			result.labelField = labelField;
			result.width = 60;
			result.height = 20;
			result.listProperties.@itemRendererProperties.labelField = labelField;
			result.dataProvider = new ListCollection([]);
			return result;
		}
		
		override protected function commitData():void 
		{
			super.commitData();
			
			var st:ScreenTactics = GameWindows.instance.navigator.activeScreen as ScreenTactics;
			var soldier:ISoldier = st.listHero.selectedItem as ISoldier;
			var skill:Array = soldier.info.getSkills();
			_listSkill.dataProvider.data = skill;
			
			_listConditionTarget.selectedIndex = TARGETTYPES.indexOf(data.targetType);
			
			var tc:Array = data.getTargetCondition();
			tc.push(null);
			_listCondition.dataProvider.data = tc;
		}
		
		public function getTactic():Object
		{
			var result:Array = new Array();
			//result.target = _list.selectedItem.value;
			
			var tempArr:Array = _listConditionTarget.dataProvider.data as Array;
			
			for (var i:int = 0; i < tempArr.length; i++) {
				if (!tempArr[i])
				{
					continue;
				}
				var td:Object = tempArr[i];
				result.push({type:td.type,content:td.content,value:td.value});
				
			}
			
			
			
			return {heroId:1,actionType:"skill", actionValue:9, targetNum:td.num, targetType:"enemy",targetConditions:result };
			//heroId:1,id:1,actionType:"skill",targetType:"enemy",actionValue:8,
		}
	}

}
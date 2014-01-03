package sui.compents 
{
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import sui.dialog.PopupCreateTargetCondition;
	import sui.GameWindows;
	import sui.ScreenTactics;
	
	public class TacticConditionRender extends RenderBase
	{
		public var txtMain:TextField;
		
		public function TacticConditionRender() 
		{
			setSize(120, 20);
			initRender();
		}
		
		private function initRender():void 
		{
			txtMain = new TextField(120, 20, "");
			txtMain.border = true;
			addChild(txtMain);
		}
		
		override protected function commitData():void 
		{
			super.commitData();
			if (data) {
				txtMain.text = data.content + data.type + data.value
			}else {
				txtMain.text = "添加";
			}
			
			 
		}
		
		override protected function touchHandler(event:TouchEvent):void 
		{
			super.touchHandler(event);
		}
		
		override protected function touchBeiganHadnler():void 
		{
			super.touchBeiganHadnler();
			
			if (!data) {
				new PopupCreateTargetCondition().show();
			}
		}
	}

}
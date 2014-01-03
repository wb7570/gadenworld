package sui.compents 
{
	import feathers.controls.Button;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class GButton extends Button
	{
		static public const TOUCHENDED:String = "touchended";
		
		public function GButton() 
		{
			super();
			
			//addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		//protected function touchHandler(e:TouchEvent):void 
		//{
			//const touches:Vector.<Touch> = e.getTouches(this);
			//if(touches.length == 0)
			//{
				//return;
			//}
			//if(touches[0].phase == TouchPhase.ENDED)
			//{
				//dispatchEvent(new Event(TOUCHENDED, e.bubbles, e.data));
			//}
		//}
		
		
		override protected function button_touchHandler(event:TouchEvent):void 
		{
			super.button_touchHandler(event);
		}
		
		//override public function addEventListener(type:String, listener:Function):void 
		//{
			//super.addEventListener(type, listener);
		//}
	}
}
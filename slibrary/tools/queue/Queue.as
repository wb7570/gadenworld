package tools.queue 
{
	import flash.events.Event;
	
	public class Queue extends QueueBase
	{
		public var children:Array;
		
		public function Queue(args:Array) 
		{
			children = args;
		}
		
		override public function execute():void 
		{
			doNext();
		}
		
		protected function doNext():void
		{
			if (children.length > 0) {
				children[0].addEventListener(Event.COMPLETE, child_completeHandler);
				children[0].execute();
			}else {
				complete();
			}
		}
		
		private function child_completeHandler(e:Event):void 
		{
			children[0].removeEventListener(Event.COMPLETE, child_completeHandler);
			children.shift();
			doNext();
		}
	}

}
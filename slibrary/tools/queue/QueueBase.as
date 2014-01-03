package tools.queue 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import sinterface.IQueue;
	/**
	 * ...
	 * @author 
	 */
	public class QueueBase extends EventDispatcher implements IQueue
	{
		
		public function QueueBase() 
		{
			
		}
		
		public function execute():void
		{
		}
		
		public function complete():void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}

}
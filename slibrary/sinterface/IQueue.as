package sinterface 
{
	import flash.events.IEventDispatcher;
	
	public interface IQueue extends IEventDispatcher
	{		
		function execute():void
	}

}
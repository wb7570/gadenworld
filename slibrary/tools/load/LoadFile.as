package tools.load 
{
	import flash.system.LoaderContext;
	import tools.queue.QueueMethod;
	/**
	 * ...
	 * @author 
	 */
	public class LoadFile 
	{
		public var url:String;
		public var type:int;
		public var context:LoaderContext;
		public var callback:QueueMethod;
	
		public function LoadFile(type:int,url:String,callback:QueueMethod,context:LoaderContext) 
		{
			this.type = type;
			this.url = url;
			this.callback = callback;
			this.context = context;
		}
		
		public function executeWith(data:*):void 
		{
			callback.executeWith(data);
		}
	}

}
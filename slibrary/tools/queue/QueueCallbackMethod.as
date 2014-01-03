package tools.queue 
{
	/**
	 * ...
	 * @author 
	 */
	public class QueueCallbackMethod extends QueueMethod
	{
		
		public function QueueCallbackMethod(func:Function=null,args:Array=null)  
		{
			super(func, args);
		}
		
		override public function execute():void 
		{
			if (func == null) {
			}
			else if (args == null) {
				func(complete);
			}
			else {
				args.push(complete);
				func.apply(null,args);
			}
		}
	}

}
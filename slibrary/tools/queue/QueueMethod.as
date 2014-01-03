package tools.queue 
{
	/**
	 * ...
	 * @author 
	 */
	public class QueueMethod extends QueueBase
	{
		public var func:Function;
		public var args:Array;
		
		public function QueueMethod(func:Function=null,args:Array=null) 
		{
			this.func=func;
			this.args=args;
		}
		
		override public function execute():void 
		{
			if (func == null) {
			}
			else if (args == null) {
				func();
			}
			else {
				func.apply(null,args);
			}
			complete();
		}
		
		public function executeWith(data:Object):void 
		{
			if (args == null) {
				args = [];
			}
			args.push(data);
			execute();
		}
		
		public function excuteConcat(data:Array):void 
		{
			if (args == null) {
				args = [];
			}
			args = args.concat(data);
			execute();
		}
	}

}
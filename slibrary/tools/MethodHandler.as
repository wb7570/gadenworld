package tools {

	public class MethodHandler {
		
		public var func:Function;
		public var args:Array;
		
		public function MethodHandler(func:Function=null,args:Array=null) {
			this.func=func;
			this.args=args;
		}
		
		public function execute():void {
			if (func==null)return;
			if (args==null)func();
			else func.apply(null,args);
		}
		
		public function executeWith(data:Object):void {
			if (func==null)return;
			if (args==null)func(data);
			else {
				args.unshift(data);
				func.apply(null,args);
			}
		}
		
		public function excuteConcat(data:Array):void {
			if (data==null)execute();
			if (func==null)return;
			if (args==null)func.apply(null,data);
			else func.apply(null,data.concat(args));
		}
		
		/*
		private function applyFunc(args:Array):void {
			args.length=func.length;
			func.apply(null,args);
		}
		*/
	}
}

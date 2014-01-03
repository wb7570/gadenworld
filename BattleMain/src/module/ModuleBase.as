package module 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import tools.LoaderTool;
	public class ModuleBase extends EventDispatcher 
	{
		public var name:String;
		public var url:String;
		public var content:DisplayObjectContainer;
		
		
		
		public function ModuleBase(name:String,url:String) 
		{
			this.name = name;
			this.url = url;
		}
		
		public function load():void
		{
			LoaderTool.load(LoaderTool.SWF, url, loadComplete, null, null);
		}
		
		private function loadComplete(v:DisplayObjectContainer):void 
		{
			content = v;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function execute():void
		{
			load();
		}
	}
}
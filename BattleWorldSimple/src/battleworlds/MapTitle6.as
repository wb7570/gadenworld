package battleworlds 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import tools.MapTitleTools;
	
	public class MapTitle6 extends Sprite
	{
		[Embed(source = "/../bin/maptitle.png")]
		private var MapTitle:Class;
		
		
		public function MapTitle6() 
		{
			init();
		}
		
		private function init():void 
		{
			var result:DisplayObject = new MapTitle();
			result.width = MapTitleTools.tw;
			result.height = MapTitleTools.th;
			addChild(result);
		}
		
	}

}
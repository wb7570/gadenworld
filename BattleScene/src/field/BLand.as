package field 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author 
	 */
	public class BLand extends Sprite
	{
		public function BLand() 
		{
			create("title6",SBattlefield.instance.mapInfo.positions);
			
			
			
		}
		
		
		
		
		
		public function create(symbol:String,positions:Array):void
		{
			if (!positions || positions.length == 0) {
				return;
			}
			var cl:* = ApplicationDomain.currentDomain.getDefinition(symbol);
			
			//var cl:Class = 
			for (var i:int = 0,leni:int=positions.length; i < leni; i++) 
			{
				var bmd:BitmapData = new cl();
				var spTitle:Image = new Image(Texture.fromBitmapData(bmd));
				spTitle.x = positions[i].x;
				spTitle.y = positions[i].y;
				addChild(spTitle);
			}
		}
		
		
		
		
	}
}
package tools 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	/**
	 * ...
	 * @author 伽扽
	 */
	public class AssetTool 
	{
		static private var xmlBox:Object = { }; 
		static private var bmdBox:Object = { }; 
		
		static public function addXml(name:String,value:XML):void
		{
			xmlBox[name] = value;
		}
		
		static public function getXml(name:String):XML
		{
			return xmlBox[name];
		}
		
		static public function addBmd(name:String, value:BitmapData):void
		{
			bmdBox[name] = value;
		}
		
		static public function getBmd(name:String):BitmapData
		{
			return bmdBox[name];
		}
		
		static public function getAsset(symbol:String,currentDomain:ApplicationDomain=null):Object
		{
			if (currentDomain == null) currentDomain = ApplicationDomain.currentDomain;
			
			if (currentDomain.hasDefinition(symbol)) {
				var result:Class = ApplicationDomain.currentDomain.getDefinition(symbol) as Class;
				return new result();
			}else {
				return null;
			}
		}
		
		static public function getBitmapdata(symbol:String, currentDomain:ApplicationDomain = null):BitmapData
		{
			return getAsset(symbol, currentDomain) as BitmapData;
		}
	}

}
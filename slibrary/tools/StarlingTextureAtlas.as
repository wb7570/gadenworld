package tools 
{
	import core.GameData;
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author ...
	 */
	public class StarlingTextureAtlas 
	{
		
		static public function getAvatarTexture(name:String):Texture
		{
			var texture:Texture = Texture.fromBitmapData(AssetTool.getAsset("icon_avatar") as BitmapData);
			var xml:XML = new XML(GameData.xmlData.icon_avatar);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			return atlas.getTexture(name);
		}
		
		static public function getAvatar(name:String):Image
		{
			
			// create atlas
			var texture:Texture = Texture.fromBitmapData(AssetTool.getAsset("icon_avatar") as BitmapData);
			var xml:XML = new XML(GameData.xmlData.icon_avatar);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			 
			// display a sub-texture
			texture = atlas.getTexture(name);
			var image:Image = new Image(texture);
			
			return image;
			
		}
		
	}

}
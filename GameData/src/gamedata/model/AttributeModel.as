package gamedata.model 
{
	import gamedata.data.AttributeData;
	import sinterface.game.IAttributeInfo;
	
	public class AttributeModel extends AttributeData  implements IAttributeInfo
	{
		static private const ATTRS:Array = ["hp", "mp", "cdTime", "speed", "attack", "magic","regeneration"];
		
		public function AttributeModel(v:Object=null) 
		{
			super(v);
		}
		
		
		public function add(v:AttributeModel):AttributeModel
		{
			var result:AttributeModel = new AttributeModel();
			for (var i:int = ATTRS.length - 1; i > -1; i--) {
				result[ATTRS[i]] = this[ATTRS[i]] + v[ATTRS[i]];
			}
			return result;
		}
		
		public function remove(v:AttributeModel):AttributeModel
		{
			var result:AttributeModel = new AttributeModel();
			for (var i:int = ATTRS.length - 1; i > -1; i--) {
				result[ATTRS[i]] = this[ATTRS[i]] - v[ATTRS[i]];
			}
			return result;
		}
		
		public function getMultAttrModel(v:AttributeModel):AttributeModel
		{
			var result:AttributeModel = new AttributeModel();
			for (var i:int = ATTRS.length - 1; i > -1; i--) {
				result[ATTRS[i]] = this[ATTRS[i]] * v[ATTRS[i]] / 100;
			}
			return result;
		}
		
		public function clone():IAttributeInfo
		{
			var result:AttributeModel = new AttributeModel();
			for (var i:int = ATTRS.length - 1; i > -1; i--) {
				result[ATTRS[i]] = this[ATTRS[i]];
			}
			return result;
		}
	}
}
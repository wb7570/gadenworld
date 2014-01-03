package gamedata.model 
{
	import gamedata.data.EquipData;
	import sinterface.game.IEquipInfo;
	/**
	 * ...
	 * @author 
	 */
	public class EquipModel extends EquipData implements IEquipInfo
	{
		
		public function EquipModel() 
		{
			
		}
		
		public function getAttrModels():Array
		{
			var tempArr:Array = _attrs.split(",");
			
			var result:Array = new Array();
			for (var i:int = tempArr.length - 1; i > -1; i--) {
				result.push( GameData.instance.data.attributes.getItemById(tempArr[i]));
			}
			return result;
		}
	}

}
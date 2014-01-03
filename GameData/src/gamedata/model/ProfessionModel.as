package gamedata.model 
{
	import gamedata.data.ProfessionData;
	import sinterface.game.IProfessionInfo;
	
	public class ProfessionModel extends ProfessionData implements IProfessionInfo
	{
		
		public function ProfessionModel(v:Object=null) 
		{
			super(v);
		}
		
		public function getAttrModels():Array
		{
			var result:Array = new Array();
			var ids:Array = attrs.split(",");
			for (var i:int = ids.length - 1; i > -1; i--) {
				result.unshift( GameData.instance.data.attributes.getItemById(ids[i]));
			}
			return result;
		}
	}
}
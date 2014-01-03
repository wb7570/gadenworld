package gamedata.model 
{	
	import gamedata.data.HeroData;
	import gamedata.data.SoldierData;
	import sinterface.game.IHeroInfo;
	import sinterface.game.ISoldierInfo;
	
	public class HeroModel extends HeroData implements IHeroInfo
	{
		
		public function HeroModel(v:Object=null) 
		{
			super(v);
		}
		
		public function getSoldier():ISoldierInfo
		{
			var result:SoldierModel = new SoldierModel();
			result.id = attrbase;
			result.name = name;
			result.profession = profession;
			
			var attr:AttributeModel =  GameData.instance.data.attributes.getItemById(attrbase);
			result.addAttrModel(attr);
			
			var tempModels:Array = getEquipModels();
			for (var i:int = tempModels.length - 1; i > -1; i--) {
				var eModel:EquipModel = tempModels[i];
				var tempAttrs:Array = eModel.getAttrModels();
				for (var j:int = tempAttrs.length - 1; j > -1; j--)
				{
					result.addAttrModel[tempAttrs[j]];
				}
			}
			
			tempModels = getProfessionModels();
			for (i = tempModels.length - 1; i > -1; i--) {
				var pModel:ProfessionModel = tempModels[i];
				tempAttrs = pModel.getAttrModels();
				for (j = tempAttrs.length - 1; j > -1; j--) 
				{
					result.addAttrModel[tempAttrs[j]];
				}
			}
			
			tempModels = getSkillModels();
			for (i = tempModels.length - 1; i > -1; i--) {
				var sModel:SkillModel = tempModels[i];
				var dModelArr:Array =  GameData.instance.data.damage.getItemById(sModel.damageId);
				sModel.damageModes = dModelArr;
				
				if (sModel.type != 12)
				{
					continue;
				}				
				for (j = dModelArr.length - 1; j > -1; j--) 
				{
					var dModel:DamageModel = dModelArr[j];
					var aModel:AttributeModel =  GameData.instance.data.attributes.getItemById(dModel.base);
					result.addAttrModel(aModel);
				}
				
			}
			result.skills = tempModels;
			
			return result;
		}
		
		public function getEquipModels():Array
		{
			var result:Array = new Array();
			if (!_equips) {
				return result;
			}
			
			var equipIds:Array = _equips.split(",");
			for (var i:int = equipIds.length - 1; i > -1; i--) {
				result.unshift( GameData.instance.data.equip.getItemById(equipIds[i]));
			}
			return result;
		}
		
		public function getProfessionModels():Array
		{
			var result:Array = new Array();
			return result;
			if (!profession) {
				return result;
			}
			
			var ids:Array = profession.split(",");
			for (var i:int = ids.length - 1; i > -1; i--) {
				result.unshift(GameData.instance.data.profession.getItemById(ids[i]));
			}
			return result;
		}
		
		public function getSkillModels():Array
		{
			var result:Array = new Array();
			if (!skills) {
				return result;
			}
			
			var ids:Array = skills.split(",");
			for (var i:int = ids.length - 1; i > -1; i--) {
				result.unshift( GameData.instance.data.skill.getItemById(ids[i]));
			}
			return result;
		}
	}
}
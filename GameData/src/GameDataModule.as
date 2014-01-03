package  
{
	import gamedata.lang.LangueSkill;
	import gamedata.model.AttributeModel;
	import gamedata.model.BuffModel;
	import gamedata.model.DamageModel;
	import gamedata.model.SkillModel;
	import tools.data.ListArrayGroup;
	import tools.data.ListGroup;
	
	public class GameDataModule 
	{
		private var _sdata:Object;
		
		private var _rdata:Object;
		
		
		public var attributes:ListGroup;
		public var heros:ListGroup;
		public var equip:ListGroup;
		public var profession:ListGroup;
		public var skill:ListGroup;
		public var damage:ListArrayGroup;
		
		public var langSkill:ListGroup;
		public var buff:ListGroup;
		
		//public var attr:ListGroup;
		public function GameDataModule() 
		{
			setGameData(getSimpleData());
		}
		
		public function setStaticData(v:Object):void
		{
			
		}
		
		public function setGameData(v:Object):void
		{
			attributes = ListGroup.createListGroup(v.attr, AttributeModel);
			skill = ListGroup.createListGroup(v.skill,SkillModel);
			damage = ListGroup.createListArrayGroup(v.damage,DamageModel);
			
			langSkill = ListGroup.createListGroup(v.langSkill,LangueSkill);
			buff = ListGroup.createListGroup(v.buff,BuffModel);
		}
		
		
		
		public function getSimpleData():Object
		{
			var result:Object = new Object();
			
			result.attr = getAttrData();
			result.skill = getSkillData();
			result.damage = getDamageData();
			
			result.langSkill = getLangSkillData();
			result.buff = getBuffData();
			
			return result;
		}		
		
		private function getData(types:Array,values:Array):Object
		{
			var result:Object = new Object();
			for (var i:int = 0; i < types.length; i++) {
				result[types[i]] = values[i];
			}
			return result;
		}
		
		private var _parAttr:Array = ["id","hp","mp","cdTime","speed","attack","magic","type","regeneration"];
		private function getAttrData():Array
		{
			var result:Array = new Array();
			result = [
			getData(_parAttr, [1,190,200,4,5,6,0,1,30])//zhan
			,getData(_parAttr, [2,120,500,4,4,3,4,1,10])//fa
			,getData(_parAttr, [3,130,120,4,6,7,0,1,40])//dao
			,getData(_parAttr, [4,140,160,4,4,2,2,1,20])//mu
			];
			return result;
		}
		
		private var _parSkill:Array = ["id", "type", "damageId", "level", "cold", "duration", "cast", "cost", "costType", "area", "areaType", "range"];
		private function getSkillData():Array
		{
			var result:Array = new Array();
			result = [
			getData(_parSkill, [1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1])//zhan
			,getData(_parSkill, [2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 4])//fa
			,getData(_parSkill, [3, 2, 3, 1, 0, 0, 0, 0, 0, 0, 0, 1])//dao
			,getData(_parSkill, [4, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 3])//mu
			,getData(_parSkill, [5, 2, 5, 1, 20, 0, 0, 100, 1, 0, 0, 4])//fa.huoqiu
			,getData(_parSkill, [6, 2, 6, 1, 16, 0, 0, 40, 1, 0, 0, 1])//dao.tigu
			,getData(_parSkill, [7, 3, 7, 1, 16, 0, 0, 60, 1, 0, 0, 3])//mu.zhiliao
			,getData(_parSkill, [8, 2, 8, 1, 24, 0, 0, 60, 1, 0, 0, 1])//zhan.mengji
			,getData(_parSkill, [9, 2, 11, 1, 20, 0, 0, 180, 1, 2, 2, 4])//fa.lieyan
			,getData(_parSkill, [10, 2, 1, 1, 5, 0, 0, 0, 0, 0, 0, 5])
			,getData(_parSkill, [11, 2, 1, 1, 5, 0, 0, 0, 0, 0, 0, 5])
			,getData(_parSkill, [12, 2, 1, 1, 5, 0, 0, 0, 0, 0, 0, 5])
			,getData(_parSkill, [13, 2, 1, 1, 5, 0, 0, 0, 0, 0, 0, 5])
			];
			return result;
		}
		
		private var _parDamage:Array = ["id", "type", "base", "mult"];
		private function getDamageData():Array
		{
			var result:Array = new Array();
			result = [
			getData(_parDamage, [1, 1, 0, 1])//zhan
			,getData(_parDamage, [2, 1, 0, 1])//fa
			,getData(_parDamage, [3, 1, 0, 1])//dao
			,getData(_parDamage, [4, 1, 0, 1])//mu
			,getData(_parDamage, [5, 2, 10, 0.4])//fa.huoqiu
			,getData(_parDamage, [6, 1, 10, 0.8])//dao.tigu
			,getData(_parDamage, [6, 4, 2, 0])//dao.tigu
			,getData(_parDamage, [7, 3, 10, 1])//mu.zhiliao
			,getData(_parDamage, [8, 1, 10, 0.2])//zhan.mengji
			,getData(_parDamage, [8, 4, 1, 0])//zhan.mengji
			,getData(_parDamage, [9, 10, 8, 0])//zhan.mengji
			,getData(_parDamage, [10, 1, 10, 0.2])//dao.tigu
			,getData(_parDamage, [11, 2, 20, 0.2])//fa.lieyan
			];
			return result;
		}
		
		private var _parBuff:Array = ["id", "type", "cold", "duration" ,"damageId"];
		private function getBuffData():Array
		{
			var result:Array = new Array();
			result = [
			getData(_parBuff, [1, 1, 8, 1,9])//zhan.mengji
			,getData(_parBuff, [2, 1, 4, 4,10])//dao.tigu
			];
			return result;
		}
		
		private var _parLangSkill:Array = ["id", "name", "desc"];
		private function getLangSkillData():Array
		{
			var result:Array = new Array();
			result = [
			getData(_parLangSkill, [1, "普通攻击","普通"])
			,getData(_parLangSkill, [2, "普通攻击",""])
			,getData(_parLangSkill, [3, "普通攻击",""])
			,getData(_parLangSkill, [4, "普通攻击",""])
			,getData(_parLangSkill, [5, "火球术",""])
			,getData(_parLangSkill, [6, "剔骨",""])
			,getData(_parLangSkill, [7,  "治疗术",""])
			,getData(_parLangSkill, [8, "猛击",""])
			,getData(_parLangSkill, [9, "烈焰",""])
			,getData(_parLangSkill, [10, "",""])
			,getData(_parLangSkill, [11, "",""])
			,getData(_parLangSkill, [12,  "",""])
			,getData(_parLangSkill, [13, "",""])
			];			
			return result;
		}
	}
}
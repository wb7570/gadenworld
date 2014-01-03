package battlemain 
{
	import tools.data.ListArrayGroup;
	import tools.data.ListGroup;
	
	public class GameData 
	{
		static public var instant:GameData;
		
		public var heros:ListGroup;
		public var skills:ListGroup;
		public var skillDetails:ListGroup;
		public var damage:ListArrayGroup;
		
		public function GameData() 
		{
			instant = this;
			
			//heros = new ListGroup();
			//skills = new ListGroup();
			//skillDetails = new ListGroup();
			//damage = new ListArrayGroup("damageid");
		}
		
		public function setData(v:Object):void
		{
			//heros = createListGroup(v.heroinfo, HeroData);
			//skills = createListGroup(v.skillinfo, SkillData);
			//skillDetails = createListGroup(v.skilldetails, SkillDetails);
			//damage = createListArrayGroup(v.damage, DamageData,"damageid");
		}
		
		public function createListGroup(v:Array,cl:Class,idField:String="id"):ListGroup
		{
			var result:ListGroup = new ListGroup(idField);
			for (var i:uint = 0, len:uint = v.length; i < len; i++) {
				var m:* = new cl();
				m.setData(v[i]);
				result.add(m);
			}
			return result;
		}
		
		public function createListArrayGroup(v:Array, cl:Class, idField:String = "id"):ListArrayGroup
		{
			var result:ListArrayGroup = new ListArrayGroup(idField);
			for (var i:uint = 0, len:uint = v.length; i < len; i++) {
				var m:* = new cl();
				m.setData(v[i]);
				result.add(m);
			}
			return result;
		}
		
		public function getHero(heroId:int, level:int):Object
		{
			return heros.getItemById(heroId);
		}
		
		
		
		public function getSkill(skillId:int, level:int):Object
		{
			return skills.getItemById(skillId);
		}
		
		//public function getSkillDetails(id:int):SkillDetails
		//{
			//return skillDetails.getItemById(id);
		//}
		
		public function getSkills(ids:Array):Array
		{
			var result:Array = new Array();
			//for (var i:int = 0,len:int=ids.length; i < len; i++) {
				//result.push(getSkillDetails(ids[i]));
			//}
			return result;
		}
		
		public function getDamage(damageId:int):Array
		{
			return damage.getItemById(damageId);
		}
	}

}
package gamedata.model 
{
	import tools.data.ListGroup;
	
	public class PlayerModel 
	{
		public var name:String;
		public var hero:ListGroup;
		
		
		public function PlayerModel() 
		{
			setData(getPlayerData());
		}
		
		public function setData(value:Object):void
		{
			hero = ListGroup.createListGroup(value.hero, HeroModel);
		}
		
		
		private function getPlayerData():Object
		{
			var result:Object = new Object();
			
			result.hero = getHeros()
			
			return result;
		}
		
		private var _parHero:Array = ["id","attrbase","name","profession","equips","skills"];
		private function getHeros():Array
		{
			var result:Array =
			[
			getData(_parHero,[1,1,"hero1","","","1,2,3"])
			,getData(_parHero,[2,2,"hero2","","","4,5,6"])
			,getData(_parHero,[3,3,"hero3","","","7,8,9"])
			];
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
	}
}
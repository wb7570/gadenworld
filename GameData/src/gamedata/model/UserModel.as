package gamedata.model 
{
	import sinterface.game.IUserInfo;
	import tools.data.ListGroup;
	
	public class UserModel implements IUserInfo
	{
		public var id:String;
		public var name:String;
		public var hero:ListGroup;
		
		public function UserModel() 
		{
			init();
		}
		
		private function init():void 
		{
			setData(getPlayerData());
		}
		
		public function setData(value:Object):void
		{
			hero = ListGroup.createListGroup(value.hero, HeroModel);
		}		
		
		public function getUid():String
		{
			return id;
		}
		
		public function getName():String
		{
			return name;
		}
		
		public function getHeros():Array
		{
			return hero.source;
		}
		
		public function getBag():Array
		{
			return [];
		}
		
		public function getData():Object
		{
			return this;
		}
		
		
		
		
		private function getPlayerData():Object
		{
			var result:Object = new Object();
			
			result.hero = getHeroDatas()
			
			return result;
		}
		
		private var _parHero:Array = ["id","attrbase","name","profession","equips","skills"];
		private function getHeroDatas():Array
		{
			var result:Array =
			[
			getMData(_parHero,[1,1,"zhan","1","","1,8"])//zhan
			,getMData(_parHero,[2,2,"fa  ","2","","2,5,9"])//fa
			,getMData(_parHero,[3,3,"dao ","3","","3,6"])//dao
			,getMData(_parHero,[4,4,"mu  ","4","","4,7"])//mu
			];
			return result;
		}
		
		private function getMData(types:Array,values:Array):Object
		{
			var result:Object = new Object();
			for (var i:int = 0; i < types.length; i++) {
				result[types[i]] = values[i];
			}
			return result;
		}
	}

}
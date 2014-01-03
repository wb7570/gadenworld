package sdata.data 
{
	import tools.data.ListGroup;
	/**
	 * ...
	 * @author 
	 */
	public class DataBox 
	{
		static public var instant:DataBox;
		
		//public var user:IPlayerModel;
		public var heros:ListGroup;
		public var skills:ListGroup;
		public var skillDetails:ListGroup
		public var damage:ListGroup
		
		public function DataBox() 
		{
			instant = this;
			
			//user = new PlayerModel();
			heros = new ListGroup();
			skills = new ListGroup();
			skillDetails = new ListGroup();
			damage = new ListGroup();
		}
		
		public function setData(v:Object):void
		{
			//user = new HeroData(v.user);
			heros = createListGroup(v.heroinfo, HeroData);
			skills = createListGroup(v.skillinfo, SkillData);
			skillDetails = createListGroup(v.skilldetails, SkillDetails);
			damage = createListGroup(v.damage, DamageData);
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
	}

}
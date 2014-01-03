package battlemain.data
{
	import tools.data.DataBase;
	/**
	 * ...
	 * @author ...
	 */
	public class HeroData extends DataBase
	{
		public var id:int;
		
		public var name:String;
		
		public var symbol:String;
		
		public var skills:String;
		
		public var icon:String
		
		
		public var hp:int;
		public var hpMax:int;
		public var mp:int;
		public var mpMax:int;
		public var cdTime:int;
		
		
		public var attackdistance:int;
		
		public var attackid:int;
		
		
		public function HeroData(data:Object=null) 
		{
			super(data);
		}
		
	}

}
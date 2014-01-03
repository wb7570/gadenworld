package sdata.data
{
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
		
		/**
		 * 图标
		 */
		public var icon:String
		
		
		public var hp:int;
		
		
		public var attackdistance:int;
		
		public var attackid:int;
		
		
		public function HeroData(data:Object=null) 
		{
			super(data);
		}
		
	}

}
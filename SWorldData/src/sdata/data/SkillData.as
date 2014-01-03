package sdata.data 
{
	/**
	 * ...
	 * @author 
	 */
	public class SkillData extends DataBase
	{
		public var id:int;
		
		public var name:String;
		
		public var icon:String;
		
		public var useraction:String;
		
		public var targetaction:String;
		
		public var fps:int;
		
		public var loop:int;
		
		public var effect:String;
		
		public function SkillData(data:Object=null) 
		{
			super(data);
		}
		
	}

}
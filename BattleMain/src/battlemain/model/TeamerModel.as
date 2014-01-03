package battlemain.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class TeamerModel extends MapObjModel
	{
		protected var _team:int;
		
		public function TeamerModel() 
		{
			
		}
		
		public function get team():int
		{
			return _team;
		}
		
		public function set team(value:int):void
		{
			_team = value;
		}
	}

}
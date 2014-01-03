package battlefield 
{
	/**
	 * ...
	 * @author 
	 */
	public class SkillModel 
	{
		public var id:int;
		
		public var lastTime:uint;
		
		public var timeStep:uint;
		
		public function SkillModel() 
		{
			
		}
		
		public function get nextTime():uint
		{
			return lastTime + timeStep;
		}
		
	}

}
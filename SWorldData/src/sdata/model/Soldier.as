package sdata.model 
{
	import sdata.data.HeroData;
	import sinterface.ISoldier;
	/**
	 * ...
	 * @author 
	 */
	public class Soldier implements ISoldier
	{
		
		
		public var id:int;
		
		public var name:String;
		
		public var skills:Array;
		
		public var hp:int;
		
		public var attackDistance:int;
		
		public var heroData:HeroData;
		
		public function Soldier() 
		{
			
		}
		
		public function setHero(heroId:int,heroLevel:int):void
		{
			
		}
		
		public function setSkill(skills:Array):void
		{
			
		}
		
		public function get lastTime():uint
		{
			
		}
		public function set lastTime(value:uint)
		{
			
		}
		
		public function get nextTime():uint
		{
			
		}
	}

}
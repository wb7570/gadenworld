package gamedata.model 
{
	import gamedata.data.SkillData;
	import sinterface.game.ISkillInfo;
	
	public class SkillModel extends SkillData implements ISkillInfo
	{
		protected var _damageModes:Array;
		
		public function SkillModel() 
		{
			
		}
		
		public function get damageModes():Array 
		{
			return _damageModes;
		}
		
		public function set damageModes(value:Array):void 
		{
			_damageModes = value;
		}
		
		public function getDamageModes():Array
		{
			return _damageModes;
		}
	}

}
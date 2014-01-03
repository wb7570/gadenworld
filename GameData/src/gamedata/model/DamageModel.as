package gamedata.model 
{
	import gamedata.data.DamageData;
	import sinterface.game.IDamageInfo;
	/**
	 * ...
	 * @author 
	 */
	public class DamageModel extends DamageData implements IDamageInfo
	{
		
		public function DamageModel(v:Object=null) 
		{
			super(v);
		}
		
		public function getValue(v:int):int
		{
			return base + v * mult;
		}
	}
}
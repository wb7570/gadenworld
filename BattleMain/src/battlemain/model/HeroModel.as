package battlemain.model 
{
	import game.data.HeroData;
	import sinterface.IDamage;
	import sinterface.IPlayerInfo;
	/**
	 * ...
	 * @author 
	 */
	public class HeroModel extends PlayerModel
	{
		private var _id:int;
		private var _base:HeroData;
		
		
		
		public function HeroModel(v:HeroData) 
		{
			_base = v;
			_id = _base.id;
		}
		
		public function get skillString():String
		{
			return _base.skills;
		}
		
		public function get base():HeroData 
		{
			return _base;
		}
		
		public function set base(value:HeroData):void 
		{
			_base = value;
		}
		
		public function reset():void
		{
			hp = _base.hp;
			hpMax = _base.hpMax;
			mp = _base.mp;
			mpMax = _base.mpMax;
			attackdistance = _base.attackdistance;
			cdTime = _base.cdTime;
		}
	}	
}
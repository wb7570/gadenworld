package battlemain.model 
{
	import sinterface.IPlayerInfo;
	/**
	 * ...
	 * @author 
	 */
	public class PlayerModel implements IPlayerInfo
	{
		private var _id:int;
		private var _attack:int;
		private var _magic:int;
		private var _hp:int;
		private var _hpMax:int;
		private var _mp:int;
		private var _mpMax:int;
		private var _attackdistance:int;
		private var _cdTime:int;
		private var _speed:int;
		
		public function PlayerModel() 
		{
			
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get attack():int 
		{
			return _attack;
		}
		
		public function set attack(value:int):void 
		{
			_attack = value;
		}
		
		public function get hp():int 
		{
			return _hp;
		}
		
		public function set hp(value:int):void 
		{
			_hp = value;
		}
		
		public function get hpMax():int 
		{
			return _hpMax;
		}
		
		public function set hpMax(value:int):void 
		{
			_hpMax = value;
		}
		
		public function get mp():int 
		{
			return _mp;
		}
		
		public function set mp(value:int):void 
		{
			_mp = value;
		}
		
		public function get mpMax():int 
		{
			return _mpMax;
		}
		
		public function set mpMax(value:int):void 
		{
			_mpMax = value;
		}
		
		public function get attackdistance():int 
		{
			return _attackdistance;
		}
		
		public function set attackdistance(value:int):void 
		{
			_attackdistance = value;
		}
		
		public function get cdTime():int 
		{
			return _cdTime;
		}
		
		public function set cdTime(value:int):void 
		{
			_cdTime = value;
		}
		
		public function get speed():int 
		{
			return _speed;
		}
		
		public function set speed(value:int):void 
		{
			_speed = value;
		}
		
		public function get magic():int 
		{
			return _magic;
		}
		
		public function set magic(value:int):void 
		{
			_magic = value;
		}
		
	}

}
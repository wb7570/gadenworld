package gamedata.data 
{
	import tools.data.DataBase;
	
	public class AttributeData extends DataBase
	{
		private var _id:int;
		private var _hp:int;
		private var _mp:int;
		private var _cdTime:int;
		private var _speed:int;
		private var _attack:int;
		private var _magic:int;
		private var _type:int;
		private var _regeneration:int;
		
		public function AttributeData(v:Object=null) 
		{
			super(v);
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get hp():int 
		{
			return _hp;
		}
		
		public function set hp(value:int):void 
		{
			_hp = value;
		}
		
		public function get mp():int 
		{
			return _mp;
		}
		
		public function set mp(value:int):void 
		{
			_mp = value;
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
		
		public function get attack():int 
		{
			return _attack;
		}
		
		public function set attack(value:int):void 
		{
			_attack = value;
		}
		
		public function get magic():int 
		{
			return _magic;
		}
		
		public function set magic(value:int):void 
		{
			_magic = value;
		}
		
		public function get type():int 
		{
			return _type;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
		}
		
		public function get regeneration():int 
		{
			return _regeneration;
		}
		
		public function set regeneration(value:int):void 
		{
			_regeneration = value;
		}
		
		
	}
}
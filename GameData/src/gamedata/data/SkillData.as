package gamedata.data 
{
	import tools.data.DataBase;
	
	public class SkillData extends DataBase
	{
		protected var _id:int;
		
		protected var _type:int;
		
		protected var _damageId:int;
		
		protected var _level:int;
		
		protected var _cold:int;
		
		protected var _duration:int;
		
		protected var _cast:int;
		
		protected var _cost:int;
		
		protected var _costType:int;
		
		protected var _area:int;
		
		protected var _areaType:int;
		
		protected var _range:int;
		
		public function SkillData(v:Object=null) 
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
		
		public function get type():int 
		{
			return _type;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
		}
		
		public function get damageId():int 
		{
			return _damageId;
		}
		
		public function set damageId(value:int):void 
		{
			_damageId = value;
		}
		
		public function get level():int 
		{
			return _level;
		}
		
		public function set level(value:int):void 
		{
			_level = value;
		}
		
		public function get cold():int 
		{
			return _cold;
		}
		
		public function set cold(value:int):void 
		{
			_cold = value;
		}
		
		public function get duration():int 
		{
			return _duration;
		}
		
		public function set duration(value:int):void 
		{
			_duration = value;
		}
		
		public function get range():int 
		{
			return _range;
		}
		
		public function set range(value:int):void 
		{
			_range = value;
		}
		
		public function get areaType():int 
		{
			return _areaType;
		}
		
		public function set areaType(value:int):void 
		{
			_areaType = value;
		}
		
		public function get area():int 
		{
			return _area;
		}
		
		public function set area(value:int):void 
		{
			_area = value;
		}
		
		public function get costType():int 
		{
			return _costType;
		}
		
		public function set costType(value:int):void 
		{
			_costType = value;
		}
		
		public function get cost():int 
		{
			return _cost;
		}
		
		public function set cost(value:int):void 
		{
			_cost = value;
		}
		
		public function get cast():int 
		{
			return _cast;
		}
		
		public function set cast(value:int):void 
		{
			_cast = value;
		}
		
	}

}
package gamedata.data 
{
	import tools.data.DataBase;
	public class BuffData extends DataBase
	{
		private var _id:int;
		
		private var _type:int;
		
		private var _cold:int;
		
		private var _duration:int;
		
		private var _damageId:int;
		
		public function BuffData(v:Object) 
		{
			super(v);
		}
		
		public function get damageId():int 
		{
			return _damageId;
		}
		
		public function set damageId(value:int):void 
		{
			_damageId = value;
		}
		
		public function get duration():int 
		{
			return _duration;
		}
		
		public function set duration(value:int):void 
		{
			_duration = value;
		}
		
		public function get cold():int 
		{
			return _cold;
		}
		
		public function set cold(value:int):void 
		{
			_cold = value;
		}
		
		public function get type():int 
		{
			return _type;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		
	}
}
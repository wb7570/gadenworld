package gamedata.data 
{
	import tools.data.DataBase;
	
	public class DamageData extends DataBase
	{
		protected var _id:int;
		
		protected var _type:int;
		
		protected var _base:int;
		
		protected var _mult:Number;
		
		public function DamageData(v:Object=null) 
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
		
		public function get base():int 
		{
			return _base;
		}
		
		public function set base(value:int):void 
		{
			_base = value;
		}
		
		public function get mult():Number 
		{
			return _mult;
		}
		
		public function set mult(value:Number):void 
		{
			_mult = value;
		}
		
	}

}
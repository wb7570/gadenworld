package gamedata.data 
{
	import tools.data.DataBase;
	
	public class ProfessionData extends DataBase
	{
		protected var _id:int;
		
		protected var _level:int;
		
		protected var _attrs:String;
		
		protected var _need:String;
		
		public function ProfessionData(v:Object=null) 
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
		
		public function get level():int 
		{
			return _level;
		}
		
		public function set level(value:int):void 
		{
			_level = value;
		}
		
		public function get attrs():String 
		{
			return _attrs;
		}
		
		public function set attrs(value:String):void 
		{
			_attrs = value;
		}
		
		public function get need():String 
		{
			return _need;
		}
		
		public function set need(value:String):void 
		{
			_need = value;
		}
		
	}

}
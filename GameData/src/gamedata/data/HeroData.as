package gamedata.data 
{
	import tools.data.DataBase;

	public class HeroData extends DataBase
	{
		protected var _id:int;
		
		protected var _attrbase:int;
		
		protected var _name:String;
		
		protected var _profession:String;
		
		protected var _equips:String;
		
		protected var _skills:String;
		
		public function HeroData(v:Object=null) 
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
		
		public function get attrbase():int 
		{
			return _attrbase;
		}
		
		public function set attrbase(value:int):void 
		{
			_attrbase = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get profession():String 
		{
			return _profession;
		}
		
		public function set profession(value:String):void 
		{
			_profession = value;
		}
		
		public function get equips():String 
		{
			return _equips;
		}
		
		public function set equips(value:String):void 
		{
			_equips = value;
		}
		
		public function get skills():String 
		{
			return _skills;
		}
		
		public function set skills(value:String):void 
		{
			_skills = value;
		}
		
	}
}
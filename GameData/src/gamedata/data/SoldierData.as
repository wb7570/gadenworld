package gamedata.data 
{
	import sinterface.game.ISoldierInfo;
	import tools.data.DataBase;
	
	public class SoldierData extends DataBase
	{
		private var _id:int;
		private var _name:String;
		private var _symbol:String;
		private var _icon:String
		
		public function SoldierData(v:Object=null) 
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
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get symbol():String 
		{
			return _symbol;
		}
		
		public function set symbol(value:String):void 
		{
			_symbol = value;
		}
		
		public function get icon():String 
		{
			return _icon;
		}
		
		public function set icon(value:String):void 
		{
			_icon = value;
		}
	}
}
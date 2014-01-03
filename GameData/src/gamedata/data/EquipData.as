package gamedata.data 
{
	import sinterface.game.IEquipInfo;
	import tools.data.DataBase;
	
	public class EquipData extends DataBase
	{
		protected var _id:int;
		protected var _attrs:String;
		
		public function EquipData(v:Object=null) 
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
		
		public function get attrs():String 
		{
			return _attrs;
		}
		
		public function set attrs(value:String):void 
		{
			_attrs = value;
		}
		
		
	}
}
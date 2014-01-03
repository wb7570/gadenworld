package tools.data 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author ...
	 */
	public class ListGroup
	{
		protected var _map:Dictionary;
		protected var _arr:Array;
		public var idField:String;
		
		public function ListGroup(idField:String="id")
		{
			this.idField = idField;
			_map = new Dictionary();
			_arr = new Array();
		}

		public function add(v:*):void
		{
			_arr.push(v);
			addMap(v);
		}
		
		protected function addMap(v:*):void
		{
			if (v.hasOwnProperty(idField)) {
				_map[v[idField]] = v;
			}
		}

		public function getItemById(id:*):*
		{
			return _map[id];
		}

		public function getItemByGroup(value:*,key:String="id",indexKey:String="id"):Object
		{
			var result:Object = new Object();
			for (var i:int = 0,len:int=_arr.length; i < len; i++) {
				if (_arr[i][key] == value)
				{
					result[_arr[i][indexKey]] = _arr[i];
				}
			}
			return result;
		}

		public function remove(v:*):void
		{
			var index:int = _arr.indexOf(v);
			if (index != -1) {
				_arr.splice(index, 1);
			}
			
			if (v.hasOwnProperty(idField)) {
				delete _map[v[idField]];
			}
		}
		
		public function get source():Array {
			return _arr;
		}
		
		public function set source(v:Array):void
		{
			_arr = new Array();
			_map = new Dictionary();
			for (var i:uint = 0, len:uint = v.length; i < len; i++) {
				add(v[i]);
			}
		}
		
		
		static public function createListGroup(v:Array,dataBaseClass:Class,idField:String="id"):ListGroup
		{
			var result:ListGroup = new ListGroup(idField);
			for (var i:uint = 0, len:uint = v.length; i < len; i++) {
				var db:* = new dataBaseClass();
				db.setData(v[i]);
				result.add(db);
			}
			return result;
		}
		
		static public function createListArrayGroup(v:Array, dataBaseClass:Class, idField:String = "id"):ListArrayGroup
		{
			var result:ListArrayGroup = new ListArrayGroup(idField);
			for (var i:uint = 0, len:uint = v.length; i < len; i++) {
				var db:* = new dataBaseClass();
				db.setData(v[i]);
				result.add(db);
			}
			return result;
		}
	}
}
package tools.data 
{
	/**
	 * ...
	 * @author 
	 */
	public class ListArrayGroup extends ListGroup
	{		
		public function ListArrayGroup(idField:String="id") 
		{
			super(idField);
		}
		
		override protected function addMap(v:*):void 
		{
			if (!v.hasOwnProperty(idField)) {
				return;
			}
			
			if (_map[v[idField]] == null) {
				_map[v[idField]] = [];
			}
			_map[v[idField]].push(v);
		}
		
		public function getItemFromArray(v:*,key:String="id",keyValue:Object=null):Object
		{
			if (_map[v] == null) {
				return null;
			}
			
			var tempArr:Array = _map[v];
			
			if (keyValue == null) {
				return tempArr;
			}
			
			for (var i:int = 0,len:int=tempArr.length; i < len; i++) {
				if (tempArr[i][key] == keyValue)
				{
					return tempArr[i];
				}
			}
			
			return null;
		}
	}

}
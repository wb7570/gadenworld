package battlemain.data 
{
	/**
	 * ...
	 * @author 
	 */
	public class DataBase 
	{
		
		public function DataBase(data:Object=null) 
		{
			setData(data);
		}
		
		public function setData(value:Object):void
		{
			if (value == null) {
				return ;
			}
			
			for (var p:String in value) {
				this[p] = value[p];
			}
		}
		
	}

}
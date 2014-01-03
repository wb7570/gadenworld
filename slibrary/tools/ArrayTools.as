package tools 
{
	/**
	 * ...
	 * @author 
	 */
	public class ArrayTools 
	{
		
		public function ArrayTools() 
		{
			
		}
		
		
		static public function vectChangetoArray(vect:Object):Array
		{
			var result:Array = new Array();
			for (var i:int = 0,leni:int=vect.length; i < leni; i++) 
			{
				result.push(vect[i]);
			}
			return result;
		}
	}

}
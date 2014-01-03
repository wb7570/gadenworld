package tools 
{
	/**
	 * ...
	 * @author 
	 */
	public class MathTool 
	{
		
		static public function equalsArray(value1:Array,value2:Array):Boolean
		{
			if (value1 == null || value2 == null) return false;
			if (value1.length != value2.length) return false;
			for (var i:uint = 0, len:uint = value1.length; i < len; i++) {
				if (value1[i] != value2[i]) return false;
			}
			return true;
		}
		
	}

}
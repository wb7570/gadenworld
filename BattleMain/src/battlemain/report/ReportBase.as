package battlemain.report 
{
	/**
	 * ...
	 * @author 
	 */
	public class ReportBase 
	{
		public var type:String;
		
		public var status:int;
		
		public var time:uint;
		
		public function ReportBase() 
		{
			time = GameMain.instance.bf.time;
		}
		
	}

}
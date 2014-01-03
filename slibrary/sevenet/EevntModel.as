package sevenet 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class EevntModel extends Event
	{
		static public const MESSAGE:String = "message";
		static public const FINDMODEL:String = "findmodel";
		static public const RPC:String = "rpc";
		
		public var data:*;
		
		public function EevntModel(type:String,data:*, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
		
	}

}
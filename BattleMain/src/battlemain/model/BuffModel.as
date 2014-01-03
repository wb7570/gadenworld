package battlemain.model 
{
	import sinterface.game.IBuffInfo;
	public class BuffModel 
	{
		public var damageId:int;
		public var duration:int;
		public var cold:int;
		public var type:int;
		
		
		public var damages:Array;
		public var info:IBuffInfo;
		public var lastTime:int;
		public var ad:int;
		public var ap:int;
		
		
		public function BuffModel(v:IBuffInfo) 
		{
			
			setInfo(v);
		}
		
		public function setInfo(v:IBuffInfo):void 
		{
			info = v;
			type = info.type;
			cold = info.cold;
			duration = info.duration;
			damageId = info.damageId;
			
			damages = GameMain.instance.getDamageModels(damageId);
		}
		
		public function get nextTime():int
		{
			return lastTime + cold;
		}
	}
}
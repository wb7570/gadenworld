package battlemain.model 
{
	import sinterface.game.IStatus;
	
	public class StatusModel implements IStatus
	{
		private var _stun:int;
		private var _underattack:int;
		private var _statusTime:Object;
		
		public function StatusModel() 
		{
			_statusTime = new Object();
		}
		
		public function getStatusTime(type:int):int
		{
			return _statusTime[type];
		}
		
		public function setStatus(type:int, time:int):void
		{
			_statusTime[type] = GameMain.instance.bf.time + time;
			
			switch(type) {
				case 1:
					_underattack = 1;
					break;
				case 10:
					_stun = 1;
					break;
			}
		}
		
		public function resetStatus(type:int):void
		{
			switch(type) {
				case 1:
					_underattack = 0;
					break;
				case 10:
					_stun = 0;
					break;
			}
		}
		
		public function updateStatus():void 
		{
			var nowTime:int = GameMain.instance.bf.time;
			
			for (var type:String in _statusTime) {
				if (_statusTime[type] < nowTime)
				{
					delete _statusTime[type];
					resetStatus(int(type));
				}
			}
		}
		
		public function get stun():int 
		{
			return _stun;
		}
		
		public function set stun(value:int):void 
		{
			_stun = value;
		}
		
		public function get underattack():int 
		{
			return _underattack;
		}
		
		public function set underattack(value:int):void 
		{
			_underattack = value;
		}
		
	}

}
package battlemain.model 
{
	import sinterface.battle.IDamage;
	import sinterface.game.IDamageInfo;
	
	public class DamageModel implements IDamage
	{
		private var _id:int;
		
		private var _info:IDamageInfo;
		
		private var _ad:int;
		private var _ap:int;
		
		public function DamageModel(value:IDamageInfo) 
		{
			setDamageData(value);
		}
		
		public function setDamageData(value:IDamageInfo):void
		{
			_info = value;
		}
		
		
		public function getDamage():int
		{
			switch(type) {
				case 1:
					var ex:int = _ad;
					break;
				case 2:
					ex = _ap;
					break;
			}
			
			
			return _info.base + ex * _info.mult;
		}
		
		public function setAdd(v1:int,v2:int):void
		{
			_ad = v1;
			_ap = v2;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function get type():int 
		{
			return _info.type;
		}
		
		public function get base():int 
		{
			return _info.base;
		}
		
		public function get mult():Number 
		{
			return _info.mult;
		}
		
		public function get ad():int 
		{
			return _ad;
		}
		
		public function get ap():int 
		{
			return _ap;
		}
	}
}
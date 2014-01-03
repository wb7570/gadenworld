package battlemain 
{
	import flash.geom.Point;
	import sinterface.battle.IBattle;
	import sinterface.battle.IMapTile;
	import sinterface.battle.ISoldier;
	/**
	 * ...
	 * @author 
	 */
	public class BattleField implements IBattle
	{
		private var _time:uint;
		private var _soldiers:Array;
		
		public function BattleField() 
		{
			_soldiers = new Array();
		}
		
		public function addSoldiers(v:Array):void
		{
			for (var i:int = 0,len:int=v.length; i < len; i++) {
				_soldiers.push(v[i]);
			}
		}
		
		public function set time(value:uint):void
		{
			_time = value;
		}
		
		public function get time():uint
		{
			return _time;
		}
		
		public function get soldiers():Array 
		{
			return _soldiers;
		}
		
		public function getSoldiers():Array
		{
			var result:Array = new Array();
			
			for (var i:int = 0,len:int=_soldiers.length; i < len; i++) 
			{
				if (_soldiers[i].hp <= 0) {
					continue;
				}
				
				result.push(_soldiers[i]);
			}
			
			return result;
		}
		
		public function getEnemyTeam(value:int):Array
		{
			var result:Array = new Array();
			
			var sArr:Array = getSoldiers();
			for each (var item:ISoldier in sArr) {
				if (item.team != value) {
					result.push(item)
				}
			}
			return result;
		}
		
		public function getMyTeam(value:int):Array
		{
			var result:Array = new Array();
			var sArr:Array = getSoldiers();
			for each (var item:ISoldier in sArr) {
				if (item.team == value) {
					result.push(item)
				}
			}
			return result;
		}
		
		public function getPlayerById(id:int):ISoldier
		{
			for (var i:int = 0, len:int = _soldiers.length; i < len; i++) {
				if (_soldiers[i].id == id)
				{
					return _soldiers[i];
				}
			}
			return null;
		}
		
		public function getMapTile(value:Point):IMapTile
		{
			return null;
		}
		
		public function setMapdata(v:Object):void
		{
			var teamObj:Object = v.team1;
			var p1:Point = teamObj.point;
			var t1:Object = teamObj.formation;
			teamObj = v.team2;
			var p2:Point = teamObj.point;
			var t2:Object = teamObj.formation;
			
			for (var i:int = 0, len:int = _soldiers.length; i < len; i++) {
				if (_soldiers[i].team == 1)
				{
					_soldiers[i].setPosition(t1[_soldiers[i].id].add(p1));
				}else {
					_soldiers[i].setPosition(t2[_soldiers[i].id].add(p2));
				}
			}
			
		}
	}
}
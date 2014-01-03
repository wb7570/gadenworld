package sinterface.battle 
{
	import flash.geom.Point;
	public interface IBattle 
	{
		function get time():uint;
		
		function getSoldiers():Array;
		
		function getEnemyTeam(value:int):Array;
		
		function getMyTeam(value:int):Array;
		
		function getMapTile(value:Point):IMapTile;
	}
	
}
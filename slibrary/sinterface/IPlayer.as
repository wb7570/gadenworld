package sinterface 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IPlayer extends IPlayerInfo
	{
		/**
		 * 最后行动时间
		 */
		function get time():uint;
		
		/**
		 * 下次行动时间
		 */
		function get nextTime():uint;
		
		/**
		 * 队伍编号
		 */
		function get team():int;
		
		function getHeroInfo():Object
		
		function getTactics():Vector.<ITactic>;
		
		function getSkill(id:int):ISkill;
		
		function getPosition():Point
		
		function getDistance(value:Point):int;
		
		function getMoveReport(value:Point):Object
		function getClosedReport(value:Point):Object
		function getKeepReport(value:Point):Object
		
		function getDamageReport(value:IDamage):Object
	}
}
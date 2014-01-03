package sinterface.battle 
{
	import flash.geom.Point;
	import sinterface.game.ISoldierInfo;
	import sinterface.game.IStatus;
	
	public interface ISoldier extends ITeamer
	{
		function getTactics():Array;
		function getSkill(id:int):ISkill;
		function getPosition():Point;
		function getDistance(value:Point):int;
		function getMoveReport(value:Point):Object;
		function getDamageReport(value:IDamage):Object;
		function getBuffReport():Array;
		function getStatusReport():Object;
		function getBuffs():Array;
		
		function get status():IStatus 
		function updateTurn():void
		function checkTurn():Boolean
		
		function getSkillTime(id:int):int
		function setSkillTime(id:int,t:int):void
		
		function get hp():int 
		
		function set hp(value:int):void 
		
		function get mp():int 
		
		function set mp(value:int):void 
		
		function get info():ISoldierInfo
		
		function get lastPosition():Point 
	}
	
}
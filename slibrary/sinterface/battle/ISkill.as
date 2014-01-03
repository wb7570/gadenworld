package sinterface.battle 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author 
	 */
	public interface ISkill 
	{
		function get nextTime():uint;
		
		function get duration():int 
		
		function get cast():int 
		
		function get cost():int 
		
		function get costType():int 
		
		function get area():int 
		
		function get areaType():int 
		
		function get range():int 
		
		function get cold():int 
		
		function get level():int 
		
		function get type():int 
		
		function checkDistance(v:int):Boolean;
		
		function checkTarget(d:Point, v:ISoldier = null):Boolean;
		
		function getReport(player:ISoldier, targets:Array):Object;
	}
	
}
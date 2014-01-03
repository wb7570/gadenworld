package sinterface.game 
{
	public interface IHeroInfo 
	{		
		function get id():int;
		
		function get attrbase():int;
		
		function get name():String;
		
		function get profession():String;
		
		function get equips():String;
		
		function get skills():String;
		
		function getSoldier():ISoldierInfo
	}

}
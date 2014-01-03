package sinterface 
{
	/**
	 * ...
	 * @author 
	 */
	public interface ISWorldData extends ISModel
	{
		
		function getHero(heroId:int, level:int):Object;
		
		function getSkill(skillId:int, level:int):Object;
		
		function setData(value:Object):void;
	}

}
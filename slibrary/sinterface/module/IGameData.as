package sinterface.module 
{
	import sinterface.game.IUserInfo;
	
	public interface IGameData extends IModule
	{
		function getUser():IUserInfo
		function getStaticData():Object
	}
	
}
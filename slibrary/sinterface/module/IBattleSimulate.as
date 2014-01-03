package sinterface.module 
{
	import sinterface.battle.IBattle;
	
	public interface IBattleSimulate extends IModule
	{
		function getRport(v:IBattle):Object
	}
	
}
package sinterface.game 
{
	public interface IStatus
	{
		function get stun():int;
		function get underattack():int;
		function getStatusTime(type:int):int;
		
	}

}
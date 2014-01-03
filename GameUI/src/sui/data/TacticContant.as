package sui.data 
{
	/**
	 * ...
	 * @author 
	 */
	public class TacticContant 
	{
		
		static public const content_hp:String = "hp";
		static public const content_mp:String = "mp";
		static public const content_profession:String = "profession";
		static public const content_buff:String = "buff";
		//static public const content_team:String = "team";
		static public const content_alltime:String = "alltime";
		
		static public const comparison_more:String = "more";
		static public const comparison_less:String = "less";
		
		static public const action_move:String = "move";
		static public const action_skill:String = "skill";
		
		//static public const TARGET_PLAYER:String = "player";
		static public const TARGET_ALLTEAM:String = "allteam";
		static public const TARGET_ALLENEMY:String = "allenemy";
		static public const TARGET_ENEMY:String = "enemy";
		static public const TARGET_TEAMMATE:String = "teammate";
		
		
		
		static public function getTargets():Array
		{
			return [TARGET_TEAMMATE,TARGET_ENEMY,TARGET_ALLENEMY,TARGET_ALLTEAM];
		}
		
		
	}

}
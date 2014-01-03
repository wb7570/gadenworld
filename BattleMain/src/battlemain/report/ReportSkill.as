package battlemain.report 
{
	import battlemain.model.Soldier;
	/**
	 * ...
	 * @author 
	 */
	public class ReportSkill extends ReportBase
	{
		public var sid:int;
		
		public var buff:int;
		
		public var skillId:int;
		
		public var damageReport:Array;
		
		public function ReportSkill() 
		{
			type = "skill";
		}
		
		public function toString():String
		{
			var smodel:Soldier = GameMain.instance.bf.getPlayerById(sid) as Soldier;
			
			var result:String = "英雄(" + smodel.team + "." + smodel.name + ") 使用了技能 " + GameMain.instance.mGameData.getStaticData().langSkill.getItemById(skillId).name;
			
			
			if (!damageReport || damageReport.length == 0) {
				result += "\n";
				result += "未造成伤害";
			}
			
			for (var i:int = 0,leni:int=damageReport.length; i < leni; i++) 
			{
				result += "\n";
				result += damageReport[i].toString();
			}
			
			return result;
		}
	}

}
package battlemain.report 
{
	import battlemain.model.Soldier;
	public class ReportBuff extends ReportBase
	{
		public var buffid:int;
		public var sid:int;
		public var damageReport:Array;
		
		public function ReportBuff() 
		{
			type = "buff";
			damageReport = new Array();
		}
		
		public function toString():String
		{
			var smodel:Soldier = GameMain.instance.bf.getPlayerById(sid) as Soldier;
			//
			//var result:String = "英雄(" + smodel.team + "." + smodel.name + ") 使用了技能 " + GameMain.instance.mGameData.getStaticData().langSkill.getItemById(skillId).name;
			
			
			//var result:String = "受到 " + GameMain.instance.mGameData.getStaticData().buffName.getItemById(buffid).name + " 效果";
			var result:String = "英雄(" + smodel.team + "." + smodel.name + ") 受到" +  "buff:"+buffid + "效果";
			if (!damageReport || damageReport.length == 0) {
				result += "\n";
				result += "未造成伤害";
			}
			
			for (var i:int = 0,leni:int=damageReport.length; i < leni; i++) {
				result += "\n";
				result += damageReport[i].toString();
			}
			
			return result;
		}
	}

}
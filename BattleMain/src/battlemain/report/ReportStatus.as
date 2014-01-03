package battlemain.report 
{
	import battlemain.model.Soldier;
	import battlemain.model.StatusModel;
	public class ReportStatus extends ReportBase
	{
		public var id:int;
		public var sid:int
		public var info:Object;
		
		public function ReportStatus(v:Soldier) 
		{
			type = "status";
			sid = v.id;
			
			info = new Object();
			info["stun"] = v.status.stun;
			info["underattack"] = v.status.underattack;
		}
		
		public function toString():String
		{
			var smodel:Soldier = GameMain.instance.bf.getPlayerById(sid) as Soldier;
			var s:String = "";
			
			if (info["underattack"]) {
				s += " 眩晕 :" + smodel.status.getStatusTime(10);
			}
			//if (info["stun"]) {
				//s+= " 受到攻击"
			//}
			
			if (s != "") {
				
				s = "英雄(" + smodel.team + "." + smodel.name + ") 状态: " + s;
			
			}
			
			return s;
		}
		
	}

}
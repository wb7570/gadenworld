package battlemain.report 
{
	import battlemain.model.Soldier;
	/**
	 * ...
	 * @author 
	 */
	public class ReportDamage extends ReportBase
	{
		public var damage:int;
		public var damageType:int;
		//public var target:int;
		public var sid:int;
		
		public function ReportDamage() 
		{
			type = "damage";
			super();
		}
		
		public function toString():String
		{
			//var smodel:Soldier = GameMain.instance.bf.getPlayerById(player) as Soldier;
			var tmodel:Soldier = GameMain.instance.bf.getPlayerById(sid) as Soldier;
			
			if (damageType == 3) {
				return "恢复" + damage + "点生命(" + damageType + ")" + "	剩余生命:"+tmodel.hp;
			}
			
			return "造成" + damage + "点伤害(" + damageType + ")" + "	剩余生命:"+tmodel.hp;
		}
	}
}
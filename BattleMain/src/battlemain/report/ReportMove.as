package battlemain.report 
{
	import battlemain.model.Soldier;
	import flash.geom.Point;
	/**
	 * ...
	 * @author 
	 */
	public class ReportMove extends ReportBase
	{
		public var sid:int;
		public var from:Point;
		public var to:Point;
		public var result:Point;
		public var path:Array;
		
		public function ReportMove() 
		{
			type = "move";
		}
		
		public function  toString():String
		{
			var smodel:Soldier = GameMain.instance.bf.getPlayerById(sid) as Soldier;
			
			return "英雄(" + smodel.team + "." + smodel.name + ")从 " + from.toString() +" 前往 " + to.toString() + " 停留在" + result.toString();
		}
	}

}
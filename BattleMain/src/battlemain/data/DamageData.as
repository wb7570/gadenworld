package battlemain.data 
{
	import tools.data.DataBase;
	/**
	 * ...
	 * @author 
	 */
	public class DamageData extends DataBase
	{
		
		public var id:int;
		
		public var damageid:int;
		/**
		 * 伤害类型
		 * 1:物理,2:法术,3:真实
		 */
		public var type:int;
		/**
		 * 触发类型
		 * 1:技能命中时
		 */
		public var trigger:int;
		
		public var base1:int;
		
		public var add1:Number;
		
		public var base2:int;
		
		public var add2:Number;
		/**
		 * 目标类型
		 * 0:无,1:敌人,2:队友,3:自己
		 */
		public var targettype:int;
		/**
		 * 目标数量
		 * 0:无限制
		 */
		public var targetnum:int;
		
		public var buffid:int;
		/**
		 * 命中概率
		 */
		public var hit:int;
		
		public function DamageData(data:Object=null)  
		{
			super(data);
		}
		
	}

}
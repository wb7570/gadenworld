package sdata.data 
{
	/**
	 * ...
	 * @author 
	 */
	public class SkillDetails extends DataBase
	{
		public var id:int;
		/**
		 * 技能系列
		 */
		public var type:int;
		/**
		 * 技能等级
		 */
		public var level:int;
		/**
		 * 冷却时间
		 */
		public var cold:int;
		/**
		 * 对应dmage表
		 */
		public var damageid:int;
		/**
		 * 释放距离
		 */
		public var range:int;
		/**
		 * 技能范围类型 
		 * 0:无范围,1:圆
		 */
		public var areatype:int;
		/**
		 * 技能范围大小
		 */
		public var area:int;
		/**
		 * 技能释放消耗类型
		 * 0:无消耗,1:hp,2:mp
		 */
		public var costtype:int;
		/**
		 * 技能释放消耗
		 */
		public var cost:int;
		/**
		 * 技能释放吟唱时间
		 */
		public var cast:int;
		/**
		 * 技能释放引导时间
		 */
		public var duration:int;
		
		public function SkillDetails(data:Object=null)  
		{
			super(data);
		}
		
	}

}
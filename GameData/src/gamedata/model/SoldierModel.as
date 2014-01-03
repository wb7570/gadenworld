package gamedata.model 
{
	import flash.geom.Point;
	import gamedata.data.SoldierData;
	import sinterface.game.IAttributeInfo;
	import sinterface.game.ISoldierInfo;
	import tools.MapTitleTools;
	
	public class SoldierModel extends SoldierData implements ISoldierInfo
	{
		private var _attr:AttributeModel;
		private var _base:AttributeModel;
		private var _mult:AttributeModel;
		private var _skills:Array;
		private var _team:int;
		private var _tactics:Array;
		private var _profession:String;
		
		public function SoldierModel(v:Object=null) 
		{
			super(v);
			_base = new AttributeModel();
			_mult = new AttributeModel();
		}
		
		public function addAttrModel(v:AttributeModel):void
		{
			if (v.type == 1) {
				_base = _base.add(v);
			}else {
				_mult = _mult.add(v);
			}
			_attr = _base.add(_base.getMultAttrModel(_mult));
		}		
		
		public function addAttribute(v1:AttributeModel,v2:AttributeModel):AttributeModel
		{
			var result:AttributeModel = new AttributeModel();
			result = v1.add(v2);
			return result;
		}
		
		public function get attr():IAttributeInfo 
		{
			return _attr;
		}
		
		public function get base():IAttributeInfo 
		{
			return _base;
		}
		
		public function get mult():IAttributeInfo 
		{
			return _mult;
		}
		
		public function get skills():Array 
		{
			return _skills;
		}
		
		public function set skills(value:Array):void 
		{
			_skills = value;
		}
		
		public function get team():int 
		{
			return _team;
		}
		
		public function set team(value:int):void 
		{
			_team = value;
		}
		
		public function get profession():String 
		{
			return _profession;
		}
		
		public function set profession(value:String):void 
		{
			_profession = value;
		}
		
		public function getSkills():Array
		{
			return _skills;
		}
	}
}
package battlemain.model 
{
	import battlemain.data.DataBase;
	import sinterface.game.ITacticCondition;
	public class TacticConditionModel extends DataBase implements ITacticCondition
	{
		private var _content:String;
		
		private var _type:String;
		
		private var _value:int;
		
		public function TacticConditionModel(v:Object=null) 
		{
			super(v);
		}
		
		public function get content():String 
		{
			return _content;
		}
		
		public function set content(value:String):void 
		{
			_content = value;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get value():int 
		{
			return _value;
		}
		
		public function set value(value:int):void 
		{
			_value = value;
		}
		
	}

}
package 
{
	import battlefield.Controller;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import sinterface.battle.IBattle;
	import sinterface.module.IBattleSimulate;
	
	public class BattleSimulate extends Sprite implements IBattleSimulate
	{
		private var _moduleName:String;
		private var _moduleType:String;
		
		public var controller:Controller;
		
		public function BattleSimulate():void 
		{
			_moduleType = "battleSimulate";
			
			controller = new Controller();
		}
		
		public function getDefinition(value:String):*
		{
			return ApplicationDomain.currentDomain.getDefinition(value);
		}
		
		public function get modelType():String
		{
			return _moduleType;
		}
		
		public function get modelName():String
		{
			return _moduleName;
		}
		
		public function set modelName(value:String):void
		{
			_moduleName = value;
		}
		
		public function init(v:Object=null):void
		{
			
		}
		
		public function getRport(v:IBattle):Object
		{
			return controller.getReport(v);
		}
	}
}
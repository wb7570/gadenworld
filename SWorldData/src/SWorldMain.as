package  
{
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import sdata.data.DataBox;
	import sevenet.EevntModel;
	import sinterface.ISkill;
	import sinterface.ISModel;
	import sinterface.ISoldier;
	import sinterface.ISWorldData;
	/**
	 * ...
	 * @author 
	 */
	public class SWorldMain extends Sprite implements ISWorldData
	{
		
		public function SWorldMain() 
		{
			
		}
		
		public function get modelType():String
		{
			return "sWorldData";
		}
		
		
		public function init():void
		{
			//dispatchEvent(new EevntModel(EevntModel.MESSAGE, {type:"rpc",rpc:"getInfo",callback:rpcHandler } ));
		}
		
		public function setData(value:Object):void 
		{
			DataBox.instant = new DataBox();
			DataBox.instant.setData(value);
		}
		
		public function getHero(heroId:int, level:int):Object
		{
			return DataBox.instant.heros.getItemById(heroId);
		}
		
		public function getSkill(skillId:int, level:int):Object
		{
			return DataBox.instant.skills.getItemById(skillId);
		}
		
		private var _modelName:String;
		public function get modelName():String
		{
			return _modelName;
		}
		
		public function set modelName(value:String):void
		{
			_modelName = value;
		}
		
		public function getDefinition(value:String):*
		{
			if (ApplicationDomain.currentDomain.hasDefinition(value) == false) {
				return null;
			}
			return ApplicationDomain.currentDomain.getDefinition(value);
		}
	}

}
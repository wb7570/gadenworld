package
{
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import gamedata.model.PlayerModel;
	import gamedata.model.UserModel;
	import sinterface.game.IUserInfo;
	import sinterface.module.IGameData;
	
	public class GameData extends Sprite implements IGameData
	{
		static public  var instance:GameData;
		
		public var data:GameDataModule;
		private var _userModel:UserModel;
		private var _moduleName:String;
		private var _moduleType:String;
		
		public function GameData()
		{
			instance = this;
			
			_moduleType = "gameData";
		}
		
		public function init(v:Object=null):void
		{
			data = new GameDataModule();
			_userModel = new UserModel();
		}
		
		
		public function getUser():IUserInfo
		{
			return _userModel;
		}
		
		public function getStaticData():Object
		{
			return data;
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
			return _moduleType;
		}
		
		public function set modelName(value:String):void
		{
			_moduleName = value;
		}
	}
}
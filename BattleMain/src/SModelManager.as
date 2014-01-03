package  
{
	//import rpc.RpcServer;
	import sevenet.EevntModel;
	import sinterface.battle.ISModel;
	//import tools.data.ListArrayGroup;
	import tools.data.ListGroup;
	public class SModelManager 
	{
		
		public var vectModels:Vector.<ISModel>;
		
		
		
		public var models:ListGroup;
		
		public function SModelManager() 
		{
			vectModels = new Vector.<ISModel>();
			models = new ListGroup("modelType");
			//server = new RpcServer();
		}
		
		public function addModel(value:ISModel):void
		{
			vectModels.push(value);
			
			models.add(value);
			value.addEventListener(EevntModel.MESSAGE, model_messageHandler);
			value.init();
		}
		
		public function getModel(type:String,name:String=null):ISModel
		{
			return models.getItemById(type) as ISModel;
		}
		
		private function model_messageHandler(e:EevntModel):void 
		{
			var model:ISModel = e.currentTarget as ISModel;
			var data:Object = e.data;
			
			
			if (e.data.type == "rpc") {
				//server.aSend(data.rpc,data.data,data.callback);
			}else if (e.type == "findmodel") {
				getModel(e.data.type, e.data.name);
			}
		}
	}
}
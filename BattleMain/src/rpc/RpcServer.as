package rpc {
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;

	public class RpcServer extends EventDispatcher{

		private var _type:String = "json";
		private var aCMD:Array = [];
		private var oData:ByteArray = new ByteArray();
		private var oLoader:URLLoader = new URLLoader();
		private var oRequest:URLRequest = new URLRequest();
		private var oHandler:CommandHandler = new CommandHandler();
		private var aHandler:Vector.<CommandHandler> = new Vector.<CommandHandler>();
		private var bSending:Boolean = false;
		private var bTimeout:Boolean = false;
		private var nTimeout:int = 30000;
		private var nTimeOffset:int = 0;
		private var messages:Object = {};
		private var mid:int = 1;

		public function RpcServer()
		{
			//oData.writeByte(0x11);
			oRequest = new URLRequest("http://127.0.0.1/loworld/server.php");
			oRequest.method = URLRequestMethod.POST;
			oRequest.contentType = "application/octet-stream";
			//oRequest.data = oData;

			//oLoader.dataFormat = URLLoaderDataFormat.BINARY;
			oLoader.addEventListener(Event.COMPLETE, onComplete);
			oLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			oLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			oLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
			
		}

		public function getMsgById(mid:int):Object {
			var data:Object = messages[mid];
			parseMsg(data);
			delete messages[mid];
			if (data == 1) {
				data = null;
			}
			return data;
		}

		private function parseMsg(data:Object):void 
		{
		}

		public function aSend(name:String, data:Object = null, func:Function = null, args:Array = null):int 
		{
			if (data == null) 
			{
				data = {};
			}
			aCMD.push([name, data]);
			var msgId:int = mid++;
			send(func, args, msgId);
			return msgId;
		}

		private function onStatus(e:HTTPStatusEvent):void 
		{
		}

		public function isEmpty():Boolean 
		{
			return aCMD.length == 0;
		}

		public function getTime():int 
		{
			return getTimer() / 1000 + nTimeOffset;
		}

		public function push(name:String, data:Object = null, func:Function = null, args:Array = null):void 
		{
			if (data == null)
				data = {};
			aCMD.push([name, data]);
			if (func != null)
				send(func, args);
		}

		public function send(func:Function = null, args:Array = null, mid:int = 0):void 
		{
			var handler:CommandHandler = new CommandHandler();
			handler.cmds = aCMD.splice(0, aCMD.length);
			handler.func = func;
			handler.args = args;
			if (mid != 0){
				handler.mid = mid;
				messages[mid] = 1;
			}
			if (bSending)
				aHandler.push(handler);
			else {
				oHandler = handler;
				bSending = true;
				load();
			}
		}

		public function save(func:Function = null, args:Array = null):void 
		{
			if (isEmpty() == false)
			{
				send(func, args);
			}
		}

		private function load():void 
		{
			oLoader.load(oRequest);
		}
		
		private function onComplete(e:Event):void 
		{
			var data:Object = getData();
			oHandler.executeWith(data);
		}
		
		
		private function getData():Object
		{
			if (_type == "json") {
				return JSON.parse(oLoader.data);
				
			}
			
			return null;
		}

		private function onError(e:Event):void {
		}
	}
}

class CommandHandler {
	public var cmds:Array;
	public var mid:int;
	public var func:Function;
	public var args:Array;
	
	public function CommandHandler()
	{
		
	}
	
	public function executeWith(data:*):void
	{
		if (args == null) {
			args = [];
		}
		args.push(data);
		func.apply(null, args);
	}
}
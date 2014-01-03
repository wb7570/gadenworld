package tools.load {
	//import app.App;
	//import app.utils.JPEG;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import tools.queue.QueueMethod;

	public class LoaderManager {
		
		public static const SWF:int = 0;
		public static const IMG:int = 1;
		public static const BMD:int = 2;
		public static const AMF:int = 3;
		public static const AMF_OBJ:int = 4;
		public static const TEXT:int = 5;
		
		public var useBitmapDataHack:Boolean = false;
		
		private var _mCache:Object = {};
		private var _loader:Loader = new Loader();
		private var _preloader:Loader = new Loader();
		private var _urlLoader:URLLoader = new URLLoader();
		private var _urlRequest:URLRequest = new URLRequest();
		private var _context:LoaderContext;
		private var _handlerVect:Vector.<LoadFile> = new Vector.<LoadFile>();
		private var _lHandler:LoadFile;
		//private var _pHandler:PreloaderHandler;
		private var _isLoading:Boolean;
		
		//private var _curHandler:PreloadersHandler;
		
		public var useCurrentDomain:Boolean = false;
		public var checkPolicyFile:Boolean = true;
		
		public var loaderPool:Array = [];
		
		public function LoaderManager(applicationDomain:ApplicationDomain = null) {
			if (applicationDomain == null) {
				applicationDomain = ApplicationDomain.currentDomain;
			}
			_context = new LoaderContext(checkPolicyFile,applicationDomain);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			_preloader.contentLoaderInfo.addEventListener(Event.COMPLETE,onPreloadComplete);
			_preloader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onPreloadError);
			_urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onLoadError);
			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			_urlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
			Security.allowDomain("*");
		}
		
		public function preload(files:Array,ratio:Array,progress:Function=null,func:Function=null,args:Array=null):void {
			//for(var i:int=ratio.length,n:int=files.length;i<n;i++)ratio[i]=1;
			//_preloader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress);
			//_pHandler=new PreloaderHandler();
			//_pHandler.files=Vector.<String>(files);
			//_pHandler.ratio=Vector.<Number>(ratio);
			//_pHandler.progress=progress;
			//_pHandler.func=func;
			//_pHandler.args=args;
			preloadNext();
		}
		public function preload2(files:Array,ratio:Array,progress:Function=null,func:Function=null,args:Array=null):void {
			//for(var i:int=ratio.length,n:int=files.length;i<n;i++)ratio[i]=1;
			//_curHandler = new PreloadersHandler();
			//_curHandler.files = Vector.<String>(files);
			//_curHandler.func=func;
			//_curHandler.args=args;
			//_curHandler.ratio=Vector.<Number>(ratio);
			//_curHandler.progress=progress;
			preloadsNext();
		}
		
		public function loadSWF(file:String, args:QueueMethod = null):void 
		{
			load(SWF,file,args);
		}
		
		public function loadIMG(file:String, args:QueueMethod = null):void 
		{
			load(IMG,file,args);
		}
		
		public function loadBMD(file:String, args:QueueMethod = null):void 
		{
			load(BMD,file,args);
		}
		
		public function loadAMF(file:String, args:QueueMethod = null):void 
		{
			load(AMF,file,args);
		}
		public function loadAMFObj(file:String, args:QueueMethod = null):void 
		{
			load(AMF_OBJ,file,args);
		}
		public function loadText(file:String, args:QueueMethod = null):void 
		{
			load(TEXT,file,args);
		}
		
		public function load(type:int, file:String, callback:QueueMethod = null,context:LoaderContext=null):void {
			if (file == null) return;
			var handler:LoadFile=new LoadFile(type,file,callback,context);
			//handler.type=type;
			//handler.file=file;
			//handler.func=func;
			//handler.callback = callback;
			//handler.context = context;
			
			var cache:Object=_mCache[handler.url];
			if (cache!=null) {
				handler.executeWith(cache);
				return;
			}
			
			if (_isLoading) {
				_handlerVect.push(handler);
			}else {
				_lHandler=handler;
				_isLoading = true;
				loadNext();
			}
		}
		private function onPreloadsComplete(event:Event):void{
			//_curHandler.loaded++;
			//_curHandler.allLoaded++;
			//if((_curHandler.files.length - _curHandler.allLoaded) <= 1)
			//{
				//preloadsNext(new Loader());
				//return;
			//}
			//if(_curHandler.loaded==2)
			//{
				//preloadsNext();
			//}
			
		}
		private function addLoaderListeners(loader:Loader):void
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onPreloadsComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onPreloadError);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress2);
		}
		private function rmLoaderListeners(loader:Loader):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onPreloadsComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onPreloadError);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,onProgress2);
		}
		private var url:String;
		private function preloadsNext(loader:Loader=null):void{
			//_curHandler.loaded=0;
			//if (_curHandler.allLoaded<_curHandler.files.length) {
				//if(loader)
				//{
					//url=_curHandler.files[_curHandler.allLoaded];
					//loaderPool.push(loader);
					//addLoaderListeners(loader);
					//loader.load(getRequest(url),getLoaderDomain());
				//}else{
					//url=_curHandler.files[_curHandler.allLoaded];
					//var loader1:Loader = new Loader();
					//loaderPool.push(loader1);
					//addLoaderListeners(loader1);
					//loader1.load(getRequest(url),getLoaderDomain());
					//if((_curHandler.files.length-1)>(_curHandler.allLoaded+1))
					//{
						//url=_curHandler.files[_curHandler.allLoaded+1];
						//var loader2:Loader = new Loader();
						//loaderPool.push(loader2);
						//addLoaderListeners(loader2);
						//loader2.load(getRequest(url),getLoaderDomain());
					//}
				//}
				//return;
			//}
			//for(var i:int=0,len:int=loaderPool.length;i<len;i++)
			//{
				//rmLoaderListeners(loaderPool[i]);
			//}
			//_curHandler.execute();
			//_curHandler=null;
		}
		private var ratioLoaded:Number=0;
		private var prevRatioLoaded:Number=0;
		private function onProgress2(event:ProgressEvent):void
		{
			//var bytesTotal:int=0;
			//var bytesLoaded:int=0;
			//for(var i:int=0,n:int=_curHandler.files.length;i<n;i++) {
				//if (i<_curHandler.allLoaded)bytesLoaded+=_curHandler.ratio[i];
				//bytesTotal+=_curHandler.ratio[i];
			//}
			//ratioLoaded=bytesLoaded/bytesTotal;
			//var ratioCurrent:Number=_curHandler.ratio[_curHandler.allLoaded]/bytesTotal;
			//ratioLoaded+=ratioCurrent*(event.bytesLoaded/event.bytesTotal);
			//if(prevRatioLoaded<ratioLoaded) prevRatioLoaded=ratioLoaded;
			//if(ratioLoaded<prevRatioLoaded) ratioLoaded=prevRatioLoaded;
			//if (_curHandler.progress!=null)_curHandler.progress(ratioLoaded);
		}
		
		private function preloadNext():void {
			//if (_pHandler.loaded<_pHandler.files.length) {
				//_preloader.load(getRequest(_pHandler.files[_pHandler.loaded]),_context);
				//return;
			//}
			//_preloader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,onProgress);
			//_pHandler.execute();
			//_pHandler=null;
		}
		
		private function getLoaderDomain():LoaderContext
		{
			var loaderContext:LoaderContext;
			if (useCurrentDomain){
				loaderContext = new LoaderContext(checkPolicyFile,ApplicationDomain.currentDomain);
				if (Security.sandboxType == Security.REMOTE) 
				{
					loaderContext.securityDomain = SecurityDomain.currentDomain;
				}
			}else{
				loaderContext = new LoaderContext(checkPolicyFile);
			}
			return loaderContext;
		}

		private function loadNext():void 
		{
			var cache:Object = _mCache[_lHandler.url];
			if (cache!=null) {
				_lHandler.executeWith(cache);
				checkNext();
				return;
			}
			if (_lHandler.type==SWF) {
				_loader.load(getRequest(_lHandler.url),_lHandler.context ? _lHandler.context : _context);
				return;
			}
			if (_lHandler.type==IMG) {
				_loader.load(getRequest(_lHandler.url));
				return;
			}
			if (_lHandler.type==BMD) {
				if (useBitmapDataHack) {
					_urlLoader.dataFormat=URLLoaderDataFormat.BINARY;
					_urlLoader.load(getRequest(_lHandler.url));
				}
				else {
					
					_loader.load(getRequest(_lHandler.url), getLoaderDomain());
					
				}
				return;
			}
			if (_lHandler.type==AMF) {
				_urlLoader.dataFormat=URLLoaderDataFormat.BINARY;
				_urlLoader.load(getRequest(_lHandler.url));
				return;
			}
			if (_lHandler.type==AMF_OBJ) {
				var oData:ByteArray=new ByteArray();
				oData.writeByte(0x11);
				var oRequest:URLRequest=new URLRequest(_lHandler.url);
				oRequest.method=URLRequestMethod.POST;
				oRequest.contentType="application/octet-stream";
				oRequest.data=oData;
				oData.position=1;
				//if(_lHandler.args.length == 1)
					//oData.writeObject(_lHandler.args[0]);
				//else
					//oData.writeObject([_lHandler.args[0], _lHandler.args[1]]);
				oData.length=oData.position;
				_urlLoader.load(oRequest);
				return;
			}
			if (_lHandler.type == TEXT) {
				_urlLoader.dataFormat=URLLoaderDataFormat.TEXT;
				_urlLoader.load(getRequest(_lHandler.url));
				return;
			}
		}
		
		private function checkNext():void {
			if (_handlerVect.length>0) {
				_lHandler=_handlerVect.shift();
				loadNext();
			}
			else {
				_isLoading=false;
				_lHandler=null;
			}
		}
		
		private function getRequest(file:String):URLRequest {
			_urlRequest.url=file;
			return _urlRequest;
		}
		
		private function onProgress(event:ProgressEvent):void {
			//var bytesTotal:int=0;
			//var bytesLoaded:int=0;
			//for(var i:int=0,n:int=_pHandler.files.length;i<n;i++) {
				//if (i<_pHandler.loaded)bytesLoaded+=_pHandler.ratio[i];
				//bytesTotal+=_pHandler.ratio[i];
			//}
			//var ratioLoaded:Number=bytesLoaded/bytesTotal;
			//var ratioCurrent:Number=_pHandler.ratio[_pHandler.loaded]/bytesTotal;
			//ratioLoaded+=ratioCurrent*(event.bytesLoaded/event.bytesTotal);
			//if (_pHandler.progress!=null)_pHandler.progress(ratioLoaded);
		}
		
		private function onPreloadError(event:IOErrorEvent):void {
			//App.error(event.toString());
		}
		
		private function onPreloadComplete(event:Event):void {
			//_pHandler.loaded++;
			//preloadNext();
		}
		
		private function onLoadError(event:Event):void {
			_lHandler.executeWith(null);
			//App.error(event.toString());
			checkNext();
			/*throw new Error(event.toString());*/
		}
		
		
		private function onLoadComplete(event:Event):void {
			if (_lHandler.type==SWF) {
				_lHandler.executeWith(_mCache[_lHandler.url]=_loader.content);
				checkNext();
				return;
			}
			if (_lHandler.type==IMG) {
				_lHandler.executeWith(_mCache[_lHandler.url]=_loader.content);
				checkNext();
				return;
			}
			if (_lHandler.type==BMD) {
				if (useBitmapDataHack && _urlLoader.data!=null) {
					_loader.loadBytes(_urlLoader.data);
					_urlLoader.data=null;
					return;
				}
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCom);
				loader.loadBytes(_loader.contentLoaderInfo.bytes);
				function onCom(event:Event):void
				{
					var bitmapData:BitmapData = new BitmapData(loader.width, loader.height);
					bitmapData.draw(loader.content);
					_lHandler.executeWith(_mCache[_lHandler.url] = bitmapData);
					checkNext();
				}
				
				return;
			}
			//if (_lHandler.type==AMF) {
				//_lHandler.executeWith(_mCache[_lHandler.file]=App.assetManager.readAMF(_urlLoader.data));
				//checkNext();
				//return;
			//}
			if (_lHandler.type==AMF_OBJ) {
				checkNext();
				return;
			}
			if (_lHandler.type == TEXT) {
				_lHandler.executeWith(_mCache[_lHandler.url]=_urlLoader.data);
				checkNext();
				return;
			}
		}
		
		static private var _main:LoaderManager = new LoaderManager();
		
		static public function load(type:int, file:String, args:QueueMethod = null,context:LoaderContext=null):void
		{
			_main.load(type,file,args,context);
		}
	}
}

//import flash.system.LoaderContext;
//import tools.MethodHandler;
//class LoaderHandler extends MethodHandler {
	//public var file:String;
	//public var type:int;
	//public var context:LoaderContext;
//}
//
//class PreloaderHandler extends MethodHandler {
	//public var files:Vector.<String>;
	//public var ratio:Vector.<Number>;
	//public var progress:Function;
	//public var loaded:int;
//}
//
//class PreloadersHandler extends MethodHandler {
	//public var files:Vector.<String>;
	//public var loaders:Array = [];
	//public var ratio:Vector.<Number>;
	//public var progress:Function;
	//public var loaded:int;
	//public var allLoaded:int;
//}

package field 
{
	/**
	 * ...
	 * @author 
	 */
	public class AvatarAssets 
	{
		
		public function AvatarAssets() 
		{
			
		}
		
		
		
		
		
		static public const lowerbody :int = 1;
		static public const upperbody :int = 2;
		static public const head :int = 3;
		static public const weapon :int = 4;
		
		
		static public var movieAction:Array = 
		[
			{action:"Walk", direct:1, items:[10,11,12,13,15,16] }
			,{action:"Walk", direct:3, items:[48,49,50,51,52,53] }
			,{action:"Walk", direct:2, items:[141,142,143,144,145,146] }
			,{action:"Walk", direct:6, items:[103,104,105,106,107,108] }
			,{action:"Walk", direct:4, items:[105,116,127,138,149,160] }
			,{action:"Idle", direct:1, items:[6,7,8,9] }
			,{action:"Idle", direct:3, items:[43,44,45,46] }
			,{action:"Idle", direct:2, items:[136,137,139,140] }
			,{action:"Idle", direct:6, items:[99,100,101,102] }
			,{action:"Idle", direct:4, items:[1,2,83,94] }
			,{action:"Attack", direct:1, items:[26,27,28,29,30,31] }
			,{action:"Attack", direct:3, items:[63,64,65,66,67,68] }
			//,{action:"Attack", direct:2, items:[156,157,158,159,161,162] }
			,{action:"Attack", direct:2, items:[159,161,162,156,157,158] }
			,{action:"Attack", direct:6, items:[119,120,121,122,123,124] }
			,{action:"Attack", direct:4, items:[81,82,83,84,85,86] }
			,{action:"dea", direct:1, items:[17,18,19,20] }
			,{action:"dea", direct:3, items:[17,18,19,20] }
			,{action:"dea", direct:2, items:[54,55,56,57] }
			,{action:"dea", direct:6, items:[147,148,150,151] }
			,{action:"dea", direct:4, items:[110,111,112,113] }
			,{action:"Thump", direct:1, items:[37,38,39,40,41,42] }
			,{action:"Thump", direct:3, items:[74,75,76,77,78,79] }
			,{action:"Thump", direct:2, items:[167,168,169,170,4,5] }
			,{action:"Thump", direct:6, items:[130,131,132,133,134,135] }
			,{action:"Thump", direct:4, items:[92,93,95,96,97,98] }
		]
		
		
		
		static public const SYMBOLTAG:Object =
		{
			1:"lowerbody"
			,2:"upperbody"
			,3:"head"
			,4:"weapon"
		}
		
		static public var movieInfoPath:Array = 
		[	
{id:1,items:[{id:1,type:lowerbody,x:-58,y:-53.35},{id:1,type:upperbody,x:-23,y:-85},{id:1,type:head,x:-8.5,y:-92},{id:1,type:weapon,x:-54.65,y:-62}]}
,{id:2,items:[{id:2,type:lowerbody,x:-57,y:-47.85},{id:2,type:upperbody,x:-21,y:-79},{id:2,type:head,x:-6.5,y:-88},{id:2,type:weapon,x:-52.65,y:-57}]}
,{id:3,items:[{id:3,type:lowerbody,x:-81,y:-39.95},{id:3,type:upperbody,x:-21,y:-66.95},{id:3,type:head,x:-14,y:-55.45},{id:3,type:weapon,x:-72.65,y:-50.45}]}
,{id:4,items:[{id:4,type:lowerbody,x:-37,y:-39},{id:4,type:upperbody,x:-20,y:-64.45},{id:4,type:head,x:16.5,y:-76.95},{id:4,type:weapon,x:-25,y:-37.5}]}
,{id:5,items:[{id:5,type:lowerbody,x:-56,y:-47.65},{id:5,type:upperbody,x:-32.5,y:-76.75},{id:5,type:head,x:-5.5,y:-88.95},{id:5,type:weapon,x:-56,y:-33}]}
,{id:6,items:[{id:6,type:lowerbody,x:-23,y:-51.65},{id:6,type:upperbody,x:-18.6,y:-83},{id:6,type:head,x:0.9,y:-94},{id:6,type:weapon,x:13.9,y:-42.15}]}
,{id:7,items:[{id:7,type:lowerbody,x:-24,y:-51},{id:7,type:upperbody,x:-20.65,y:-83.85},{id:7,type:head,x:-0.15,y:-95},{id:7,type:weapon,x:13,y:-42.5}]}
,{id:8,items:[{id:8,type:lowerbody,x:-25,y:-49},{id:8,type:upperbody,x:-22.65,y:-81},{id:8,type:head,x:-3.15,y:-92},{id:8,type:weapon,x:9.85,y:-38.15}]}
,{id:9,items:[{id:9,type:lowerbody,x:-24,y:-50},{id:9,type:upperbody,x:-20.65,y:-81.85},{id:9,type:head,x:-0.15,y:-93},{id:9,type:weapon,x:12.85,y:-40.15}]}
,{id:10,items:[{id:10,type:lowerbody,x:-27,y:-54.3},{id:10,type:upperbody,x:-23.55,y:-87.3},{id:10,type:head,x:-6,y:-103},{id:10,type:weapon,x:4.45,y:-48}]}
,{id:11,items:[{id:11,type:lowerbody,x:-22.85,y:-54.55},{id:11,type:upperbody,x:-18.85,y:-87.25},{id:11,type:head,x:-6,y:-103},{id:11,type:weapon,x:5.5,y:-49}]}
,{id:12,items:[{id:12,type:lowerbody,x:-28.75,y:-55},{id:12,type:upperbody,x:-22.75,y:-87},{id:12,type:head,x:-6,y:-103},{id:12,type:weapon,x:4.5,y:-47.95}]}
,{id:13,items:[{id:13,type:lowerbody,x:-28.65,y:-55.25},{id:13,type:upperbody,x:-27.9,y:-87},{id:13,type:head,x:-6,y:-103},{id:13,type:weapon,x:5.5,y:-48.95}]}
,{id:14,items:[{id:14,type:lowerbody,x:-49,y:-28},{id:14,type:upperbody,x:-33.85,y:-59.5},{id:14,type:head,x:-3.35,y:-71},{id:14,type:weapon,x:-49.35,y:-77}]}
,{id:15,items:[{id:15,type:lowerbody,x:-30,y:-55},{id:15,type:upperbody,x:-26,y:-86.85},{id:15,type:head,x:-6,y:-103},{id:15,type:weapon,x:6.5,y:-47}]}
,{id:16,items:[{id:16,type:lowerbody,x:-32.2,y:-55.5},{id:16,type:upperbody,x:-28.3,y:-88},{id:16,type:head,x:-6,y:-103},{id:16,type:weapon,x:5.5,y:-48.95}]}
,{id:17,items:[{id:17,type:lowerbody,x:-25,y:-31.85},{id:17,type:head,x:-4.5,y:-71},{id:17,type:upperbody,x:-20.5,y:-60},{id:17,type:weapon,x:7,y:-23.5}]}
,{id:18,items:[{id:18,type:lowerbody,x:-31,y:-28},{id:18,type:upperbody,x:-14,y:-55},{id:18,type:head,x:-14,y:-45.5},{id:18,type:weapon,x:26.5,y:-62}]}
,{id:19,items:[{id:19,type:lowerbody,x:-55,y:-21.85},{id:19,type:upperbody,x:-1.85,y:-49},{id:19,type:head,x:17.5,y:-41},{id:19,type:weapon,x:46,y:-39.35}]}
,{id:20,items:[{id:20,type:lowerbody,x:-72,y:-23.35},{id:20,type:upperbody,x:-4.55,y:-31},{id:20,type:head,x:18.35,y:-24.35},{id:20,type:weapon,x:10.35,y:-4}]}
,{id:21,items:[{id:21,type:lowerbody,x:-25,y:-81.85},{id:21,type:upperbody,x:-23.85,y:-113.5},{id:21,type:head,x:-4,y:-127},{id:21,type:weapon,x:11.35,y:-73.5}]}
,{id:22,items:[{id:22,type:lowerbody,x:-27,y:-87.3},{id:22,type:upperbody,x:-23.35,y:-119.45},{id:22,type:head,x:-2.5,y:-133.95},{id:22,type:weapon,x:12.5,y:-79.5}]}
,{id:23,items:[{id:23,type:lowerbody,x:-29,y:-83.8},{id:23,type:upperbody,x:-25.85,y:-116.45},{id:23,type:head,x:-5,y:-130.95},{id:23,type:weapon,x:10,y:-77.5}]}
,{id:24,items:[{id:24,type:lowerbody,x:-30,y:-84.3},{id:24,type:upperbody,x:-26.85,y:-116.45},{id:24,type:head,x:-6,y:-130.95},{id:24,type:weapon,x:9,y:-76.5}]}
,{id:25,items:[{id:25,type:lowerbody,x:-57,y:-28.5},{id:25,type:upperbody,x:-50.5,y:-44.5},{id:25,type:head,x:-28.5,y:-52},{id:25,type:weapon,x:-55,y:-26.15}]}
,{id:26,items:[{id:26,type:lowerbody,x:-32,y:-45.95},{id:26,type:upperbody,x:-14.85,y:-75.45},{id:26,type:head,x:-3.85,y:-85.95},{id:26,type:weapon,x:-28,y:-68.45}]}
,{id:27,items:[{id:27,type:lowerbody,x:-43,y:-44},{id:27,type:upperbody,x:-16.5,y:-71},{id:27,type:head,x:-10.5,y:-78},{id:27,type:weapon,x:-40,y:-54.5}]}
,{id:28,items:[{id:28,type:lowerbody,x:-34,y:-43.15},{id:28,type:upperbody,x:-30.5,y:-89},{id:28,type:head,x:-3,y:-82.15},{id:28,type:weapon,x:-26.5,y:-87.15}]}
,{id:29,items:[{id:29,type:lowerbody,x:-59,y:-46.45},{id:29,type:upperbody,x:-34,y:-77.6},{id:29,type:head,x:-13,y:-90.95},{id:29,type:weapon,x:-56,y:-93.45}]}
,{id:30,items:[{id:30,type:lowerbody,x:-40,y:-45},{id:30,type:upperbody,x:-29,y:-74.5},{id:30,type:head,x:-5,y:-88},{id:30,type:weapon,x:-37,y:-72.5}]}
,{id:31,items:[{id:31,type:lowerbody,x:-31,y:-43.5},{id:31,type:upperbody,x:-26.5,y:-75.35},{id:31,type:head,x:-1,y:-88},{id:31,type:weapon,x:12,y:-48.5}]}
,{id:32,items:[{id:32,type:lowerbody,x:-25,y:-30.65},{id:32,type:upperbody,x:-19,y:-75},{id:32,type:head,x:-3.85,y:-72.15},{id:32,type:weapon,x:9.65,y:-97.65}]}
,{id:33,items:[{id:33,type:lowerbody,x:-32,y:-51},{id:33,type:upperbody,x:-29,y:-78.5},{id:33,type:head,x:-9.5,y:-90},{id:33,type:weapon,x:26,y:-98}]}
,{id:34,items:[{id:34,type:lowerbody,x:-32,y:-47.85},{id:34,type:upperbody,x:-26.5,y:-75},{id:34,type:head,x:-9.35,y:-86},{id:34,type:weapon,x:27,y:-91}]}
,{id:35,items:[{id:35,type:lowerbody,x:-27.15,y:-48.35},{id:35,type:upperbody,x:-28,y:-79.5},{id:35,type:head,x:-6.15,y:-90},{id:35,type:weapon,x:13.85,y:-39.15}]}
,{id:36,items:[{id:36,type:lowerbody,x:-45,y:-30},{id:36,type:upperbody,x:-44,y:-15.15},{id:36,type:head,x:-41.5,y:-5.65},{id:36,type:weapon,x:-45,y:12.35}]}
,{id:37,items:[{id:37,type:lowerbody,x:-23,y:-46.95},{id:37,type:upperbody,x:-16,y:-77.45},{id:37,type:head,x:-1,y:-88.95},{id:37,type:weapon,x:13,y:-98.45}]}
,{id:38,items:[{id:38,type:lowerbody,x:-25,y:-38.65},{id:38,type:upperbody,x:-17.35,y:-90},{id:38,type:head,x:-4,y:-76.65},{id:38,type:weapon,x:-2.5,y:-85.65}]}
,{id:39,items:[{id:39,type:lowerbody,x:-23,y:-41.45},{id:39,type:upperbody,x:-19,y:-94.95},{id:39,type:head,x:-4,y:-77.45},{id:39,type:weapon,x:-9.5,y:-91.95}]}
,{id:40,items:[{id:40,type:lowerbody,x:-23,y:-40.35},{id:40,type:upperbody,x:-12.5,y:-68.85},{id:40,type:head,x:-4.8,y:-83},{id:40,type:weapon,x:-28,y:-119.35}]}
,{id:41,items:[{id:41,type:lowerbody,x:-23,y:-32.95},{id:41,type:upperbody,x:-16.5,y:-65.6},{id:41,type:head,x:-5,y:-81.95},{id:41,type:weapon,x:9.35,y:-30.95}]}
,{id:42,items:[{id:42,type:lowerbody,x:-27,y:-46},{id:42,type:upperbody,x:-21.85,y:-77.8},{id:42,type:head,x:-4.5,y:-92},{id:42,type:weapon,x:7.35,y:-37.15}]}
,{id:43,items:[{id:43,type:lowerbody,x:-18,y:-53.85},{id:43,type:upperbody,x:-15.5,y:-83.85},{id:43,type:head,x:2.65,y:-93},{id:43,type:weapon,x:8,y:-37.35}]}
,{id:44,items:[{id:44,type:lowerbody,x:-18,y:-54.1},{id:44,type:upperbody,x:-15,y:-85.45},{id:44,type:head,x:1.65,y:-96.95},{id:44,type:weapon,x:8,y:-39.65}]}
,{id:45,items:[{id:45,type:lowerbody,x:-20,y:-49.6},{id:45,type:upperbody,x:-17,y:-80.45},{id:45,type:head,x:-2.35,y:-91.95},{id:45,type:weapon,x:8,y:-35.45}]}
,{id:46,items:[{id:46,type:lowerbody,x:-20,y:-48.1},{id:46,type:upperbody,x:-17,y:-79.45},{id:46,type:head,x:-2.35,y:-90.95},{id:46,type:weapon,x:6.5,y:-34.1}]}
,{id:47,items:[{id:47,type:lowerbody,x:-61,y:-59.5},{id:47,type:upperbody,x:-23,y:-85.65},{id:47,type:head,x:-4.15,y:-96},{id:47,type:weapon,x:-59,y:-66.5}]}
,{id:48,items:[{id:48,type:lowerbody,x:-22,y:-57.45},{id:48,type:upperbody,x:-11.5,y:-91.6},{id:48,type:head,x:0.65,y:-103.95},{id:48,type:weapon,x:-1,y:-51.65}]}
,{id:49,items:[{id:49,type:lowerbody,x:-30,y:-57.6},{id:49,type:upperbody,x:-10.65,y:-89.6},{id:49,type:head,x:-0.5,y:-103.95},{id:49,type:weapon,x:-5.5,y:-51.15}]}
,{id:50,items:[{id:50,type:lowerbody,x:-25,y:-54.2},{id:50,type:upperbody,x:-8.85,y:-88.5},{id:50,type:head,x:5.15,y:-100},{id:50,type:weapon,x:1,y:-47.65}]}
,{id:51,items:[{id:51,type:lowerbody,x:-12,y:-64.5},{id:51,type:upperbody,x:-8,y:-96.5},{id:51,type:head,x:14.5,y:-110},{id:51,type:weapon,x:10.5,y:-56.65}]}
,{id:52,items:[{id:52,type:lowerbody,x:-27,y:-48.5},{id:52,type:upperbody,x:-24.65,y:-81.65},{id:52,type:head,x:2,y:-94},{id:52,type:weapon,x:0,y:-40.65}]}
,{id:53,items:[{id:53,type:lowerbody,x:-15,y:-52.15},{id:53,type:upperbody,x:-13.5,y:-85.65},{id:53,type:head,x:10,y:-98},{id:53,type:weapon,x:6.5,y:-45.65}]}
,{id:54,items:[{id:54,type:lowerbody,x:-20,y:-34.55},{id:54,type:head,x:-3,y:-71},{id:54,type:upperbody,x:-18.35,y:-60.85},{id:54,type:weapon,x:0,y:-17.05}]}
,{id:55,items:[{id:55,type:lowerbody,x:-32,y:-23},{id:55,type:upperbody,x:-23,y:-58},{id:55,type:head,x:-29.85,y:-54.5},{id:55,type:weapon,x:5,y:-55.15}]}
,{id:56,items:[{id:56,type:lowerbody,x:-53,y:-29.5},{id:56,type:upperbody,x:-1,y:-64},{id:56,type:head,x:15.85,y:-58.5},{id:56,type:weapon,x:41,y:-43}]}
,{id:57,items:[{id:57,type:lowerbody,x:-67,y:-23},{id:57,type:upperbody,x:0.15,y:-34},{id:57,type:head,x:32.5,y:-25.35},{id:57,type:weapon,x:40.15,y:-2}]}
,{id:58,items:[{id:58,type:lowerbody,x:-63,y:-60.65},{id:58,type:upperbody,x:-25,y:-81.65},{id:58,type:head,x:-6.15,y:-93},{id:58,type:weapon,x:-60,y:-62.65}]}
,{id:59,items:[{id:59,type:lowerbody,x:-12,y:-77.5},{id:59,type:upperbody,x:-7.15,y:-110},{id:59,type:head,x:15.5,y:-123},{id:59,type:weapon,x:22,y:-65.15}]}
,{id:60,items:[{id:60,type:lowerbody,x:-10,y:-79.35},{id:60,type:head,x:17.5,y:-125},{id:60,type:upperbody,x:-6,y:-112.85},{id:60,type:weapon,x:21,y:-69.65}]}
,{id:61,items:[{id:61,type:lowerbody,x:-7,y:-84.35},{id:61,type:head,x:20.5,y:-131},{id:61,type:upperbody,x:-2,y:-119.35},{id:61,type:weapon,x:26,y:-75.15}]}
,{id:62,items:[{id:62,type:lowerbody,x:-10,y:-79.35},{id:62,type:head,x:19.5,y:-125},{id:62,type:upperbody,x:-5.15,y:-113.85},{id:62,type:weapon,x:21.85,y:-71.85}]}
,{id:63,items:[{id:63,type:lowerbody,x:-54,y:-47.15},{id:63,type:upperbody,x:-10,y:-79.15},{id:63,type:head,x:-3.85,y:-90},{id:63,type:weapon,x:-53,y:-65.15}]}
,{id:64,items:[{id:64,type:lowerbody,x:-58,y:-43.35},{id:64,type:upperbody,x:-19.15,y:-73.5},{id:64,type:head,x:-14,y:-80},{id:64,type:weapon,x:-55.65,y:-49}]}
,{id:65,items:[{id:65,type:lowerbody,x:-27,y:-40},{id:65,type:head,x:0.15,y:-81},{id:65,type:upperbody,x:-24,y:-74.5},{id:65,type:weapon,x:-16.85,y:-74}]}
,{id:66,items:[{id:66,type:lowerbody,x:-24,y:-50.8},{id:66,type:head,x:5.15,y:-83.95},{id:66,type:upperbody,x:-21.85,y:-71.45},{id:66,type:weapon,x:-19,y:-69.8}]}
,{id:67,items:[{id:67,type:lowerbody,x:-29,y:-46.35},{id:67,type:head,x:7.15,y:-85},{id:67,type:upperbody,x:-24.35,y:-70.5},{id:67,type:weapon,x:-12,y:-70.35}]}
,{id:68,items:[{id:68,type:lowerbody,x:-25,y:-44.65},{id:68,type:head,x:5,y:-86},{id:68,type:upperbody,x:-21,y:-75},{id:68,type:weapon,x:18,y:-41.65}]}
,{id:69,items:[{id:69,type:lowerbody,x:-63,y:-66.65},{id:69,type:upperbody,x:-23.85,y:-86.5},{id:69,type:head,x:-4,y:-96},{id:69,type:weapon,x:-58,y:-66.65}]}
,{id:70,items:[{id:70,type:lowerbody,x:-18,y:-33},{id:70,type:upperbody,x:-12,y:-76},{id:70,type:head,x:2.5,y:-74.35},{id:70,type:weapon,x:13,y:-96.35}]}
,{id:71,items:[{id:71,type:lowerbody,x:-23,y:-53.95},{id:71,type:upperbody,x:-19,y:-81.8},{id:71,type:head,x:-8,y:-91.95},{id:71,type:weapon,x:27,y:-87.8}]}
,{id:72,items:[{id:72,type:lowerbody,x:-25,y:-50.35},{id:72,type:upperbody,x:-21.15,y:-79},{id:72,type:head,x:-9.65,y:-88},{id:72,type:weapon,x:23.35,y:-81.5}]}
,{id:73,items:[{id:73,type:lowerbody,x:-22,y:-51.3},{id:73,type:upperbody,x:-20.85,y:-82.45},{id:73,type:head,x:-4.85,y:-91.95},{id:73,type:weapon,x:9,y:-35.15}]}
,{id:74,items:[{id:74,type:lowerbody,x:-16,y:-44},{id:74,type:upperbody,x:-12,y:-75},{id:74,type:head,x:-1.85,y:-85},{id:74,type:weapon,x:21.35,y:-82.5}]}
,{id:75,items:[{id:75,type:lowerbody,x:-21,y:-41.45},{id:75,type:upperbody,x:-17.5,y:-91.95},{id:75,type:head,x:-7,y:-79.6},{id:75,type:weapon,x:-18,y:-95.45}]}
,{id:76,items:[{id:76,type:lowerbody,x:-34,y:-42.95},{id:76,type:upperbody,x:-18,y:-95.95},{id:76,type:head,x:-7,y:-77.45},{id:76,type:weapon,x:-29,y:-97.45}]}
,{id:77,items:[{id:77,type:lowerbody,x:-9,y:-44.6},{id:77,type:head,x:4.35,y:-85.95},{id:77,type:upperbody,x:-7.15,y:-71.1},{id:77,type:weapon,x:-54,y:-127.1}]}
,{id:78,items:[{id:78,type:lowerbody,x:-14,y:-40.5},{id:78,type:head,x:-1,y:-81},{id:78,type:upperbody,x:-13,y:-70},{id:78,type:weapon,x:-3,y:-30.5}]}
,{id:79,items:[{id:79,type:lowerbody,x:-20,y:-47.1},{id:79,type:upperbody,x:-17.35,y:-81.1},{id:79,type:head,x:-2.35,y:-92.95},{id:79,type:weapon,x:0.35,y:-37.65}]}
,{id:80,items:[{id:80,type:lowerbody,x:-62,y:-61.5},{id:80,type:upperbody,x:-23,y:-85.65},{id:80,type:head,x:-4.15,y:-97},{id:80,type:weapon,x:-57.65,y:-67}]}
,{id:81,items:[{id:81,type:lowerbody,x:-26,y:-53.45},{id:81,type:upperbody,x:-19.35,y:-107.95},{id:81,type:head,x:-5,y:-91.8},{id:81,type:weapon,x:-25.5,y:-110.8}]}
,{id:82,items:[{id:82,type:lowerbody,x:-28,y:-51.95},{id:82,type:upperbody,x:-16.5,y:-104.95},{id:82,type:head,x:-2,y:-96.3},{id:82,type:weapon,x:-21.5,y:-106.1}]}
,{id:83,items:[{id:83,type:lowerbody,x:-57,y:-48.65},{id:83,type:upperbody,x:-22,y:-78.65},{id:83,type:head,x:-7.5,y:-86},{id:83,type:weapon,x:-53,y:-55.65}]}
,{id:84,items:[{id:84,type:lowerbody,x:-43,y:-38.35},{id:84,type:upperbody,x:-37.5,y:-69.85},{id:84,type:head,x:-5,y:-78},{id:84,type:weapon,x:-37.5,y:-102.85}]}
,{id:85,items:[{id:85,type:lowerbody,x:-32,y:-33.85},{id:85,type:upperbody,x:-5.95,y:-70},{id:85,type:head,x:9,y:-58},{id:85,type:weapon,x:-83,y:-92.15}]}
,{id:86,items:[{id:86,type:lowerbody,x:-27,y:-43.5},{id:86,type:upperbody,x:-11,y:-72},{id:86,type:head,x:1,y:-67},{id:86,type:weapon,x:-56,y:-51.5}]}
,{id:87,items:[{id:87,type:lowerbody,x:-61,y:-45.5},{id:87,type:upperbody,x:-24.5,y:-71.85},{id:87,type:head,x:-6,y:-79},{id:87,type:weapon,x:-54,y:-36.15}]}
,{id:88,items:[{id:88,type:lowerbody,x:-36,y:-35.85},{id:88,type:upperbody,x:-31,y:-64},{id:88,type:head,x:-11.85,y:-67},{id:88,type:weapon,x:-30.35,y:-92.5}]}
,{id:89,items:[{id:89,type:lowerbody,x:-59,y:-48.35},{id:89,type:upperbody,x:-35.5,y:-79.85},{id:89,type:head,x:-4,y:-91},{id:89,type:weapon,x:-57,y:-95.35}]}
,{id:90,items:[{id:90,type:lowerbody,x:-60,y:-43.8},{id:90,type:upperbody,x:-33,y:-74.3},{id:90,type:head,x:-2.35,y:-84.95},{id:90,type:weapon,x:-54.5,y:-85.8}]}
,{id:91,items:[{id:91,type:lowerbody,x:-88,y:-44.65},{id:91,type:upperbody,x:-27.85,y:-76.15},{id:91,type:head,x:-5,y:-84},{id:91,type:weapon,x:-80.15,y:-55.15}]}
,{id:92,items:[{id:92,type:lowerbody,x:-66,y:-45.65},{id:92,type:upperbody,x:-24,y:-75.65},{id:92,type:head,x:-8,y:-84},{id:92,type:weapon,x:-60,y:-56.65}]}
,{id:93,items:[{id:93,type:lowerbody,x:-24,y:-49.5},{id:93,type:upperbody,x:-19.85,y:-81.85},{id:93,type:head,x:-4.5,y:-91},{id:93,type:weapon,x:-2.15,y:-128.5}]}
,{id:94,items:[{id:94,type:lowerbody,x:-59,y:-47.35},{id:94,type:upperbody,x:-24,y:-78.5},{id:94,type:head,x:-8.5,y:-86},{id:94,type:weapon,x:-55.5,y:-55.5}]}
,{id:95,items:[{id:95,type:lowerbody,x:-24,y:-48.6},{id:95,type:upperbody,x:-18.15,y:-104.95},{id:95,type:head,x:-3.15,y:-93.1},{id:95,type:weapon,x:0.85,y:-112.45}]}
,{id:96,items:[{id:96,type:lowerbody,x:-30,y:-35},{id:96,type:upperbody,x:-10.65,y:-59},{id:96,type:head,x:2,y:-58},{id:96,type:weapon,x:-20.5,y:-149}]}
,{id:97,items:[{id:97,type:lowerbody,x:-67,y:-40.65},{id:97,type:upperbody,x:-25,y:-66},{id:97,type:head,x:-8.5,y:-64.65},{id:97,type:weapon,x:-67.65,y:-51.65}]}
,{id:98,items:[{id:98,type:lowerbody,x:-65,y:-47.15},{id:98,type:upperbody,x:-23.85,y:-75.5},{id:98,type:head,x:-10.5,y:-81},{id:98,type:weapon,x:-63.65,y:-57}]}
,{id:99,items:[{id:99,type:lowerbody,x:-74,y:-41.65},{id:99,type:upperbody,x:-32.5,y:-69.65},{id:99,type:head,x:-6,y:-78},{id:99,type:weapon,x:-76.65,y:-41.65}]}
,{id:100,items:[{id:100,type:lowerbody,x:-73,y:-47.8},{id:100,type:upperbody,x:-31.15,y:-76.65},{id:100,type:head,x:-5.65,y:-88},{id:100,type:weapon,x:-72.6,y:-48.65}]}
,{id:101,items:[{id:101,type:lowerbody,x:-76,y:-47.45},{id:101,type:upperbody,x:-31,y:-75.45},{id:101,type:head,x:-5.5,y:-86.95},{id:101,type:weapon,x:-74.65,y:-47.65}]}
,{id:102,items:[{id:102,type:lowerbody,x:-72,y:-48.65},{id:102,type:upperbody,x:-30.5,y:-74.65},{id:102,type:head,x:-4,y:-85},{id:102,type:weapon,x:-75.65,y:-48.65}]}
,{id:103,items:[{id:103,type:lowerbody,x:-71,y:-51},{id:103,type:upperbody,x:-23.5,y:-72.5},{id:103,type:head,x:7.15,y:-77},{id:103,type:weapon,x:-68,y:-65.5}]}
,{id:104,items:[{id:104,type:lowerbody,x:-76,y:-51},{id:104,type:upperbody,x:-22.35,y:-72},{id:104,type:head,x:6.5,y:-76},{id:104,type:weapon,x:-69,y:-64.65}]}
,{id:105,items:[{id:105,type:lowerbody,x:-64,y:-56.65},{id:105,type:upperbody,x:-21.95,y:-76.65},{id:105,type:head,x:-8.95,y:-79},{id:105,type:weapon,x:-62.95,y:-69}]}
,{id:106,items:[{id:106,type:lowerbody,x:-88,y:-61.5},{id:106,type:upperbody,x:-37.5,y:-79.15},{id:106,type:head,x:-8,y:-86},{id:106,type:weapon,x:-84,y:-71.5}]}
,{id:107,items:[{id:107,type:lowerbody,x:-79,y:-55.5},{id:107,type:upperbody,x:-29,y:-75.35},{id:107,type:head,x:1.65,y:-80},{id:107,type:weapon,x:-76,y:-65.5}]}
,{id:108,items:[{id:108,type:lowerbody,x:-75,y:-52.65},{id:108,type:upperbody,x:-23,y:-75.15},{id:108,type:head,x:8.35,y:-78},{id:108,type:weapon,x:-69.15,y:-63.5}]}
,{id:109,items:[{id:109,type:lowerbody,x:-75,y:-41.65},{id:109,type:upperbody,x:-22.5,y:-61.5},{id:109,type:head,x:8.15,y:-69},{id:109,type:weapon,x:-69,y:-53.65}]}
,{id:110,items:[{id:110,type:lowerbody,x:-84,y:-42},{id:110,type:upperbody,x:-28.2,y:-68},{id:110,type:head,x:-8.7,y:-65},{id:110,type:weapon,x:-81,y:-37}]}
,{id:111,items:[{id:111,type:lowerbody,x:-50,y:-29.35},{id:111,type:upperbody,x:-41.5,y:-62},{id:111,type:head,x:-11.85,y:-76},{id:111,type:weapon,x:-50.5,y:-70}]}
,{id:112,items:[{id:112,type:lowerbody,x:-57,y:-32},{id:112,type:upperbody,x:-53.5,y:-37.5},{id:112,type:head,x:-33,y:-40},{id:112,type:weapon,x:-55.15,y:-10.65}]}
,{id:113,items:[{id:113,type:lowerbody,x:-34,y:-34},{id:113,type:upperbody,x:-30,y:-13},{id:113,type:head,x:-28.5,y:2.15},{id:113,type:weapon,x:-30.5,y:23.85}]}
,{id:114,items:[{id:114,type:lowerbody,x:-36,y:-39.65},{id:114,type:upperbody,x:1.5,y:-65.5},{id:114,type:head,x:27,y:-72},{id:114,type:weapon,x:-28.15,y:-28.5}]}
,{id:115,items:[{id:115,type:lowerbody,x:-39,y:-37.65},{id:115,type:upperbody,x:-1.7,y:-63.5},{id:115,type:head,x:24.8,y:-70},{id:115,type:weapon,x:-28.65,y:-27.65}]}
,{id:116,items:[{id:116,type:lowerbody,x:-66,y:-46.5},{id:116,type:upperbody,x:-23.85,y:-71.15},{id:116,type:head,x:-11.5,y:-72},{id:116,type:weapon,x:-63.85,y:-63.65}]}
,{id:117,items:[{id:117,type:lowerbody,x:-39,y:-41.65},{id:117,type:upperbody,x:-3.65,y:-65.65},{id:117,type:head,x:22.85,y:-71},{id:117,type:weapon,x:-33.15,y:-30.65}]}
,{id:118,items:[{id:118,type:lowerbody,x:-40,y:-48.65},{id:118,type:upperbody,x:-4.65,y:-72.5},{id:118,type:head,x:22.85,y:-79},{id:118,type:weapon,x:-32.65,y:-36.65}]}
,{id:119,items:[{id:119,type:lowerbody,x:-43,y:-50.3},{id:119,type:upperbody,x:-36.5,y:-100.95},{id:119,type:head,x:-9.35,y:-90.3},{id:119,type:weapon,x:-38.5,y:-101.3}]}
,{id:120,items:[{id:120,type:lowerbody,x:-46,y:-46.95},{id:120,type:upperbody,x:-38.5,y:-93.95},{id:120,type:head,x:-10.85,y:-93.8},{id:120,type:weapon,x:-41.65,y:-94.45}]}
,{id:121,items:[{id:121,type:lowerbody,x:-50,y:-36.45},{id:121,type:upperbody,x:-28.85,y:-67.1},{id:121,type:head,x:-4.35,y:-76.95},{id:121,type:weapon,x:-45.5,y:-90.1}]}
,{id:122,items:[{id:122,type:lowerbody,x:-42,y:-32.5},{id:122,type:upperbody,x:-7,y:-65},{id:122,type:head,x:15.85,y:-56.5},{id:122,type:weapon,x:-77.65,y:-67.65}]}
,{id:123,items:[{id:123,type:lowerbody,x:-40,y:-39.95},{id:123,type:upperbody,x:-10,y:-72.95},{id:123,type:head,x:4.5,y:-67.8},{id:123,type:weapon,x:-45.5,y:-39.45}]}
,{id:124,items:[{id:124,type:lowerbody,x:-38,y:-46.5},{id:124,type:upperbody,x:-20.5,y:-72},{id:124,type:head,x:-3.85,y:-77},{id:124,type:weapon,x:-31.65,y:-34.15}]}
,{id:125,items:[{id:125,type:lowerbody,x:-33,y:-30.85},{id:125,type:upperbody,x:-29.35,y:-55.5},{id:125,type:head,x:-7.5,y:-62},{id:125,type:weapon,x:-22,y:-84.5}]}
,{id:126,items:[{id:126,type:lowerbody,x:-52,y:-46.3},{id:126,type:upperbody,x:-34.65,y:-76.3},{id:126,type:head,x:-4.65,y:-86.95},{id:126,type:weapon,x:-47.65,y:-78.3}]}
,{id:127,items:[{id:127,type:lowerbody,x:-68,y:-53.15},{id:127,type:upperbody,x:-25,y:-75.65},{id:127,type:head,x:-12,y:-78},{id:127,type:weapon,x:-65.65,y:-67}]}
,{id:128,items:[{id:128,type:lowerbody,x:-50,y:-44.8},{id:128,type:upperbody,x:-31.65,y:-74.45},{id:128,type:head,x:-3,y:-85.95},{id:128,type:weapon,x:-47.65,y:-72.95}]}
,{id:129,items:[{id:129,type:lowerbody,x:-86,y:-43.15},{id:129,type:upperbody,x:-31.5,y:-70.5},{id:129,type:head,x:-6,y:-82},{id:129,type:weapon,x:-82.65,y:-41.15}]}
,{id:130,items:[{id:130,type:lowerbody,x:-37,y:-51.6},{id:130,type:upperbody,x:-22.15,y:-78.45},{id:130,type:head,x:-6,y:-89.95},{id:130,type:weapon,x:-32,y:-50.45}]}
,{id:131,items:[{id:131,type:lowerbody,x:-30,y:-45.15},{id:131,type:upperbody,x:-23,y:-81},{id:131,type:head,x:-13,y:-90},{id:131,type:weapon,x:-19.15,y:-125.15}]}
,{id:132,items:[{id:132,type:lowerbody,x:-37,y:-47.95},{id:132,type:upperbody,x:-23.5,y:-105.95},{id:132,type:head,x:-16,y:-91.45},{id:132,type:weapon,x:-34.5,y:-110.45}]}
,{id:133,items:[{id:133,type:lowerbody,x:-41,y:-38.35},{id:133,type:upperbody,x:-13.5,y:-64.5},{id:133,type:head,x:8.15,y:-65},{id:133,type:weapon,x:-14.65,y:-158.35}]}
,{id:134,items:[{id:134,type:lowerbody,x:-68,y:-44.5},{id:134,type:upperbody,x:-23.5,y:-64.15},{id:134,type:head,x:6.5,y:-67},{id:134,type:weapon,x:-57.15,y:-39.65}]}
,{id:135,items:[{id:135,type:lowerbody,x:-80,y:-44.15},{id:135,type:upperbody,x:-31.5,y:-71.65},{id:135,type:head,x:-3.85,y:-80},{id:135,type:weapon,x:-77,y:-50.15}]}
,{id:136,items:[{id:136,type:lowerbody,x:-58,y:-54.5},{id:136,type:upperbody,x:-23.5,y:-84},{id:136,type:head,x:2.35,y:-90},{id:136,type:weapon,x:-52.5,y:-41}]}
,{id:137,items:[{id:137,type:lowerbody,x:-61,y:-50.5},{id:137,type:upperbody,x:-26.35,y:-80.15},{id:137,type:head,x:-1.5,y:-88},{id:137,type:weapon,x:-55.5,y:-38.15}]}
,{id:138,items:[{id:138,type:lowerbody,x:-59,y:-58},{id:138,type:upperbody,x:-15.35,y:-78.5},{id:138,type:head,x:-0.5,y:-79},{id:138,type:weapon,x:-56.5,y:-70.15}]}
,{id:139,items:[{id:139,type:lowerbody,x:-59,y:-46.65},{id:139,type:upperbody,x:-25.5,y:-76.65},{id:139,type:head,x:-0.65,y:-85},{id:139,type:weapon,x:-53.5,y:-35.15}]}
,{id:140,items:[{id:140,type:lowerbody,x:-64,y:-48.45},{id:140,type:upperbody,x:-29.5,y:-79.1},{id:140,type:head,x:-4.65,y:-87.95},{id:140,type:weapon,x:-58.5,y:-36.95}]}
,{id:141,items:[{id:141,type:lowerbody,x:-38,y:-56.5},{id:141,type:upperbody,x:-16.65,y:-81},{id:141,type:head,x:24.35,y:-88},{id:141,type:weapon,x:-35,y:-54.5}]}
,{id:142,items:[{id:142,type:lowerbody,x:-44,y:-46.35},{id:142,type:upperbody,x:-21.85,y:-71.35},{id:142,type:head,x:23,y:-80},{id:142,type:weapon,x:-41,y:-46.35}]}
,{id:143,items:[{id:143,type:lowerbody,x:-34,y:-53.1},{id:143,type:upperbody,x:-14,y:-78.6},{id:143,type:head,x:27,y:-87.95},{id:143,type:weapon,x:-32,y:-52.5}]}
,{id:144,items:[{id:144,type:lowerbody,x:-44,y:-47.65},{id:144,type:upperbody,x:-18.15,y:-79.15},{id:144,type:head,x:21.35,y:-86},{id:144,type:weapon,x:-36,y:-48.65}]}
,{id:145,items:[{id:145,type:lowerbody,x:-44,y:-53.15},{id:145,type:upperbody,x:-19.15,y:-84.65},{id:145,type:head,x:19.35,y:-93},{id:145,type:weapon,x:-38,y:-55.15}]}
,{id:146,items:[{id:146,type:lowerbody,x:-35,y:-53.6},{id:146,type:upperbody,x:-12.5,y:-81.1},{id:146,type:head,x:27.5,y:-88.95},{id:146,type:weapon,x:-33,y:-50.65}]}
,{id:147,items:[{id:147,type:lowerbody,x:-39,y:-44},{id:147,type:upperbody,x:-26,y:-68},{id:147,type:head,x:-0.5,y:-65.5},{id:147,type:weapon,x:-33,y:-26}]}
,{id:148,items:[{id:148,type:lowerbody,x:-50,y:-25.35},{id:148,type:upperbody,x:-45,y:-54.85},{id:148,type:head,x:-38.15,y:-63},{id:148,type:weapon,x:-39.5,y:-47.85}]}
,{id:149,items:[{id:149,type:lowerbody,x:-66,y:-49.45},{id:149,type:upperbody,x:-22.5,y:-73.45},{id:149,type:head,x:-9,y:-77.95},{id:149,type:weapon,x:-63.65,y:-64.45}]}
,{id:150,items:[{id:150,type:lowerbody,x:-50,y:-27},{id:150,type:upperbody,x:-24,y:-33},{id:150,type:head,x:-7.5,y:-29.85},{id:150,type:weapon,x:-17,y:6.85}]}
,{id:151,items:[{id:151,type:lowerbody,x:-57,y:-34},{id:151,type:upperbody,x:-7,y:-9.35},{id:151,type:head,x:23.5,y:4.5},{id:151,type:weapon,x:18.5,y:29.65}]}
,{id:152,items:[{id:152,type:lowerbody,x:-30,y:-73.5},{id:152,type:upperbody,x:2.35,y:-103.15},{id:152,type:head,x:24.85,y:-111},{id:152,type:weapon,x:-1,y:-64}]}
,{id:153,items:[{id:153,type:lowerbody,x:-25,y:-72.15},{id:153,type:upperbody,x:5.85,y:-103.15},{id:153,type:head,x:28.85,y:-112},{id:153,type:weapon,x:3,y:-62.65}]}
,{id:154,items:[{id:154,type:lowerbody,x:-27,y:-64.85},{id:154,type:upperbody,x:4.35,y:-94.5},{id:154,type:head,x:25.85,y:-102},{id:154,type:weapon,x:0,y:-55.35}]}
,{id:155,items:[{id:155,type:lowerbody,x:-28,y:-66.1},{id:155,type:upperbody,x:2.85,y:-95.1},{id:155,type:head,x:25.85,y:-101.95},{id:155,type:weapon,x:-1,y:-55.6}]}
,{id:156,items:[{id:156,type:lowerbody,x:-72,y:-48.95},{id:156,type:upperbody,x:-53.5,y:-80.95},{id:156,type:head,x:-20.5,y:-89.95},{id:156,type:weapon,x:-66.5,y:-83.45}]}
,{id:157,items:[{id:157,type:lowerbody,x:-66,y:-41.3},{id:157,type:upperbody,x:-58.35,y:-73.45},{id:157,type:head,x:-28.5,y:-80.95},{id:157,type:weapon,x:-61.35,y:-65.45}]}
,{id:158,items:[{id:158,type:lowerbody,x:-51,y:-43},{id:158,type:upperbody,x:-20.85,y:-71},{id:158,type:head,x:-10,y:-82},{id:158,type:weapon,x:-54.65,y:-66.15}]}
,{id:159,items:[{id:159,type:lowerbody,x:-35,y:-39.65},{id:159,type:upperbody,x:-16.65,y:-69.15},{id:159,type:head,x:14.35,y:-74},{id:159,type:weapon,x:-42.65,y:-42.15}]}
,{id:160,items:[{id:160,type:lowerbody,x:-60,y:-48.5},{id:160,type:upperbody,x:-17.35,y:-67.15},{id:160,type:head,x:-3.5,y:-73},{id:160,type:weapon,x:-57.35,y:-57.65}]}
,{id:161,items:[{id:161,type:lowerbody,x:-38,y:-43.65},{id:161,type:upperbody,x:-22.85,y:-76.5},{id:161,type:head,x:5.65,y:-83},{id:161,type:weapon,x:11,y:-51.65}]}
,{id:162,items:[{id:162,type:lowerbody,x:-30,y:-52.5},{id:162,type:upperbody,x:-12.5,y:-80.85},{id:162,type:head,x:-2.65,y:-87},{id:162,type:weapon,x:10,y:-38.85}]}
,{id:163,items:[{id:163,type:lowerbody,x:-28,y:-39.5},{id:163,type:upperbody,x:-21,y:-69.5},{id:163,type:head,x:-1.65,y:-70},{id:163,type:weapon,x:-1.15,y:-92}]}
,{id:164,items:[{id:164,type:lowerbody,x:-27,y:-54.15},{id:164,type:upperbody,x:-20.5,y:-83.15},{id:164,type:head,x:-8,y:-93},{id:164,type:weapon,x:-8,y:-69.1}]}
,{id:165,items:[{id:165,type:lowerbody,x:-26,y:-53.5},{id:165,type:upperbody,x:-22.85,y:-84.85},{id:165,type:head,x:-8,y:-92},{id:165,type:weapon,x:-13.35,y:-66.85}]}
,{id:166,items:[{id:166,type:lowerbody,x:-32,y:-51.5},{id:166,type:upperbody,x:-21.85,y:-80.5},{id:166,type:head,x:-3.85,y:-87},{id:166,type:weapon,x:-28,y:-34.5}]}
,{id:167,items:[{id:167,type:lowerbody,x:-29,y:-45.45},{id:167,type:upperbody,x:-15.35,y:-73.8},{id:167,type:head,x:-3.5,y:-81.95},{id:167,type:weapon,x:15,y:-50.15}]}
,{id:168,items:[{id:168,type:lowerbody,x:-43,y:-46.85},{id:168,type:upperbody,x:-18.15,y:-85},{id:168,type:head,x:-11,y:-87},{id:168,type:weapon,x:-45.15,y:-106.6}]}
,{id:169,items:[{id:169,type:lowerbody,x:-79,y:-43.95},{id:169,type:upperbody,x:-23.65,y:-99.95},{id:169,type:head,x:-26.15,y:-81.95},{id:169,type:weapon,x:-74.65,y:-99.1}]}
,{id:170,items:[{id:170,type:lowerbody,x:-47,y:-42},{id:170,type:upperbody,x:-7.5,y:-66.5},{id:170,type:head,x:18.65,y:-78},{id:170,type:weapon,x:-72.5,y:-142}]}
		]
	}

}
package tools 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author 
	 */
	public class MapTitleTools 
	{
		static public var tw:Number;
		static public var th:Number;
		static private var grid_height:Number;
		static private var grid_width:Number;
		static private var TEMP_1:Number;
		static private var TEMP_2:Number;
		
		static private var _map:Object = {};
		
		static public function hold(value:Point):void
		{
			_map[value.x + value.y * 1000] = 1;
			//_map = Object (@32bc851)this = tools.MapTitleTools$)
			//_map = Object (@5a5d5c9) this = tools.MapTitleTools$)
		}
		
		static public function free(value:Point):void
		{
			_map[value.x + value.y * 1000] = 0;
		}
		
		static public function initTools(v:int):void
		{
			
			var titleWidth:int = v * 2;
			var titleHeight:int = v * Math.sin(Math.PI / 3) * 2;
			
			tw = titleWidth;
			th = titleHeight;
			grid_width = tw / 2;
			grid_height = th / 2;
			
			TEMP_1 = (grid_width * grid_width - grid_height * grid_height) / 2;
			TEMP_2 = (grid_width * grid_width + grid_height * grid_height) / 2;
		}
		
		static public function getTitle6Postions(mw:int, mh:int):Array
		{
			var result:Array = new Array();
			for (var i:int = 0,leni:int=mh; i < leni; i++) {
				for (var j:int = 0,lenj:int=mw; j < lenj; j++) 
				{
					var x:Number = j * tw * 3 / 4;
					if (j % 2 == 0) {
						var y:Number = 2*i * th / 2;
					}else {
						y = (2*i+1) * th / 2;
					}
					
					result.push(new Point(x, y));
					
				}
			}
			return result;
		}
		
		static public function getMapPosition(xPos:Number,yPos:Number):Point
		{
			var x:Number = xPos * tw * 3 / 4;
			if (xPos % 2 == 0) {
				var y:Number = 2*yPos * th / 2;
			}else {
				y = (2*yPos+1) * th / 2;
			}
			
			return new Point(x, y)
		}
		
		static public function getIndexPositions(xPos:Number,yPos:Number):Point
		{
			var j:int = xPos * 4 / 3 / tw;
			if (j % 2 == 0) {
				var i:int = yPos * 2 / th / 2;
			}else {
				i =(yPos * 2 / th - 1)/2
			}
			return new Point(j, i);
			
			//var cell_y:int = yPos / grid_height;//0
			//var y:Number = yPos - cell_y * grid_height;
		 //
			//var cell_x:int = xPos / grid_width;//0
			//var x:Number = xPos - cell_x * grid_width;
		 //
			//if((cell_x+cell_y)&1) {
				//if (x * grid_width - y * grid_height > TEMP_1)
				//{
					//cell_x++;//1
				//}
			//}
			//else {
				//if (x * grid_width + y * grid_height > TEMP_2) 
				//{
					//cell_x++;
				//}
			//}
			//var rx:int = (cell_x + (1 - (cell_y & 1))) / 2;
			//var ry:int = (cell_y+(1-(cell_x&1)))/2;
			//
			//return new Point(rx, ry);
		}
		
		static public function getDistance(p1:Point,p2:Point):int
		{
			var tx:int = p2.x - p1.x;
			var ty:int = p2.y - p1.y;
			return (Math.abs(tx) + Math.abs(ty) + Math.abs(ty - tx)) / 2;
		}
		
		static public function move(from:Point,to:Point,step:int=1):Array
		{
			if (to.x < 0 || to.x > 15 || to.y < 0 || to.y > 15) {
				return [];
			}
			
			if (from.equals(to)) {
				return [];
			}
			
			var result:Array = findPath2(from, to);
			if (result && result.length > step) {
				result.length = step;
			}
			if (result) {
				return result;
			}
			return [];
		}
		
		
		
		static private var has:Object;
		static private var DIRECTS:Array = [1,2,4,8,16,32];
		
		private static function findPath(sx:int, sy:int, ex:int, ey:int):Array {
			var cs:Array = [], os:Array = [], ts:Array = [], hs:Array = [], ps:Array = [];
			var ez:int, sz:int, pi:int, ci:int, ti:int, ct:Array, pt:Array;
			var x:int, y:int, z:int, d:int, f:int, g:int, h:int, n:int;
			pt = ts[sz = (sx << 16 | sy)] = [sx, sy, 0, 0, 0, 0, null];
			ez = ex << 16 | ey;
			for (n = 1; 0 < n--; ) {
				cs[sz] = true;
				for (d = 0; d < 6; d++) {
					x = sx + getDX(d);
					y = sy + getDY(d);
					z = x << 16 | y;
					if (z == ez) {
						for (ps.push(d); pt[6]; pt = pt[6])
							ps.push(pt[0],pt[1]);
						return ps;
					}
					//if(x<0||y<0||x>Map.rx||y>Map.ry)continue;
					if (x < 0 || y < 0 || x > 16 || y > 16)
						continue;
					if (os[z]) {
						if ((ct = ts[z])[2] > (g = (d > 3 ? 14 : 10) + pt[2])) {
							ct[4] = f = (ct[2] = g) + ct[3];
							ct[5] = d;
							ct[6] = pt;
							for (pi = 0; pi++ < n; ) {
								if (hs[pi] == ct) {
									while ((pi = int((ci = pi) / 2)) > 0 && f < hs[pi][4]) {
										hs[ci] = hs[pi];
										hs[pi] = ct;
									}
									break;
								}
							}
						}
					} else if (!cs[z] && !_map[getCode(new Point(x,y))]) {
						os[z] = true;
						g = (d > 6 ? 14 : 10) + pt[2];
						h = ((ex > x ? ex - x : x - ex) + (ey > y ? ey - y : y - ey)) * 10;
						hs[pi = ++n] = ts[z] = ct = [x, y, g, h, f = h + g, d, pt];
						//while ((pi = int((ci = pi) / 2)) > 0 && f < hs[pi][4]) {
							//hs[ci] = hs[pi];
							//hs[pi] = ct;
						//}
					}
				}
				if (n < 1)
					return null;
				os[sz = (sx = (pt = hs[1])[0]) << 16 | (sy = pt[1])] = false;
				//for (f = (ct = hs[ci = 1] = hs[n])[4]; (ci = (pi = ci) * 2) < n; ) {
					//if ((ti = ci + 1) < n && hs[ci][4] > hs[ti][4])
						//ci = ti;
					//if (f < hs[ci][4])
						//break;
					//hs[pi] = hs[ci];
					//hs[ci] = ct;
				//}
			}
			return null;
		}
		
		private static var dxMap:Object = [0, 1, 1, 0, 0, 0, -1, 1];
		private static var dyMap:Object = [-2, -1, 1, 2, 1, -1, -1, -1];
		
		static private function getDY(d:int):int 
		{
			return dxMap[d];
		}
		
		static private function getDX(d:int):int 
		{
			return dyMap[d];
		}
		
		
		
		
		static public function getCode(v:Point):int
		{
			return v.x + v.y * 1000;
		}
		
		//static public function getFreePosition(v:Point,d:int):Array
		//{
			//var result:Point = v.clone();
			//
			//result.x++;
			//result
		//}
		
		static public function findPath2(from:Point,end:Point):Array
		{
			var result:Array = new Array();
			//result.push([from.clone(),null,0]);
			
			var cl:Array = new Array();
			var cb:Object = new Object();
			
			var ob:Object = new Object();
			
			cl.push([from.clone(), null, 0]);
			
			while (1) {
				var last:Array = cl[cl.length - 1];
				cb[getCode(last[0])] = 1;
				
				for (var i:int = 0; i < 6; i++) 
				{
					var next:Point = moveStep(last[0], i);
					var code:int = getCode(next);
					
					if (next.equals(end)) {
						var r:Array = new Array();
						
						if (!_map[code]) {
							r.push(next);
						}
						
						var t:Array = last;
						while (1) {
							r.unshift(t[0]);
							t = t[1];
							if (t == null)
							{
								break;
							}
						}
						
						return r;
					}
					
					if (next.x < 0 || next.y < 0 || next.x > 16 || next.y > 16) {
						continue;
					}
					
					
					if (!_map[code] && !cb[code]) {
						ob[code] = 1;
						
						result.push([next,last,getDistance(next,end) + getDistance(next,from)]);
					}else if(ob[code]){
						
					}
				}
				result.sortOn("2", Array.NUMERIC);
				
				if (result.length == 0) {
					break;
				}
				
				cl.push(result.shift());
			}
			return null;
		}
		
		static public function moveStep(from:Point,direct:int):Point
		{
			var result:Point = from.clone();
			switch(direct) {
				case 0:
					result.y--;
					break;
				case 1:					
					if (from.x % 2 == 1) {
						result.x++;
					}else {
						result.x++;
						result.y--;
					}					
					break;
				case 2:
					if (from.x % 2 == 1) {
						result.x++;
						result.y++;
					}else {
						result.x++;
					}	
					break;
				case 3:
					result.y++;
					break;
				case 4:
					if (from.x % 2 == 1) {
						result.x--;
						result.y++;
					}else {
						result.x--;
					}	
					break;
				case 5:
					if (from.x % 2 == 1) {
						result.x--;
					}else {
						result.x--;
						result.y--;
					}	
					break;
			}
			return result;
		}
	}
}
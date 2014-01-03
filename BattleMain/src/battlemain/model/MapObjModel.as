package battlemain.model 
{
	import flash.geom.Point;
	import tools.MapTitleTools;
	
	public class MapObjModel 
	{
		protected var _x:int;
		protected var _y:int;
		
		public function MapObjModel() 
		{
			
		}
		
		public function getPosition():Point
		{
			return new Point(_x,_y);
		}
		
		public function getDistance(value:Point):int
		{
			return MapTitleTools.getDistance(getPosition(),value)
		}
		
		public function setPosition(value:Point):void
		{
			MapTitleTools.free(getPosition());
			_x = value.x;
			_y = value.y;
			MapTitleTools.hold(getPosition());
		}
		
		public function get x():int 
		{
			return _x;
		}
		
		public function set x(value:int):void 
		{
			_x = value;
		}
		
		public function get y():int 
		{
			return _y;
		}
		
		public function set y(value:int):void 
		{
			_y = value;
		}
	}

}
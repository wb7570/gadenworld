package tools 
{
	/**
	 * ...
	 * @author 
	 */
	public class LayoutTool 
	{
		
		static public function alignmentByXAxis(...args):void
		{
			var tempH:Number = 0;
			for (var i:int = 0,leni:int=args.length; i < leni; i++) {
				if (args[i].height > tempH)
				{
					tempH = args[i].height;
				}
			}
			for (i = 0; i < leni; i++) {
				args[i].y = tempH / 2 - args[i].height / 2;
			}
			
		}
		
		static public function distributionByYAxis(spacing:Number,...args):void
		{
			var tempW:Number = 0;
			
			args.sortOn("x",Array.NUMERIC);
			
			
			for (var i:int = 0,leni:int=args.length; i < leni; i++) {
				if (args[i].x > tempW)
				{
					tempW = args[i].x;
				}
			}
			for (i = 0; i < leni; i++) {
				args[i].x = i*tempW/leni
			}
		}
		
		static public function arrangeX(spacing:Number,args:Array):void
		{
			var tx:Number = 0;
			for (var i:int = 0,leni:int=args.length; i < leni; i++) {
				args[i].x = tx;
				tx += spacing + args[i].width;
			}
		}
		
		static public function arrangeY(spacing:Number, args:Array):void
		{
			var ty:Number = 0;
			for (var i:int = 0,leni:int=args.length; i < leni; i++) {
				args[i].y = ty;
				ty += spacing + args[i].height;
			}
		}
	}
}
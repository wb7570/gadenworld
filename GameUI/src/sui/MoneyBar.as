package sui 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import tools.LayoutTool;
	/**
	 * ...
	 * @author 
	 */
	public class MoneyBar extends Sprite
	{
		public var txtGold:TextField;
		
		public function MoneyBar() 
		{
			var txt:TextField = new TextField(40, 30, "金币");
			txtGold = new TextField(120, 30, "10000");
			//txtGold = TextFieldAutoSize.LEFT
			txt.border = true;
			txtGold.border = true;
			addChild(txtGold);
			addChild(txt);
			LayoutTool.arrangeX(5,[txt, txtGold]);
		}
		
	}

}
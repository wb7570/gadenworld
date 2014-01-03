package sui.compents 
{
	import feathers.controls.List;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.ILayout;
	import feathers.layout.VerticalLayout;
	/**
	 * ...
	 * @author 
	 */
	public class SList extends List
	{
		
		public function SList(w:int,h:int) 
		{
			
		}
		
		public function setLayout(type:int,gap:int):void
		{
			if (type == 1) {
				var temp:* = new HorizontalLayout()
				
			}else {
				temp = new VerticalLayout();
			}
			temp.gap = gap;
			layout = temp;
		}
	}

}
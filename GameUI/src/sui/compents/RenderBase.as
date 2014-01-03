package sui.compents 
{
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.FeathersControl;
	import flash.geom.Point;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author ...
	 */
	public class RenderBase extends FeathersControl implements IListItemRenderer
	{
		private static const HELPER_POINT:Point = new Point();
		protected var _isSelected:Boolean;
		protected var _owner:List;
		protected var _index:int;
		protected var _data:Object;
		protected var touchPointID:int;
		//public var itemLabel:Label;
		
		public function RenderBase() 
		{
			addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override protected function draw():void
		{
			const dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			const selectionInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SELECTED);
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
 
			if (selectionInvalid)
			{
				commitSelected();
			}
			
			if(dataInvalid)
			{
				commitData();
			}
 
			//sizeInvalid = autoSizeIfNeeded() || sizeInvalid;
 
			if(sizeInvalid)
			{
				layout();
			}
		}
		
		//protected function autoSizeIfNeeded():Boolean
		//{
			//const needsWidth:Boolean = isNaN(this.explicitWidth);
			//const needsHeight:Boolean = isNaN(this.explicitHeight);
			//if(!needsWidth && !needsHeight)
			//{
				//return false;
			//}
			//this.itemLabel.width = NaN;
			//this.itemLabel.height = NaN;
			//this.itemLabel.validate();
			//var newWidth:Number = this.explicitWidth;
			//if(needsWidth)
			//{
				//newWidth = this.itemLabel.width;
			//}
			//var newHeight:Number = this.explicitHeight;
			//if(needsHeight)
			//{
				//newHeight = this.itemLabel.height;
			//}
			//return this.setSizeInternal(newWidth, newHeight, false);
		//}
		
		protected function commitData():void
		{
		}
 
		protected function commitSelected():void
		{
		}

		protected function layout():void
		{
			
		}
		
		protected function touchHandler(event:TouchEvent):void 
		{
			const touches:Vector.<Touch> = event.getTouches(this);
			if(touches.length == 0)
			{
				//hover has ended
				return;
			}
			if(this.touchPointID >= 0)
			{
				var touch:Touch;
				for each(var currentTouch:Touch in touches)
				{
					if(currentTouch.id == this.touchPointID)
					{
						touch = currentTouch;
						break;
					}
				}
				if(!touch)
				{
					return;
				}
				if(touch.phase == TouchPhase.ENDED)
				{
					this.touchPointID = -1;
		 
					touch.getLocation(this, HELPER_POINT);
					//check if the touch is still over the target
					//also, only change it if we're not selected. we're not a toggle.
					if(this.hitTest(HELPER_POINT, true) != null && !this._isSelected)
					{
						this.isSelected = true;
					}
					touchEndedHadnler();
					return;
				}else if(touch.phase == TouchPhase.HOVER)
				{
					touchHoverHandler();
					return;
				}else if (touch.phase == TouchPhase.BEGAN)
				{
					touchBeiganHadnler();
				}
			}
			else
			{
				for each(touch in touches)
				{
					if(touch.phase == TouchPhase.BEGAN)
					{
						this.touchPointID = touch.id;
						return;
					}
				}
			}
		}
		
		protected function touchBeiganHadnler():void 
		{
			
		}
		
		protected function touchEndedHadnler():void 
		{
			
		}
		
		protected function touchHoverHandler():void 
		{
			
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			if(this._data == value)
			{
				return;
			}
			this._data = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get index():int
		{
			return _index;
		}

		public function set index(value:int):void
		{
			if(this._index == value)
			{
				return;
			}
			_index = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get owner():List
		{
			return _owner;
		}

		public function set owner(value:List):void
		{
			if(this._owner == value)
			{
				return;
			}
			this._owner = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			if(this._isSelected == value)
			{
				return;
			}
			this._isSelected = value;			
			this.invalidate(INVALIDATION_FLAG_SELECTED);
			this.dispatchEventWith(Event.CHANGE);
		}
	}
}
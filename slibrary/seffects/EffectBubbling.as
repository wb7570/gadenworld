package seffects 
{
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	/**
	 * ...
	 * @author 
	 */
	public class EffectBubbling extends IAnimatable
	{
		private var _target:DisplayObject;
		private var _removed:Boolean;
		private var _dur:Number;
		private var _time:Number;
		private var _ty:Number;
		
		public function EffectBubbling(dur:Number,ty:Number,sp:DisplayObject, removed:Boolean = true) 
		{
			_dur = dur;
			_target = sp;
			_removed:Boolean = removed
		}
		
		public function execute():void
		{
			Starling.juggler.add(this);
		}
		
		public function advanceTime(time:Number):void
		{
			if (_time >= _dur) {
				end();
				return;
			}
			
			_time += time;
			_target.y -= _ty;
			
		}
		
		public function end():void
		{
			Starling.juggler.remove(this);
			if (_removed) {
				_target.parent.removeChild(_target);
			}
			_target = null;
		}
	}

}
﻿
/**

The MIT License

Copyright (c) 2008 Duncan Reid ( http://www.hy-brid.com )

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

**/



package com.hybrid.ui {
	
	
	import com.greensock.easing.Strong;
	import com.greensock.events.TweenEvent;
	import com.greensock.TweenLite;
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.text.*;
	import flash.utils.Timer;
	

	
	/**
	 * Public Setters:
	 
	 *		tipWidth 					Number				Set the width of the tooltip
	 *		titleFormat					TextFormat		Format for the title of the tooltip
	 *		contentFormat			TextFormat		Format for the bodycopy of the tooltip
	 *		align							String				left, right, center
	 *		delay							Number				Time in milliseconds to delay the display of the tooltip
	 *		hook							Boolean				Displays a hook on the bottom of the tooltip
	 *		hookSize					Number				Size of the hook
	 *		cornerRadius				Number				Corner radius of the tooltip, same for all 4 sides
	 *		colors						Array					Array of 2 color values ( [0xXXXXXX, 0xXXXXXX] ); 
	 *		autoSize					Boolean				Will autosize the fields and size of the tip with no wrapping or multi-line capabilities, helpful with 1 word items like "Play" or "Pause"
	 *
	 * Example:
	 
	 		var tf:TextFormat = new TextFormat();
			tf.bold = true;
			tf.size = 12;
			tf.color = 0xff0000;
			
			var tt:ToolTip = new ToolTip();
			tt.hook = true;
			tt.hookSize = 20;
			tt.cornerRadius = 20;
			tt.align = "center";
			tt.titleFormat = tf;
			tt.show( DisplayObject, "Title Of This ToolTip", "Some Copy that would go below the ToolTip Title" );
	 *
	 *
	 * @author Duncan Reid, www.hy-brid.com
	 * @date October 17, 2008
	 * @version 1.1
	 */
	 
	public class ToolTip extends Sprite {
		

		//objects
		private var _stage:Stage;
		private var _parentObject:DisplayObject;
		private var _tf:TextField;  // title field
		private var _cf:TextField;  //content field
		private var _tween:TweenLite
		
		//formats
		private var _titleFormat:TextFormat;
		private var _contentFormat:TextFormat;
		
		/* check for format override */
		private var _titleOverride:Boolean = false;
		private var _contentOverride:Boolean = false;
		
		//defaults
		private var _defaultWidth:Number = 200;
		private var _buffer:Number = 10;
		private var _align:String = "center"
		private var _cornerRadius:Number = 12;
		private var _bgColors:Array = [0xFFFFFF, 0x9C9C9C];
		private var _autoSize:Boolean = false;
		private var _hookEnabled:Boolean = false;
		private var _delay:Number = 0;  //millilseconds
		private var _hookSize:Number = 10;
		
		//offsets
		private var _offSet:Number;
		private var _hookOffSet:Number;
		
		//delay
		private var _timer:Timer;
		

	
		public function ToolTip():void {
			//do not disturb parent display object mouse events
			this.mouseEnabled = false;
			this.buttonMode = false;
			this.mouseChildren = false;
			//setup delay timer
			_timer = new Timer(this._delay, 1);
            _timer.addEventListener("timer", timerHandler);
		}
		
		public function show( p:DisplayObject, title:String, content:String=null ):void {
			//get the stage from the parent
			this._stage = p.stage;
			this._parentObject = p;
			
			this.addCopy( title, content );
			this.setOffset();
			this.drawBG();
			this.bgGlow();
			
			//initialize coordinates
			var parentCoords:Point = new Point( _parentObject.mouseX, _parentObject.mouseY );
			var globalPoint:Point = p.localToGlobal(parentCoords);
			this.x = globalPoint.x + this._offSet;
			this.y = globalPoint.y - this.height - 10;
			
			this.alpha = 0;
			this._stage.addChild( this );
			//this._parentObject.addEventListener( MouseEvent.MOUSE_OUT, this.onMouseOut );
			//removed mouse move handler in lieu of enterframe for smoother movement
			//this._parentObject.addEventListener( MouseEvent.MOUSE_MOVE, this.onMouseMovement );
			
			this.follow( true );
            _timer.start();
		}
		
		public function hide():void {
			this.animate( false );
		}
		
		private function timerHandler( event:TimerEvent ):void {
			this.animate(true);
		}

		private function onMouseOut( event:MouseEvent ):void {
			trace(111);
			//event.currentTarget.removeEventListener(event.type, arguments.callee);
			this.hide();
		}
		
		private function follow( value:Boolean ):void {
			if( value ){
				addEventListener( Event.ENTER_FRAME, this.eof );
			}else{
				removeEventListener( Event.ENTER_FRAME, this.eof );
			}
		}
		
		private function eof( event:Event ):void {
			this.position();
		}
		
		private function position():void {
			var speed:Number = 3;
			var parentCoords:Point = new Point( _parentObject.mouseX, _parentObject.mouseY );
			var globalPoint:Point = _parentObject.localToGlobal(parentCoords);
			var xp:Number = globalPoint.x + this._offSet;
			var yp:Number = globalPoint.y - this.height - 10;
			
			var overhangRight:Number = this._defaultWidth + xp;
			if( overhangRight > stage.stageWidth ){
				xp =  stage.stageWidth -  this._defaultWidth;
			}
			if( xp < 0 ) {
				xp = 0;
			}
			if( (yp) < 0 ){
				yp = 0;
			}
			this.x += ( xp - this.x ) / speed;
			this.y += ( yp - this.y ) / speed;
		}
		
		private function addCopy( title:String, content:String ):void {
			if( ! this._titleOverride ){
				this.initTitleFormat();
			}
			var titleIsDevice:Boolean = this.isDeviceFont(  _titleFormat );
			
			this._tf = this.createField( titleIsDevice ); 
			this._tf.htmlText = title;
			this._tf.setTextFormat( this._titleFormat, 0, title.length );
			if( this._autoSize ){
				this._defaultWidth = this._tf.textWidth + 4 + ( _buffer * 2 );
			}else{
				this._tf.width = this._defaultWidth - ( _buffer * 2 );
			}
			
			this._tf.x = this._tf.y = this._buffer;
			this.textGlow( this._tf );
			addChild( this._tf );
			if( content != null ){
				if( ! this._contentOverride ){
					this.initContentFormat();
				}
				//check for device font
				var contentIsDevice:Boolean = this.isDeviceFont(  _contentFormat );
				this._cf = this.createField( contentIsDevice );
				this._cf.htmlText = content;
				var bounds:Rectangle = this.getBounds( this );
				this._cf.x = this._buffer;
				this._cf.y = bounds.height + 5;
				this.textGlow( this._cf );
				this._cf.setTextFormat( this._contentFormat );
				if( this._autoSize ){
					var cfWidth:Number = this._cf.textWidth + 4 + ( _buffer * 2 )
					this._defaultWidth = cfWidth > this._defaultWidth ? cfWidth : this._defaultWidth;
				}else{
					this._cf.width = this._defaultWidth - ( _buffer * 2 );
				}
				addChild( this._cf );	
			}
		}
		
		//create field, if not device font, set embed to true
		private function createField( deviceFont:Boolean ):TextField {
			var tf:TextField = new TextField();
			tf.embedFonts = ! deviceFont;
			tf.gridFitType = "pixel";
			//tf.border = true;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.selectable = false;
			if( ! this._autoSize ){
				tf.multiline = true;
				tf.wordWrap = true;
			}
			return tf;
		}
		
		//draw background, use drawing api if we need a hook
		private function drawBG():void {
			var bounds:Rectangle = this.getBounds( this );
			var fillType:String = GradientType.LINEAR;
		   	//var colors:Array = [0xFFFFFF, 0x9C9C9C];
		   	var alphas:Array = [1, 1];
		   	var ratios:Array = [0x00, 0xFF];
		   	var matr:Matrix = new Matrix();
			var radians:Number = 90 * Math.PI / 180;
		  	matr.createGradientBox(this._defaultWidth, bounds.height + ( this._buffer * 2 ), radians, 0, 0);
		  	var spreadMethod:String = SpreadMethod.PAD;
		  	this.graphics.beginGradientFill(fillType, this._bgColors, alphas, ratios, matr, spreadMethod); 
			if( this._hookEnabled ){
				var xp:Number = 0; var yp:Number = 0; var w:Number = this._defaultWidth; var h:Number = bounds.height + ( this._buffer * 2 );
				this.graphics.moveTo ( xp + this._cornerRadius, yp );
				this.graphics.lineTo ( xp + w - this._cornerRadius, yp );
				this.graphics.curveTo ( xp + w, yp, xp + w, yp + this._cornerRadius );
				this.graphics.lineTo ( xp + w, yp + h - this._cornerRadius );
				this.graphics.curveTo ( xp + w, yp + h, xp + w - this._cornerRadius, yp + h );
				
				//hook
				this.graphics.lineTo ( xp + this._hookOffSet + this._hookSize, yp + h );
				this.graphics.lineTo ( xp + this._hookOffSet , yp + h + this._hookSize );
				this.graphics.lineTo ( xp + this._hookOffSet - this._hookSize, yp + h );
				this.graphics.lineTo ( xp + this._cornerRadius, yp + h );
				
				this.graphics.curveTo ( xp, yp + h, xp, yp + h - this._cornerRadius );
				this.graphics.lineTo ( xp, yp + this._cornerRadius );
				this.graphics.curveTo ( xp, yp, xp + this._cornerRadius, yp );
				this.graphics.endFill();
			}else{
				this.graphics.drawRoundRect( 0, 0, this._defaultWidth, bounds.height + ( this._buffer * 2 ), this._cornerRadius );
			}
		}

		
		
		
		/* Fade In / Out */
		
		private function animate( show:Boolean ):void {
			var end:int = show == true ? 1 : 0;
		    //_tween = new Tween( this, "alpha", Strong.easeOut, this.alpha, end, .5, true );
		    //_tween = new TweenLite( this,0.5,{alpha:1,ease:Strong.easeOut } );
			if ( ! show ) {
				
				//_tween = new TweenLite( this,0.1,{alpha:1,ease:Strong.easeOut,onComplete:onComplete } );
				//addEventListener( TweenEvent.COMPLETE, onComplete );
				onComplete();
				_timer.reset();
			}else {
				//_tween = new TweenLite( this,0.5,{alpha:1,ease:Strong.easeOut } );
			}
			alpha = 1;
		}
		
		private function onComplete( ):void {
			//event.currentTarget.removeEventListener(event.type, arguments.callee);
			this.cleanUp();
		}
	
		/* End Fade */
		
		
		

		/** Getters / Setters */
		
		public function set tipWidth( value:Number ):void {
			this._defaultWidth = value;
		}
		
		public function set titleFormat( tf:TextFormat ):void {
			this._titleFormat = tf;
			if( this._titleFormat.font == null ){
				this._titleFormat.font = "_sans";
			}
			this._titleOverride = true;
		}
		
		public function set contentFormat( tf:TextFormat ):void {
			this._contentFormat = tf;
			if( this._contentFormat.font == null ){
				this._contentFormat.font = "_sans";
			}
			this._contentOverride = true;
		}
		
		public function set align( value:String ):void {
			var a:String = value.toLowerCase();
			var values:String = "right left center";
			if( values.indexOf( value ) == -1 ){
				throw new Error( this + " : Invalid Align Property, options are: 'right', 'left' & 'center'" );
			}else{
				this._align = a;
			}
		}
		
		public function set delay( value:Number ):void {
			this._delay = value;
			this._timer.delay = value;
		}
		
		public function set hook( value:Boolean ):void {
			this._hookEnabled = value;
		}
		
		public function set hookSize( value:Number ):void {
			this._hookSize = value;
		}
		
		public function set cornerRadius( value:Number ):void {
			this._cornerRadius = value;
		}
		
		public function set colors( colArray:Array ):void {
			this._bgColors = colArray;
		}
		
		public function set autoSize( value:Boolean ):void {
			this._autoSize = value;
		}
		
		
		/* End Getters / Setters */
		
		
		
		/* Cosmetic */
		
		private function textGlow( field:TextField ):void {
			var color:Number = 0x000000;
            var alpha:Number = 0.35;
            var blurX:Number = 2;
            var blurY:Number = 2;
            var strength:Number = 1;
            var inner:Boolean = false;
            var knockout:Boolean = false;
            var quality:Number = BitmapFilterQuality.HIGH;

           var filter:GlowFilter = new GlowFilter(color,
                                  alpha,
                                  blurX,
                                  blurY,
                                  strength,
                                  quality,
                                  inner,
                                  knockout);
            var myFilters:Array = new Array();
            myFilters.push(filter);
        	field.filters = myFilters;
		}
		
		private function bgGlow():void {
			var color:Number = 0x000000;
            var alpha:Number = 0.20;
            var blurX:Number = 5;
            var blurY:Number = 5;
            var strength:Number = 1;
            var inner:Boolean = false;
            var knockout:Boolean = false;
            var quality:Number = BitmapFilterQuality.HIGH;

           var filter:GlowFilter = new GlowFilter(color,
                                  alpha,
                                  blurX,
                                  blurY,
                                  strength,
                                  quality,
                                  inner,
                                  knockout);
            var myFilters:Array = new Array();
            myFilters.push(filter);
            filters = myFilters;
		}
		
		private function initTitleFormat():void {
			_titleFormat = new TextFormat();
			_titleFormat.font = "_sans";
			_titleFormat.bold = true;
			_titleFormat.size = 20;
			_titleFormat.color = 0x333333;
		}
		
		private function initContentFormat():void {
			_contentFormat = new TextFormat();
			_contentFormat.font = "_sans";
			_contentFormat.bold = false;
			_contentFormat.size = 14;
			_contentFormat.color = 0x333333;
		}
	
		/* End Cosmetic */
	
	
		
		/* Helpers */
		
		/* Check if font is a device font */
		private function isDeviceFont( format:TextFormat ):Boolean {
			var font:String = format.font;
			var device:String = "_sans _serif _typewriter";
			return device.indexOf( font ) > -1;
			//_sans
			//_serif
			//_typewriter
		}
		
		private function setOffset():void {
			switch( this._align ){
				case "left":
					this._offSet = - _defaultWidth +  ( _buffer * 3 ) + this._hookSize; 
					this._hookOffSet = this._defaultWidth - ( _buffer * 3 ) - this._hookSize; 
				break;
				
				case "right":
					this._offSet = 0 - ( _buffer * 3 ) - this._hookSize;
					this._hookOffSet =  _buffer * 3 + this._hookSize;
				break;
				
				case "center":
					this._offSet = - ( _defaultWidth / 2 );
					this._hookOffSet =  ( _defaultWidth / 2 );
				break;
				
				default:
					this._offSet = - ( _defaultWidth / 2 );
					this._hookOffSet =  ( _defaultWidth / 2 );;
				break;
			}
		}
		
		/* End Helpers */
		
		
		
		/* Clean */
		
		private function cleanUp():void {
			//this._parentObject.removeEventListener( MouseEvent.MOUSE_OUT, this.onMouseOut );
			//this._parentObject.removeEventListener( MouseEvent.MOUSE_MOVE, this.onMouseMovement );
			this.follow( false );
			
			if (_tf) {
				this._tf.filters = [];
				removeChild( this._tf );
			}
			this._tf = null;
			
			this.filters = [];
			if( this._cf != null ){
				this._cf.filters = []
				removeChild( this._cf );
			}
			this.graphics.clear();
			
			if (parent.contains(this)) {
				parent.removeChild( this );
			}
			
		}
		
		/* End Clean */
	
	
		/* 
		private function onMouseMovement( event:MouseEvent ):void {
			var parentCoords:Point = new Point( _parentObject.mouseX, _parentObject.mouseY );
			var globalPoint:Point = _parentObject.localToGlobal(parentCoords);
			this.x = globalPoint.x - this.width;
			this.y = globalPoint.y - this.height - 10;
			event.updateAfterEvent();
		}
		*/
		
		
		
		
	}
}

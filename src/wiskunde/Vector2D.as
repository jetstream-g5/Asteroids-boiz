package wiskunde 
{
        import flash.display.Graphics;
        import flash.display.Sprite;
        /**
         * ...
         * @author
         */
        public class Vector2D extends Sprite
        {
			private var _dx:Number;
            private var _dy:Number;
            private var _angle:Number;
            private var _r:Number;
			
            public function Vector2D(dx:Number,dy:Number) 
            {
                this.dx = dx;
                this.dy = dy;
            }  
			
			public function get dx():Number    
			{
				return _dx;	
			}
			
            public function set dx(value:Number):void 
            {
                _dx = value;
                _angle = Math.atan2(_dy, _dx);
                _r = Math.sqrt(_dx * _dx + _dy * _dy);
            } 
			
			public function get dy():Number 
            {
                return _dy;
            }
            
			public function set dy(value:Number):void 
            {
                _dy = value;
                _angle = Math.atan2(_dy, _dx);
                _r = Math.sqrt(_dx * _dx + _dy * _dy);
            }
			
			public function get angle():Number 
            {
                return _angle;
            }
			
			public function set angle(value:Number):void 
            {
                _angle = value;
                //trace("value" + value);
                _dx = _r * Math.cos(_angle);
                _dy = _r * Math.sin(_angle);
            }
			
			public function get r():Number 
            {
                return _r;
            }
			
			public function set r(value:Number):void 
            {
                _r = value;
                _dx = _r * Math.cos(_angle);
                _dy = _r * Math.sin(_angle);
			}   
        }
}

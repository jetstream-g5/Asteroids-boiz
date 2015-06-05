package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import wiskunde.Vector2D;
	/**
	 * ...
	 * @author
	 */
	public class Player extends MovieClip
	{
		//public var bullets:Array;
		public var playerArt:Ship;
		private var speed:Number = 2;
		private var controlDir:Point;
		private var friction:Point = new Point();
		private var xMove:Number;
		private var yMove:Number;
		
		//hier een variabele gemaakt voor Vector
		public var pos:Vector2D = new Vector2D(0,0);
		
		public function Player()
		{
			makePlayer();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			//bullets = new Array();
		}
		
		private function makePlayer():void
		{
			playerArt = new Ship();  
			this.addChild(playerArt);   
			this.y = 300;
			this.x = 350; 	
			controlDir = new Point(0, 0);
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				controlDir.y = 0;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				//speler laat d los
				controlDir.x = 0;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler laat a los
				controlDir.x = 0;
			}
			
			if (e.keyCode == 39)
			{
				//speler laat right arrow los
				controlDir.x = 0;
			}
			
			if (e.keyCode == 37)
			{
				//speler laat left arrow los
				controlDir.x = 0;
			}
			
			if (e.keyCode == Keyboard.I)
			{
				playerArt.visible = true;
			}
			
			if ( e.keyCode == Keyboard.SHIFT)
			{
				
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			/*	speed = controlDir.y * -5;
			speed = 10;
			var radian:Number = this.rotation * Math.PI / 180;
			var xMove:Number = Math.cos(radian);
			var yMove:Number = Math.sin(radian);
			
			if (e.keyCode == Keyboard.W)
			{
				this.y += yMove * speed;
				this.x += xMove * speed;
			}*/
			
			if (e.keyCode == Keyboard.I)
			{
				playerArt.visible = false;
				trace("invisible");
			}
			
			if (e.keyCode == Keyboard.D || e.keyCode == 39)
			{
				//speler drukt d in
				controlDir.x = 1;
			}
			
			if (e.keyCode == Keyboard.A || e.keyCode == 37)
			{
				//speler drukt a in
				controlDir.x = -1;
			}
			
			if (e.keyCode == Keyboard.W)
			{
				//speler drukt w in
				controlDir.y = -1;
				
				friction.x = xMove * speed * 0.6;
				friction.y = yMove * speed * 0.6;
			}
			
		}
		//end onkeydown
		
		private function loop(e:Event):void
		{
			this.rotation += controlDir.x * 3;
			speed = controlDir.y * -5;
			var radian:Number = this.rotation * Math.PI / 180;
			xMove = Math.cos(radian);
			yMove = Math.sin(radian);
			this.y += yMove * speed;
			this.x += xMove * speed;
			
			//positioneren player
			this.pos.dx = this.x;
			this.pos.dy = this.y;
			
			this.x += friction.x;
			this.y += friction.y;
			
			if(friction.x > 0)
			{
				friction.x -= 0.05;
			}
			else if (friction.x < 0)
			{
				friction.x += 0.05;
			}
			
			if(friction.y > 0)
			{
				friction.y -= 0.05;
			}
			else if (friction.y < 0)
			{
				friction.y += 0.05;
			}
			// end friction
			
			if(this.y > stage.stageHeight + 60)
			{
				this.y = 0;
			}
			else if (this.y < -60)
			{
				this.y = stage.stageHeight;
			}
			
			if (this.x > stage.stageWidth + 60)
			{
				this.x = 0;
			}
			else if (this.x < -60)
			{
				this.x = stage.stageWidth;
			}
			//end stagepos
		}
		//end loop
	}

}
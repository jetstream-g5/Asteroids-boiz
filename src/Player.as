package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
<<<<<<< HEAD
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
=======
	import flash.events.KeyboardEvent;
>>>>>>> origin/master
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Player extends MovieClip
	{
		
		private var controlDir:Point;
		private var speed:Number = 0;
		private var playerArt:PlayerArt;
		
		
		
		public function Player()
		{
<<<<<<< HEAD
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			controlDir = new Point(0, 0);
			playerArt = new PlayerArt();
=======
			makePlayer();
>>>>>>> origin/master
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
			
		private function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
			
		private function makePlayer() 	
		{
			playerArt = new PlayerArt();		
			this.addChild(playerArt);				
			this.y = 300;
			this.x = 350;	
		}
			
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 37) //left arrow
			{
				playerArt.rotation += 20;
			}
			
			else if (e.keyCode == 39) //right arrow
			{
				playerArt.rotation -= 20;
			}
		}
		
				private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void
		{
			//this.x += controlDir.x * 5;
			//this.y += controlDir.y * 5;
			
			speed = controlDir.y * -5;
			this.rotation += controlDir.x * 3;
			var radian:Number = this.rotation * Math.PI / 180;
			//van graden naar radians
			//angle * Math.PI / 180;
			var xMove:Number = Math.cos(radian);
			var yMove:Number = Math.sin(radian);
			this.x += xMove * speed;
			this.y += yMove * speed;
			
			super.loop(e);
		
		/*var dx:Number = mouseX; verplaatst naar tankbase
		   var dy:Number = mouseY;
		
		   radian = Math.atan2(dy, dx);
		   var angle:Number = radian * 180 / Math.PI
		
		   tankturret.rotation = angle;
		 turretAngle = tankturret.rotation;*/
		
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler drukt op w
				controlDir.y = 0;
				this.rotation += controlDir.x * 3;
				trace("w");
				
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler drukt op w
				controlDir.x = 0;
				
			}
			
			if (e.keyCode == Keyboard.S)
			{
				//speler drukt op w
				controlDir.y = 0;
				
			}
			
			if (e.keyCode == Keyboard.D)
			{
				//speler drukt op w
				controlDir.x = 0;
			}
		
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler laat w los
				controlDir.y = -1;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler laat w los
				controlDir.x = -1;
			}
			
			if (e.keyCode == Keyboard.S)
			{
				//speler laat w los
				controlDir.y = 1;
			}
			
			if (e.keyCode == Keyboard.D)
			{
				//speler laat w los
				controlDir.x = 1;
			}
		
		}
		
	}

}
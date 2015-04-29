package  
{
 import flash.display.MovieClip;
 import flash.events.Event;
 import flash.events.KeyboardEvent;
 import flash.geom.Point;
 import flash.ui.Keyboard
 
 /**
  * ...
  * @author lorenzo
  */
 public class Player extends MovieClip
 {
		private var playerArt:Ship;
		private var speed:Number = 2;
		private var controlDir:Point;
		private var friction:Point = new Point();
		private var xMove:Number;
		private var yMove:Number;

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
  }
   
  private function makePlayer()  
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
			controlDir.y = -1;
			
			
			friction.x = xMove * speed * 0.6;
			friction.y = yMove * speed * 0.6;
		}//end onkeydown
			
	}
	
		private function loop(e:Event):void
		{
			this.rotation += controlDir.x * 3;
			speed = controlDir.y * -5;
			var radian:Number = this.rotation * Math.PI / 180;
			xMove = Math.cos(radian);
			yMove = Math.sin(radian);
			this.y += yMove * speed;
			this.x += xMove * speed;
			
			
			this.x += friction.x;
			this.y += friction.y;
			
			if(friction.x > 0)
			{
				friction.x -= 0.05;
			}else if (friction.x < 0)
			{
				friction.x += 0.05;
			}
			
			if(friction.y > 0)
			{
				friction.y -= 0.05;
			}else if (friction.y < 0)
			{
				friction.y += 0.05;
			}
			
			if (this.y > stage.stageHeight)
				{
					this.y = 0;
				}
			else if (this.y < 0)
				{
					this.y = stage.stageHeight;
				}
				
			if (this.x > stage.stageWidth)
				{
					this.x = 0;
				}
			else if (this.x < 0)
				{
					this.x = stage.stageWidth;
				}
		}//end loop
	
 }

}
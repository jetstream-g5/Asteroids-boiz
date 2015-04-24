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
  private var playerArt:PlayerArt;
  
	private var controlDir:Point;
  
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
   playerArt = new PlayerArt();  
   this.addChild(playerArt);    
   this.y = 300;
   this.x = 350; 	
   controlDir = new Point(0, 0);
  }
   
	private function onKeyUp(e:KeyboardEvent):void
	{
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
		if (e.keyCode == Keyboard.D)
			{
				//speler drukt d in
				controlDir.x = 1;
			}
			
			if (e.keyCode == 39)
			{
				//speler drukt right arrow in
				controlDir.x = 1;
			}
			
			if (e.keyCode == Keyboard.A)
			{
				//speler drukt a in
				controlDir.x = -1;
			}
			
			if (e.keyCode == 37)
			{
				//speler drukt left arrow in
				controlDir.x = -1;
			}
	}
	
	private function loop(e:Event):void
	{
		playerArt.rotation += controlDir.x * 3;
	}
	
 }

}
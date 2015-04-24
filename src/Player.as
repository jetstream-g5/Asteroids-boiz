package  
{
 import flash.display.MovieClip;
 import flash.events.Event;
 import flash.events.KeyboardEvent;
 
 /**
  * ...
  * @author lorenzo
  */
 public class Player extends MovieClip
 {
  
  private var playerArt:PlayerArt;
  
  
  
  public function Player()
  {
   makePlayer();
   
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
  
 }

}
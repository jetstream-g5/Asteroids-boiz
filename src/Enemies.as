package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	
	 private var player:Player;
	 private var speed:Number;
	 
	public class Enemies 
	{
		
		public function Enemies() 
		{
			player = new Player();
			
			this.rotation = player.x;
			this.speed = 5;
			this.x += this.rotation;
		}
		
	}

}
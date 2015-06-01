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
	 
	public class Enemy 
	{
		
		public function Enemy() 
		{
			player = new Player();
			
			this.rotation = player.x;
			this.speed = 5;
			this.x += this.rotation;
		}
		
	}

}

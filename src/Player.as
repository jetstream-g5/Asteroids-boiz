package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Player extends DestructibleObjects
	{
		
		public var playerArt:PlayerPlaceholder;
		
		public function Player() 
		{
			playerArt = new PlayerPlaceholder();
			
			this.addChild(playerArt);
		}
		
	}

}
package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Player extends MovieClip
	{
		
		private var playerArt:PlayerPlaceholderClass;

		
		public function Player()
		{
			playerArt = new PlayerPlaceholderClass();
			
			this.addChild(playerArt);
			
			this.y = 300;
			this.x = 350;
		}
		
	}

}
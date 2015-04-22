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
		
		private var playerArt:PlayerArt;

		
		public function Player()
		{
			playerArt = new PlayerArt();
			
			this.addChild(playerArt);
			
			this.y = 300;
			this.x = 350;
		}
		
	}

}
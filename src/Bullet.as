package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Bullet extends MovieClip
	{
		private var bullet_Art:bulletArt;
		private var xmove:Number;
		private var ymove:Number;
		private var player:Player;
		
		public function Bullet()
		{
			player = new Player();
			
			bullet_Art = new bulletArt();
			addChild(bullet_Art);
			
			this.x = player.x;
			this.y = player.y;
			
			this.rotation = player.rotation + 90;
			
			var r:Number = bullet_Art.rotation * Math.PI * 180;
			xmove = Math.cos(r);
			ymove = Math.sin(r);
		}
		
		/*var r:Number = bullet_Art.rotation * Math.PI * 180;
		xmove = Math.cos(r);
		ymove = Math.sin(r);*/
		
		
		
		public function update():void
		{
			this.x += xmove * 20;
			this.y += ymove * 20;
		}
		
		
	}

}
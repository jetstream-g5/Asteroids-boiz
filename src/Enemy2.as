package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import wiskunde.Vector2D;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author
	*/
	public class Enemy2 extends asteroids
	{
		public var pos:Vector2D = new Vector2D(0,0);
		public var vit:Vector2D = new Vector2D(0, 0);
		private var pl:Player;
		private var enemy2Art:asteroids;
		private var timer:Timer;
		private var posNumber:Number;
		
		public function Enemy2(p:Player)
		{
			enemy2Art = new asteroids();
			this.addChild(enemy2Art);
			pl = p;
			
				this.x = 900;
				this.y = Math.random() * 550;

				/*if (posNumber == 2)
				{
					this.x = 900;
					this.y = Math.random() * 550;
				}
				else if (posNumber == 1)
				{
					this.x = Math.random() * 900;
					this.y = 550;
				}*/
				
				timer = new Timer(1000, 1);
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerEvent);
				timer.start();
			
			addEventListener(Event.ENTER_FRAME, update);
			
			
		}
		
		
		private function update(e:Event):void
		{	
			this.vit.dx = pl.x - this.x;
			this.vit.dy = pl.y - this.y;
			this.vit.r = 2.5;
			this.x += this.vit.dx;
			this.y += this.vit.dy;
		}
		
		private function timerEvent(e:TimerEvent):void
		{
			posNumber = Math.round(Math.random() * 2);
		}
		
	}

}
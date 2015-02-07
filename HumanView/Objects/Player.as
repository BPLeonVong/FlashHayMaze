package  
{
	
	import flash.display.MovieClip;
	
	
	public class Player extends VUnit 
	{
		
		public var currentDirection:String = "Right";
		private var speed:Number = 10;
		public function Player() 
		{
			VProcess();
		}
		
		override public function VOnUpdate(deltaMS)
		{
			if(InputDeviceManager.KA)
			{
				this.x -= speed;
				this.gotoAndStop("playerLeft");
				CheckPlayerPosition("Left");
			}
			else if(InputDeviceManager.KD)
			{
				this.x += speed;
				this.gotoAndStop("playerRight");
				CheckPlayerPosition("Right");
			}
			if(InputDeviceManager.KW)
			{
				this.y -= speed;
				this.gotoAndStop("playerUp");
				CheckPlayerPosition("Up");
			}
			else if(InputDeviceManager.KS)
			{
				this.y += speed;
				this.gotoAndStop("playerDown");
				CheckPlayerPosition("Down");
			}
			
			if(this.x - HumanView.SFactory.m_DContainer.m_Goal.x < 20 
				&& this.y - HumanView.SFactory.m_DContainer.m_Goal.y < 20
				&& this.x - HumanView.SFactory.m_DContainer.m_Goal.x > -20
				&& this.y - HumanView.SFactory.m_DContainer.m_Goal.y > -20)
			{
				HumanView.RESTARTGAME();
				HumanView.RESETPOSITIONS();
			}
		}
		
		private function CheckPlayerPosition(Direction)
		{
			if(Direction == "Left")
			{
				if(HumanView.SFactory.m_DContainer.m_Map
					[roundToNearest(160,this.x)/160][roundToNearest(160,this.y)/160] == 1)
				this.x += 10;
			}
			if(Direction == "Right")
			{
				if(HumanView.SFactory.m_DContainer.m_Map
					[roundToNearest(160,this.x)/160][roundToNearest(160,this.y)/160] == 1)
				this.x -= 10;
			}
			if(Direction == "Down")
			{
				if(HumanView.SFactory.m_DContainer.m_Map
					[roundToNearest(160,this.x)/160][roundToNearest(160,this.y)/160] == 1)
				this.y -= 10;
			}
			if(Direction == "Up")
			{
				if(HumanView.SFactory.m_DContainer.m_Map
					[roundToNearest(160,this.x)/160][roundToNearest(160,this.y)/160] == 1)
				this.y += 10;
			}
			
			currentDirection = Direction;
			
			if(HumanView.SFactory.m_DContainer.m_Map
					[roundToNearest(160,this.x)/160][roundToNearest(160,this.y)/160] == 2)
			HumanView.RESTARTGAME();
		}
		
		private function roundToNearest(roundTo:Number, value:Number):Number
		{
			if(Math.round(value/roundTo)*roundTo>value)
			{
				return Math.round(value/roundTo)*roundTo - 160;
			} else
			{
				return Math.round(value/roundTo)*roundTo;
			}
		}
		
	}
}

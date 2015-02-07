package  
{
	import flash.geom.Rectangle;
	
	public class GameCamera extends VActor
	{
		public var m_Camera:Rectangle;
		private var m_ease:Number = 1;
		
		public function GameCamera(m_x,m_y,m_width,m_height) 
		{
			VProcess();
			HumanView.ProcessManager.ProcessList.push(this);
			m_Camera = new Rectangle(0,0,m_width,m_height);
		}
		
		override public function VOnUpdate(deltaMS)
		{

			if(InputDeviceManager.KLEFT && m_Camera.x > 0)
			{
				m_Camera.x -= 50;
			}
			if(InputDeviceManager.KRIGHT && m_Camera.x < 6740)
			{
				m_Camera.x += 50;
			}
			if(InputDeviceManager.KUP && m_Camera.y > 0)
			{
				m_Camera.y -= 50;
			}
			if(InputDeviceManager.KDOWN && m_Camera.y < 6900)
			{
				m_Camera.y += 50;
			}

			HumanView.SFactory.m_DContainer.m_RGS.scrollRect = m_Camera;
		}
	}
}

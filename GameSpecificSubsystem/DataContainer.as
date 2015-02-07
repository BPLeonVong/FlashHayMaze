package  
{
	
	public class DataContainer 
	{
		public var m_RMainMenu: StartButton;
		public var m_MapButton:OpenMap;
		public var m_Info:Information;
		public var m_InfoBox:InfoBox;
		
		public var m_RGS:	GameScreen;
		public var m_RBG:	Background;
		public var m_RFG:	Foreground;
		public var m_RGA:	GameActors;
		
		
		public var m_Player:Player;
		public var m_Goal  :Goal;
		
		public var m_Map:	Array = new Array();
		public var m_Tiles:	Array = new Array();
		
		var randomRounded : int;
		
		public function DataContainer() 
		{	
			SetMap();
			for(var i=0;i<49;i++)
			{
				m_Tiles[i] = new Array();
				for(var j=0;j<49;j++)
				{
					m_Tiles[i][j]=0;
				}
			}
		}
		
		public function SetMap()
		{
			for(var i=0;i<49;i++)
			{
				m_Map[i] = new Array();
				for(var j=0;j<49;j++)
				{
					m_Map[i][j]=0;
				}
			}
			i = 0;
			for(j = 0; j<49; j++)
			{
				for(i = 0; i<49; i++)
				{
					if(j==0 || j==48 || i == 0 || i == 48 || i % 2 == 0 && j % 2 == 0)
					{
						m_Map[i][j]=1;
						if(i % 2 == 0 && j % 2 == 0 && (j>=2 && j<=46 && i >= 2 && i <= 46))
						{
							RandomDirection(i,j);
						}
					}
					
					if(m_Map[i][j]==0 && i % 2 != 0 && j % 2 != 0 )
					{
						randomRounded = Math.ceil((Math.random() * 20));
						if(randomRounded>17)
						{
							m_Map[i][j]=2;
						}
					}
				}
			}
		}
		
		public function RandomDirection(xi:Number,yi:Number)
		{
			randomRounded = Math.ceil((Math.random() * 4));
			if(randomRounded == 1 )
			{1
				m_Map[xi+1][yi]=1;
			}
			if(randomRounded == 2 )
			{
				m_Map[xi-1][yi]=1;
			}
			if(randomRounded == 3 )
			{
				m_Map[xi][yi+1]=1;
			}
			if(randomRounded == 4 )
			{
				m_Map[xi][yi-1]=1;
			}
		}
	}
}

package  
{
	
	public class SpriteFactory 
	{
		public var m_OContainer:		ObjectContainer;
		public var m_DContainer:		DataContainer;
		
		public var TILE 	  	:String = "Tile";
		public var GS 	  		:String = "GS";
		public var BG 	  		:String = "BG";
		public var FG 	  		:String = "FG";
		public var GA 	  		:String = "GA";
		public var PLAYER		:String = "PLAYER";
		public var GOAL			:String = "GOAL";
		public var RESTART		:String = "RESTART";
		public var START		:String = "START";
		public var OPENMAP		:String = "OPENMAP";
		public var INFORMATION	:String = "INFO";


		public function SpriteFactory() 
		{
			m_OContainer = new ObjectContainer();
			m_DContainer = new DataContainer();
		}
		
		public function RenderBackground(bg)
		{
			for(var i=0;i<49;i++)
			{
				for(var j=0;j<49;j++)
				{
					if(m_DContainer.m_Map[i][j]==0)
					{
						addTiles(bg,0+160*i,0+160*j,1,m_OContainer.m_tiles,TILE,i,j);
					}
					else if(m_DContainer.m_Map[i][j]==1)
					{
						addTiles(bg,0+160*i,0+160*j,2,m_OContainer.m_tiles,TILE,i,j);
					}
					else if(m_DContainer.m_Map[i][j]==2)
					{
						addTiles(bg,0+160*i,0+160*j,3,m_OContainer.m_tiles,TILE,i,j);
					}
				}
			}
		}
		
		public function ReRenderTiles()
		{
			for(var i=0;i<49;i++)
			{
				for(var j=0;j<49;j++)
				{
					if(m_DContainer.m_Map[i][j]==0)
					{
						m_DContainer.m_Tiles[i][j].gotoAndStop(1);
					}
					else if(m_DContainer.m_Map[i][j]==1)
					{
						m_DContainer.m_Tiles[i][j].gotoAndStop(2);
					}
					else if(m_DContainer.m_Map[i][j]==2)
					{
						m_DContainer.m_Tiles[i][j].gotoAndStop(3);
					}
				}
			}
		}
		
		public function addTiles(Parent,xPos, yPos, frame, object, objectName:String,arrayx,arrayy)
		{
			object = new Tile();
			object.x = xPos;
			object.y = yPos;
			object.gotoAndStop(frame);
			Parent.addChild(object);
			m_DContainer.m_Tiles[arrayx][arrayy] = object;
		}
		
		public function addObject(Parent,xPos, yPos, frame, object, objectName:String)
		{
			switch (objectName)
			{
				case GS:
					object = new GameScreen();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RGS = object;
				case BG:
					object = new Background();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RBG = object;
					break;
				case FG:
					object = new Foreground();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RFG = object;
					break;
				case GA:
					object = new GameActors();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RGA = object;
					break;
				case PLAYER:
					object = new Player();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_Player = object;
					break;
				case GOAL:
					object = new Goal();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_Goal = object;
					break;
				case RESTART:
					object = new Restart();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					break;
				case START:
					object = new StartButton();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RMainMenu = object;
					break;
				case OPENMAP:
					object = new OpenMap();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_MapButton = object;
					break;
				case INFORMATION:
					object = new InfoBox();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_InfoBox = object;
					break;
			}
		}
	}
}

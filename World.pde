public class World
{
  protected
    float
    sizeX, 
  sizeY;

  protected
    float
    posX, 
  posY;


  protected
    PImage
    landscape;

  public World(int levelWidth, int levelHeight, PImage levelBack)
  {
    sizeX = levelWidth;
    sizeY = levelHeight;
    landscape = levelBack;
    posX = sizeX/2;
    posY = sizeY/2;
  }

  public void draw(int x, int y)
  {
    posX = x;
    posY = y;
    for (int k = 0; k <= sizeY + (sizeY); k += landscape.height/2)
    {
      posY += y;
      for (int i = 0; i <= sizeX + (sizeX); i += landscape.width/2)
      {
        image(landscape, i - x, k - y, landscape.width/2, landscape.height/2);
      }
    }
  }
}


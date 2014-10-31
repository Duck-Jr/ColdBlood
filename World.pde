public class World
{
  protected
<<<<<<< HEAD
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

=======
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
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public World(int levelWidth, int levelHeight, PImage levelBack)
  {
    sizeX = levelWidth;
    sizeY = levelHeight;
    landscape = levelBack;
    posX = sizeX/2;
    posY = sizeY/2;
  }
<<<<<<< HEAD

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

=======
  
  public void draw()
  {
  }
}
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2

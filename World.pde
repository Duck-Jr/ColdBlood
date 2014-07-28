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
  
  public void draw()
  {
  }
}

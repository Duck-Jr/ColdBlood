public class Rock
{
  float posX, posY, sizeX, sizeY;
  PImage img;
  
  public Rock(float x, float y, float sX, float sY, PImage sprite)
  {
    posX = x;
    posY = y;
    sizeX = sX;
    sizeY = sY;
    img = sprite;
  }
  
  public void draw()
  {
    imageMode(CENTER);
    image(img, posX, posY, sizeX, sizeY);
    imageMode(CORNER);
  }
  
  
}

import java.awt.Point;

public class HUDElement
{
  protected
  int
  posX,
  posY;
  
  protected
  PImage
  background;
  
  protected
  HUDType
  type;
  
  public HUDElement(int x, int y, HUDType t)
  {
    setPos(new Point(x, y));
    setType(t);
  }
  
  //Position Getters And Setters
  /*================================================================*/
  public void setX(int x)
  {
    posX = x;
  }
  
  public int getX()
  {
    return posX;
  }
  
  public void setY(int y)
  {
    posY = y;
  }
  
  public int getY()
  {
    return posY;
  }
  
  public void setPos(Point p)
  {
    setX(p.x);
    setY(p.y);
  }
  
  public Point getPos()
  {
    return new Point(posX, posY);
  }
  /*================================================================*/
  
  
  //Type Getter And Setter
  /*================================================================*/
  public void setType(HUDType t)
  {
    type = t;
  }
  
  public HUDType getType()
  {
    return type;
  }
  /*================================================================*/
  
  public void draw()
  {
  }
}
















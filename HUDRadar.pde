public class HUDRadar extends HUDElement
{
  int rev = 0;
  int rad;
  int radPing = 0;
  boolean isPinging = false;

  public HUDRadar(int x, int y, PImage i)
  {
    super(x, y, HUDType.INFO);
    background = i;
  }
  @Override
    public void draw()
  {
    rad = background.width/8;
    fill(0, 100, 255, 100);
    ellipse(posX, posY, background.width/4, background.height/4);
    ellipse(posX, posY, background.width/32, background.height/32);
    noFill();
    stroke(0, 200, 255);
    ellipse(posX, posY, radPing, radPing);
    fill(0, 0, 255, 50);
    noStroke();
    ellipse(posX, posY, radPing - rad, radPing - rad);
    stroke(0, 200, 255, 200);
    strokeWeight(2);
    fill(0, 100, 255, 100);
    noStroke();
    triangle(posX, posY, posX + cos(radians(rev + 20)) * rad, posY + sin(radians(rev + 20)) * rad, posX + cos(radians(rev - 20)) * rad, posY + sin(radians(rev - 20)) * rad);
    strokeWeight(1);
    noStroke();
    imageMode(CENTER);
    image(background, posX, posY, background.width/4, background.height/4);
    imageMode(CORNER);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(28);
    text("Derpington Mountains", posX, posY + rad + (rad/5));
    textAlign(LEFT);
    if (rev < 360)
    {
      rev += 4;
    }
    else
    {
      rev = 0;
      isPinging = true;
    }
    
    if(isPinging)
    {
      if(radPing < background.width/4)
        radPing += 4;
        else
        {
          radPing = 0;
          isPinging = false;
        }
    }
  }
}


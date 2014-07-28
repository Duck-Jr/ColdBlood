
public class HUD
{
  HUDHealthBar 
    hpBar;

  PImage 
    bg;

  int
    hp, 
  fade;

  HUDWeapon 
    w;

  HUDRadar 
    r;

  HUDScoreBoard 
    s;

  HUDPlayerInfo
    p;

  boolean
    isTabbed
    =
    false;

  //public HUD(Map m, ArrayList<PImage> images, PFont f1, PFont f2)
  public HUD(int hp, ArrayList<PImage> images, PFont f1, PFont f2, float scale)
  {
    this.hp = hp;
    fade = 0;
    hpBar = new HUDHealthBar(20, 20, images.get(0), 100, scale);
    w = new HUDWeapon(20, height - (height/4), images.get(1), images.get(2), scale);
    r = new HUDRadar(width - (width/9), height - (height/5), images.get(3), scale);
    s = new HUDScoreBoard((width/3), (height/3), images.get(1), images.get(4), images.get(5), f1, scale);
    p = new HUDPlayerInfo(20, 110, images.get(1), images.get(4), f1, f2, scale);
  }

  public void draw(int hp, boolean isTabbed)
  {
    hpBar.update(hp);
    w.draw();
    r.draw();
    if (isTabbed)
    {
      if (fade < 255)
        fade+= 60;
    } else
    {
      if (fade > 0)
        fade -= 60;
    }
    s.draw(fade);
    p.draw();
  }
} 



//HUDElement
//=====================================================>>
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



//HUDHealthBar
//===========================================>>
public class HUDHealthBar extends HUDElement
{
  protected 
    float
    maxHealth, 
  currentHealth,
  scale;

  int blinker = 0;

  boolean blink = false;

  public HUDHealthBar(int x, int y, PImage i, int maxHealth, float scale)
  {
    super(x, y, HUDType.BAR);
    background = i;
    this.maxHealth = maxHealth;
    currentHealth = maxHealth;
    this.scale = scale;
  }

  @Override
    public void draw()
  {
    noStroke();
    if (100*(currentHealth/maxHealth) <= 10)
      fill(blinker, 0, 0, 200);
    else
      fill(255 * ((maxHealth - currentHealth)/maxHealth), 255 * (currentHealth/maxHealth), 0, 234);
    rect(posX + 85 * scale, posY + 20 * scale, 342 * (currentHealth/maxHealth) * scale, 38 * scale);
    fill(0, 150);
    rect(posX + (85 + (342 * (currentHealth/maxHealth))) * scale, posY + 20 * scale, 342 * ((maxHealth - currentHealth)/maxHealth) * scale, 38 * scale);
     image(background, posX, posY, background.width/10 * scale, background.height/10 * scale);
    noTint();

    if (blink)
    {
      if (blinker > 150)
        blinker -= 20;
      else
        blink = false;
    } 
    else
    {
      if (blinker < 255)
        blinker += 20;
      else
        blink = true;
    }
  }

  public void update(int currentHealth)
  {
    this.currentHealth = currentHealth;
    draw();
  }
}

//HUDPlayerInfo
//======================================>>

public class HUDPlayerInfo extends HUDElement
{
  PImage flag;
  
  PFont font, font2;
  
  float scale;
  
  public HUDPlayerInfo(int x, int y, PImage i, PImage f, PFont tF, PFont tF2, float scale)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag = f;
    font = tF;
    font2 = tF2;
    this.scale = scale;
  }
  
  @Override
  public void draw()
  {
    fill(0, 150);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, 160);
    image(flag, posX + 125 * scale, posY + 56 * scale, flag.width * scale, flag.height * scale);
    noTint();
    fill(0, 255, 255);
    textSize(28);
    textFont(font, 28 * scale);
    text("Player Name", posX + 245 * scale, posY + 96 * scale);
    textFont(font2, 24 * scale);
    text("Kills: " + "98", posX + 120 * scale, posY + (66 + 80) * scale);
    text("Deaths: " + "99", posX + 120 * scale, posY + (66 + 110) * scale);
    text("Money: " + "$84.00", posX + 120 * scale, posY + (66 + 140) * scale);
    text("Level: " + "Derpington Mountains", posX + 120 * scale, posY + (66 + 170) * scale);
  }
}



//HUDRadar
//====================================>>
public class HUDRadar extends HUDElement
{
  int rev = 0;
  int rad;
  int radPing = 0;
  boolean isPinging = false;
  float scale;

  public HUDRadar(int x, int y, PImage i, float scale)
  {
    super(x, y, HUDType.INFO);
    this.scale = scale;
    background = i;
  }
  @Override
    public void draw()
  {
    rad = background.width/8;
    fill(0, 100, 255, 100);
    ellipse(posX, posY, (background.width/4) * scale , (background.height/4) * scale);
    ellipse(posX, posY, (background.width/32) * scale, (background.height/32) * scale);
    noFill();
    stroke(0, 200, 255);
    ellipse(posX, posY, radPing * scale, radPing * scale);
    fill(0, 0, 255, 50);
    noStroke();
    ellipse(posX, posY, radPing - rad, radPing - rad);
    stroke(0, 200, 255, 200);
    strokeWeight(2);
    fill(0, 100, 255, 100);
    noStroke();
    triangle(posX, posY, posX + cos(radians(rev + 20)) * rad * scale, posY + sin(radians(rev + 20)) * rad * scale, posX + cos(radians(rev - 20)) * rad * scale, posY + sin(radians(rev - 20)) * rad * scale);
    strokeWeight(1);
    noStroke();
    imageMode(CENTER);
    image(background, posX, posY, (background.width/4) * scale, (background.height/4) * scale);
    imageMode(CORNER);
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


//HUDScoreBoard
//===========================================>>
public class HUDScoreBoard extends HUDElement
{
  PImage flag1, flag2;
  PFont font;
  float scale;
  
  public HUDScoreBoard(int x, int y, PImage i, PImage f1, PImage f2, PFont f, float scale)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag1 = f1;
    flag2 = f2;
    font = f;
    this.scale = scale;
  }
  
  public void draw(int alpha)
  {
    fill(0, alpha - 150);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    tint(255, alpha);
    image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, alpha);
    image(flag1, posX + 125 * scale, posY + 54 * scale, flag1.width * scale, flag1.height * scale);
    image(flag2, posX + 125 * scale, posY + (54 + flag2.height - 10) * scale, flag2.width * scale, flag2.height * scale);
    noTint();
    fill(0, 255, 255, alpha);
    textFont(font, 24 * scale);
    text("USA: " + "99" + " Kills", posX + 245 * scale, posY + 96 * scale);
    text("Russia: " + "98" + " Kills", posX + 245 * scale, (posY + 96 + flag2.height/3));
  }
}



//HUDWeapon
//===========================================>>
public class HUDWeapon extends HUDElement
{
  protected
    PImage
    weapon;

  protected
  float
  scale;

  public HUDWeapon(int x, int y, PImage i, PImage iW, float scale)
  {
    super(x, y, HUDType.INFO);
    background = i;
    weapon = iW;
    this.scale = scale;
  }

  @Override
    public void draw()
  {
    fill(0, 150);
    rect(posX + 50 * scale, posY + 16 * scale, 380 * scale, 188 * scale);
    image(background, posX, posY, (background.width/10) * scale, (background.height/10) * scale);
    fill(#03FCEE);
    textSize(20 * scale);
    text("Plasma Railgun", posX + 100 * scale, posY + 40 * scale);
    image(weapon, posX + 100 * scale, posY + 40 * scale, (weapon.width/4) * scale, (weapon.height/4) * scale);
    fill(0, 200, 255, 100);
    for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + (100 + i) * scale, posY + 130 * scale, 10 * scale, 20 * scale);
      triangle(posX + (100 + i) * scale, posY + 130 * scale, posX + (110 + i) * scale, posY + 130 * scale, posX + (105 + i) * scale, posY + 120 * scale);
    }

    /*for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + 100 + i, posY + 160, 10, 20);
      triangle(posX + 100 + i, posY + 160, posX + 110 + i, posY + 160, posX + 105 + i, posY + 150);
    }*/
  }
}














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
<<<<<<< HEAD
    
    PImage death, immortal;
=======
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2

  //public HUD(Map m, ArrayList<PImage> images, PFont f1, PFont f2)
  public HUD(int hp, ArrayList<PImage> images, PFont f1, PFont f2, float scale)
  {
    this.hp = hp;
    fade = 0;
    hpBar = new HUDHealthBar(20, 20, images.get(0), 100, scale);
    w = new HUDWeapon(20, height - (height/4), images.get(1), images.get(2), scale);
    r = new HUDRadar(width - (width/9), height - (height/5), images.get(3), scale);
<<<<<<< HEAD
    s = new HUDScoreBoard((width - (width/2)), 50, images.get(1), images.get(4), images.get(5), f1, scale);
    p = new HUDPlayerInfo(20, 110, images.get(1), images.get(4), f1, f2, scale);
    death = images.get(6);
    immortal = images.get(7);
  }

  public void draw(int hp, boolean isTabbed, boolean isDead, int kills)
  {
    hpBar.update(hp);
    //r.draw();
=======
    s = new HUDScoreBoard((width/3), (height/3), images.get(1), images.get(4), images.get(5), f1, scale);
    p = new HUDPlayerInfo(20, 110, images.get(1), images.get(4), f1, f2, scale);
  }

  public void draw(int hp, boolean isTabbed)
  {
    hpBar.update(hp);
    w.draw();
    r.draw();
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    if (isTabbed)
    {
      if (fade < 255)
        fade+= 60;
    } else
    {
      if (fade > 0)
        fade -= 60;
    }
<<<<<<< HEAD
    //s.draw(fade);
    p.draw(kills);
    
    if(isDead)
    {
      imageMode(CENTER);
      tint(255, 100, 100, 200);
      image(death, width/2, height/1.2);
      textAlign(CENTER);
      fill(0, 150, 255, 160);
      rectMode(CENTER);
      stroke(0, 150, 255);
      rect(width/2, height/2, 200, 60);
      fill(0, 255, 255);
      text( "Respawn In: " + (3 - ArcticShock.player.respawnTimer/80) + "s", width/2, height/2);
      textAlign(LEFT);
      noTint();
      rectMode(CORNER);
      imageMode(CORNER);
    }
    
    if(ArcticShock.player.inv)
    {
      imageMode(CENTER);
      tint(255, 200);
      image(immortal, width/2, height/2.6, immortal.width/2, immortal.height/2);
      noTint();
      imageMode(CORNER);
    }
=======
    s.draw(fade);
    p.draw();
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  }
} 



//HUDElement
//=====================================================>>
import java.awt.Point;

public class HUDElement
{
  protected
<<<<<<< HEAD
    int
    posX, 
  posY;

  protected
    PImage
    background;

  protected
    HUDType
    type;

=======
  int
  posX,
  posY;
  
  protected
  PImage
  background;
  
  protected
  HUDType
  type;
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public HUDElement(int x, int y, HUDType t)
  {
    setPos(new Point(x, y));
    setType(t);
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  //Position Getters And Setters
  /*================================================================*/
  public void setX(int x)
  {
    posX = x;
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public int getX()
  {
    return posX;
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public void setY(int y)
  {
    posY = y;
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public int getY()
  {
    return posY;
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public void setPos(Point p)
  {
    setX(p.x);
    setY(p.y);
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public Point getPos()
  {
    return new Point(posX, posY);
  }
  /*================================================================*/
<<<<<<< HEAD


=======
  
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  //Type Getter And Setter
  /*================================================================*/
  public void setType(HUDType t)
  {
    type = t;
  }
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public HUDType getType()
  {
    return type;
  }
  /*================================================================*/
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD
  currentHealth, 
=======
  currentHealth,
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD
    image(background, posX, posY, background.width/10 * scale, background.height/10 * scale);
=======
     image(background, posX, posY, background.width/10 * scale, background.height/10 * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    noTint();

    if (blink)
    {
      if (blinker > 150)
        blinker -= 20;
      else
        blink = false;
<<<<<<< HEAD
    } else
=======
    } 
    else
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD

  PFont font, font2;

  float scale;

=======
  
  PFont font, font2;
  
  float scale;
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public HUDPlayerInfo(int x, int y, PImage i, PImage f, PFont tF, PFont tF2, float scale)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag = f;
    font = tF;
    font2 = tF2;
    this.scale = scale;
  }
<<<<<<< HEAD

    public void draw(int kills)
  {
    fill(0, 150, 255, 150);
    stroke(0, 150, 255);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    //image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, 160);
    image(flag, posX + 125 * scale, posY + 56 * scale, flag.width * scale, flag.height * scale);
    textFont(font2, 24 * scale);
    fill(0, 255, 255);
    text((int)frameRate + " FPS",  posX + flag.width, posY + 56 * scale);
     text("Push 'b' To Pause",  posX + flag.width * 2.3, posY + 56 * scale);
=======
  
  @Override
  public void draw()
  {
    fill(0, 150);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, 160);
    image(flag, posX + 125 * scale, posY + 56 * scale, flag.width * scale, flag.height * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    noTint();
    fill(0, 255, 255);
    textSize(28);
    textFont(font, 28 * scale);
<<<<<<< HEAD
    text("Agent Chris", posX + 245 * scale, posY + 96 * scale);
    textFont(font2, 24 * scale);
    text("Kills: " + kills + " (" + ArcticShock.player.streak + " This Life)", posX + 120 * scale, posY + (66 + 80) * scale);
    text("Deaths: " + ArcticShock.player.deaths, posX + 120 * scale, posY + (66 + 110) * scale);
    text("Remaining Enemies: " + (ArcticShock.enemies.size() - kills), posX + 120 * scale, posY + (66 + 140) * scale);
    text("Location: " + "St. Derpington Mountains", posX + 120 * scale, posY + (66 + 170) * scale);
    noStroke();
=======
    text("Player Name", posX + 245 * scale, posY + 96 * scale);
    textFont(font2, 24 * scale);
    text("Kills: " + "98", posX + 120 * scale, posY + (66 + 80) * scale);
    text("Deaths: " + "99", posX + 120 * scale, posY + (66 + 110) * scale);
    text("Money: " + "$84.00", posX + 120 * scale, posY + (66 + 140) * scale);
    text("Level: " + "Derpington Mountains", posX + 120 * scale, posY + (66 + 170) * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD
    ellipse(posX, posY, (background.width/4) * scale, (background.height/4) * scale);
=======
    ellipse(posX, posY, (background.width/4) * scale , (background.height/4) * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD
    stroke(0, 150, 255, 200);
    line(posX, posY, posX + cos(radians(rev)) * rad * scale, posY + sin(radians(rev)) * rad * scale);
    strokeWeight(1);
    noStroke();
    imageMode(CENTER);
    //image(background, posX, posY, (background.width/4) * scale, (background.height/4) * scale);
    imageMode(CORNER);
     noFill();
  stroke(0, 150, 255);
  strokeWeight(4);
  ellipse(posX, posY, (background.width/4) * scale, (background.height/4) * scale);
  strokeWeight(1);
  noStroke();
    if (rev < 360)
    {
      rev += 4;
    } else
=======
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
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    {
      rev = 0;
      isPinging = true;
    }
<<<<<<< HEAD

    if (isPinging)
    {
      if (radPing < background.width/4)
        radPing += 4;
      else
      {
        radPing = 0;
        isPinging = false;
      }
    }
  }
 
=======
    
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
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
}


//HUDScoreBoard
//===========================================>>
public class HUDScoreBoard extends HUDElement
{
  PImage flag1, flag2;
  PFont font;
  float scale;
<<<<<<< HEAD

=======
  
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  public HUDScoreBoard(int x, int y, PImage i, PImage f1, PImage f2, PFont f, float scale)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag1 = f1;
    flag2 = f2;
    font = f;
    this.scale = scale;
  }
<<<<<<< HEAD

  public void draw(int alpha)
  {
     fill(0, 150, 255, alpha - 150);
    stroke(0, 150, 255, alpha - 150);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    //tint(255, alpha);
    //image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, alpha);
    image(flag1, posX + 125 * scale, posY + 56 * scale, flag1.width * scale, flag1.height * scale);
    image(flag2, posX + 125 * scale, posY + (56 + flag2.height) * scale, flag2.width * scale, flag2.height * scale);
=======
  
  public void draw(int alpha)
  {
    fill(0, alpha - 150);
    rect(posX + 65 * scale, posY + 16 * scale, 475 * scale, 240 * scale);
    tint(255, alpha);
    image(background, posX, posY, background.width/8 * scale, background.height/8 * scale);
    tint(255, alpha);
    image(flag1, posX + 125 * scale, posY + 54 * scale, flag1.width * scale, flag1.height * scale);
    image(flag2, posX + 125 * scale, posY + (54 + flag2.height - 10) * scale, flag2.width * scale, flag2.height * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    noTint();
    fill(0, 255, 255, alpha);
    textFont(font, 24 * scale);
    text("USA: " + "99" + " Kills", posX + 245 * scale, posY + 96 * scale);
    text("Russia: " + "98" + " Kills", posX + 245 * scale, (posY + 96 + flag2.height/3));
<<<<<<< HEAD
    noStroke();
=======
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
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
<<<<<<< HEAD
    float
    scale;
=======
  float
  scale;
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2

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
<<<<<<< HEAD
    fill(0, 150, 255, 150);
    stroke(0, 150, 255);
    rect(posX + 50 * scale, posY + 16 * scale, 380 * scale, 188 * scale);
    //image(background, posX, posY, (background.width/10) * scale, (background.height/10) * scale);
=======
    fill(0, 150);
    rect(posX + 50 * scale, posY + 16 * scale, 380 * scale, 188 * scale);
    image(background, posX, posY, (background.width/10) * scale, (background.height/10) * scale);
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    fill(#03FCEE);
    textSize(20 * scale);
    text("Plasma Railgun", posX + 100 * scale, posY + 40 * scale);
    image(weapon, posX + 100 * scale, posY + 40 * scale, (weapon.width/4) * scale, (weapon.height/4) * scale);
    fill(0, 200, 255, 100);
<<<<<<< HEAD
    noStroke();
=======
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
    for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + (100 + i) * scale, posY + 130 * scale, 10 * scale, 20 * scale);
      triangle(posX + (100 + i) * scale, posY + 130 * scale, posX + (110 + i) * scale, posY + 130 * scale, posX + (105 + i) * scale, posY + 120 * scale);
    }
<<<<<<< HEAD
    
    /*for (int i = 0; i <= 280; i += 15)
     {
     rect(posX + 100 + i, posY + 160, 10, 20);
     triangle(posX + 100 + i, posY + 160, posX + 110 + i, posY + 160, posX + 105 + i, posY + 150);
     }*/
=======

    /*for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + 100 + i, posY + 160, 10, 20);
      triangle(posX + 100 + i, posY + 160, posX + 110 + i, posY + 160, posX + 105 + i, posY + 150);
    }*/
>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2
  }
}










<<<<<<< HEAD

=======


>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2

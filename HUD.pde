
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
  public HUD(int hp, ArrayList<PImage> images, PFont f1, PFont f2)
  {
    this.hp = hp;
    fade = 0;
    hpBar = new HUDHealthBar(20, 20, images.get(0), 100);
    w = new HUDWeapon(20, height - (height/4), images.get(1), images.get(2));
    r = new HUDRadar(width - (width/10), height - (height/4), images.get(3));
    s = new HUDScoreBoard((width - (width/3)), 20, images.get(1), images.get(4), images.get(5), f1);
    p = new HUDPlayerInfo(20, 110, images.get(1), images.get(4), f1, f2);
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

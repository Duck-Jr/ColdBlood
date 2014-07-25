
public class HUDPlayerInfo extends HUDElement
{
  PImage flag;
  
  PFont font, font2;
  
  public HUDPlayerInfo(int x, int y, PImage i, PImage f, PFont tF, PFont tF2)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag = f;
    font = tF;
    font2 = tF2;
  }
  
  @Override
  public void draw()
  {
    fill(0, 150);
    rect(posX + 65, posY + 16, 475, 240);
    image(background, posX, posY, background.width/8, background.height/8);
    tint(255, 160);
    image(flag, posX + 125, posY + 56, flag.width/4, flag.height/4);
    noTint();
    fill(0, 255, 255);
    textSize(28);
    textFont(font, 28);
    text("Player Name", posX + 245, posY + 96);
    textFont(font2, 24);
    text("Kills: " + "98", posX + 120, posY + 66 + 80);
    text("Deaths: " + "99", posX + 120, posY + 66 + 110);
    text("Money: " + "$84.00", posX + 120, posY + 66 + 140);
    text("Level: " + "Derpington Mountains", posX + 120, posY + 66 + 170);
  }
}

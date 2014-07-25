
public class HUDScoreBoard extends HUDElement
{
  PImage flag1, flag2;
  PFont font;
  public HUDScoreBoard(int x, int y, PImage i, PImage f1, PImage f2, PFont f)
  {
    super(x, y, HUDType.INFO);
    background = i;
    flag1 = f1;
    flag2 = f2;
    font = f;
  }
  
  public void draw(int alpha)
  {
    fill(0, alpha - 150);
    rect(posX + 65, posY + 16, 475, 240);
    tint(255, alpha);
    image(background, posX, posY, background.width/8, background.height/8);
    tint(255, alpha);
    image(flag1, posX + 125, posY + 56, flag1.width/4, flag1.height/4);
    image(flag2, posX + 125, posY + 56 + flag2.height/3, flag2.width/4, flag2.height/4);
    noTint();
    fill(0, 255, 255, alpha);
    textFont(font, 24);
    text("USA: " + "99" + " Kills", posX + 245, posY + 96);
    text("Russia: " + "98" + " Kills", posX + 245, posY + 96 + flag2.height/3);
  }
}



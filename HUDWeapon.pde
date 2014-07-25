public class HUDWeapon extends HUDElement
{
  protected
    PImage
    weapon;

  public HUDWeapon(int x, int y, PImage i, PImage iW)
  {
    super(x, y, HUDType.INFO);
    background = i;
    weapon = iW;
  }

  @Override
    public void draw()
  {
    fill(0, 150);
    rect(posX + 50, posY + 16, 380, 188);
    image(background, posX, posY, background.width/10, background.height/10);
    fill(#03FCEE);
    textSize(20);
    text("Plasma Railgun", posX + 100, posY + 40);
    image(weapon, posX + 100, posY + 40, weapon.width/4, weapon.height/4);
    fill(0, 200, 255, 100);
    for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + 100 + i, posY + 130, 10, 20);
      triangle(posX + 100 + i, posY + 130, posX + 110 + i, posY + 130, posX + 105 + i, posY + 120);
    }

    for (int i = 0; i <= 280; i += 15)
    {
      rect(posX + 100 + i, posY + 160, 10, 20);
      triangle(posX + 100 + i, posY + 160, posX + 110 + i, posY + 160, posX + 105 + i, posY + 150);
    }
  }
}


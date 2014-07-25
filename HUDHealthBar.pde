public class HUDHealthBar extends HUDElement
{
  protected 
    float
    maxHealth, 
  currentHealth;

  int blinker = 0;

  boolean blink = false;

  public HUDHealthBar(int x, int y, PImage i, int maxHealth)
  {
    super(x, y, HUDType.BAR);
    background = i;
    this.maxHealth = maxHealth;
    currentHealth = maxHealth;
  }

  @Override
    public void draw()
  {
    noStroke();
    if (100*(currentHealth/maxHealth) <= 10)
      fill(blinker, 0, 0, 200);
    else
      fill(255 * ((maxHealth - currentHealth)/maxHealth), 255 * (currentHealth/maxHealth), 0, 234);
    rect(posX + 85, posY + 20, 342 * (currentHealth/maxHealth), 38);
    fill(0, 150);
    rect(posX + 85 + (342 * (currentHealth/maxHealth)), posY + 20, 342 * ((maxHealth - currentHealth)/maxHealth), 38);
     image(background, posX, posY, background.width/10, background.height/10);
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

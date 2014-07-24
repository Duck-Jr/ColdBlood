static final float DEGREE = radians(1);

class Soldier {
  int hp, maxHP;
  int ammo, maxAmmo;

  PImage sprite = loadImage("soldier.png");

  float x, y;

  int kills, falls, money;

  Soldier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    imageMode(CENTER);
    image(sprite, x, y);
  }

  void up() {
    y -= 2;
  }

  void down() {
    y += 2;
  }

  void left() {
    x -= 2;
  }

  void right() {
    x += 2;
  }
}


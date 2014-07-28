static final float DEGREE = radians(1);

class Soldier {
  int hp, maxHP;
  int ammo, maxAmmo;

  PImage sprite = loadImage("soldier.png");

  float x, y;
  int direction; // which way to face (UP, DOWN, LEFT, RIGHT)

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
    direction = UP;
  }

  void down() {
    y += 2;
    direction = DOWN;
  }

  void left() {
    x -= 2;
    direction = LEFT;
  }

  void right() {
    x += 2;
    direction = RIGHT;
  }
  
  void shoot() {
    new Bullet(this);
  }
}

class Bullet {
  float x, y;
  int direction; // UP, DOWN, LEFT, RIGHT
  Soldier parent;
  
  Bullet(Soldier s) {
    parent = s;
    x = parent.x;
    y = parent.y;
    direction = parent.direction;
  }
  
  void draw() {
    stroke(51);
    strokeWeight(1);
    line(x, y, x+dx(), y+dy());
  }
  
  void move() {
    x += dx();
    y += dy();
  }
  
  float dx() {
    switch (direction) {
      case LEFT: return -4;
      case RIGHT: return 4;
      default: return 0;
    }
  }
  
  float dy() {
    switch (direction) {
      case UP: return -4;
      case DOWN: return 4;
      default: return 0;
    }
  }
}

class Bullet {
  float x, y;
  float x1, y1;
  int direction; // UP, DOWN, LEFT, RIGHT
  boolean oP;
  boolean isPlayer = false;
  Soldier parent;

  Bullet(Soldier s) 
  {
    parent = s;
    if (parent.isPlayer)
    {
      x = width/2;
      y = height/2;
      isPlayer = true;
    } else
    {
      x = parent.x;
      y = parent.y;
    }
    direction = parent.direction;
    oP = parent.oP;
  }

  void draw() 
  {
    fill(100);
    stroke(0);
    strokeWeight(1);
    if (direction == DOWN || direction == UP)
      line(x - 20, y, x - 20 + dx()/2, y + dy()/2);
    else if (direction == RIGHT)
      line(x + 20, y - 10, x + 20 + dx()/2, y - 10 + dy()/2);
    else
      line(x, y, x + dx()/2, y + dy()/2);
    strokeWeight(1);
  }

  void move() 
  {
  }

  float speed = 20;

  float dx() {
    switch (direction) {
    case LEFT: 
      return -1*speed;
    case RIGHT: 
      return speed;
    default: 
      return 0;
    }
  }

  float dy() {
    switch (direction) {
    case UP: 
      return -1 * speed;
    case DOWN: 
      return speed;
    default: 
      return 0;
    }
  }
}

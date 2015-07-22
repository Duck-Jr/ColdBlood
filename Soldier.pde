class Soldier {
  ArrayList<PImage> sprites;
  int hp, maxHP;
  int ammo, maxAmmo;
  int direction;
  PImage sprite;
  int dmgClock = 0;
  boolean isHurt = false;
  boolean isDead = false;
  boolean isShooting = false;
  int shotClock = 0;
  int kills = 0;
  boolean oP = false;
  boolean isPlayer = false;
  int healClock = 0;
  int deaths = 0;
  int respawnTimer = 0;
  int respawnInv = 0;
  float bodyFade = 0;
  boolean noBody = false;
  boolean inv = false;

  int streak = 0;

  float x, y;


  Soldier(float x, float y, ArrayList<PImage> img, boolean isPlayer)
  {
    this.x = x;
    this.y = y;
    sprites = img;
    direction = UP;
    hp = 100;
    maxHP = hp;
    if (random(10) > 5)
      oP = true;
    this.isPlayer = isPlayer;
  }

  float heading = random(TWO_PI);

  void draw() {
    this.checkForCollision(ArcticShock.shots);
    imageMode(CENTER);
    if (isPlayer)
    {
      //tint(150, 150, 255);
      if (isHurt)
        image(sprites.get(4), width/2, height/2);
      else if (isDead)
      {
        image(sprites.get((int)(5 + random(4))), width/2, height/2);
      } else if (isShooting)
      {
        if (direction == LEFT)
          image(sprites.get(9), width/2, height/2);
        else if (direction == RIGHT)
          image(sprites.get(10), width/2, height/2);
        else if (direction == UP)
          image(sprites.get(11), width/2, height/2);
        else if (direction == DOWN)
          image(sprites.get(12), width/2, height/2);
      } else
      {
        if (direction == LEFT)
          image(sprites.get(0), width/2, height/2);
        else if (direction == RIGHT)
          image(sprites.get(1), width/2, height/2);
        else if (direction == UP)
          image(sprites.get(2), width/2, height/2);
        else if (direction == DOWN)
          image(sprites.get(3), width/2, height/2);
      }
    } 
    
    else

    {
      //tint(255, 150, 150);
      if (isHurt)
        image(sprites.get(4), x, y, sprites.get(4).width/4, sprites.get(4).height/4);
      else if (isDead)
      {
        int r = (int)random(4);
        image(sprites.get((int)(5 + r)), x, y, sprites.get((int)(5 + r)).width/4, sprites.get((int)(5 + r)).height/4);
      } else if (isShooting)
      {
        if (direction == LEFT)
          image(sprites.get(9), x, y, sprites.get(9).width/4, sprites.get(9).height/4);
        else if (direction == RIGHT)
          image(sprites.get(10), x, y, sprites.get(10).width/4, sprites.get(10).height/4);
        else if (direction == UP)
          image(sprites.get(11), x, y, sprites.get(11).width/4, sprites.get(11).height/4);
        else if (direction == DOWN)
          image(sprites.get(12), x, y, sprites.get(12).width/4, sprites.get(12).height/4);
      } else
      {
        if (direction == LEFT)
          image(sprites.get(0), x, y, sprites.get(0).width/4, sprites.get(0).height/4);
        else if (direction == RIGHT)
          image(sprites.get(1), x, y, sprites.get(1).width/4, sprites.get(1).height/4);
        else if (direction == UP)
          image(sprites.get(2), x, y, sprites.get(2).width/4, sprites.get(2).height/4);
        else if (direction == DOWN)
          image(sprites.get(3), x, y, sprites.get(3).width/4, sprites.get(3).height/4);
      }
    }
    imageMode(CORNER);

    if (!isPlayer)
    {
      up(sin(heading));
      right(cos(heading));
      heading += random(radians(-10), radians(10));
      heading = heading % TWO_PI;
      direction = RIGHT;
      if (heading >= QUARTER_PI)
        direction = UP;
      if (heading >= HALF_PI + QUARTER_PI)
        direction = LEFT;
      if (heading >= PI + QUARTER_PI)
        direction = DOWN;
      if (random(ArcticShock.enemies.size()) < 10)
      {
        if (dist(this.x, this.y, width/2, height/2) < height/2)
          shoot();
      }
      if (dist(this.x, this.y, width/2, height/2) < height && random(50) < 1) 
      {
        heading = atan2(this.y - height/2, width/2 - this.x);
      }
      if (checkForCollisionWithRock(ArcticShock.rocksFTW, cos(heading), sin(heading)))
      {
        heading += PI;
      }
    }
    fill(0, 50);
    //if (!isPlayer)
    //ellipse(x, y, 30, 30);
    //else
    //ellipse(width/2, height/2, 30, 30);
    if (isHurt)
    {
      if (dmgClock < 5)
        dmgClock++;
      else
      {
        dmgClock = 0;
        isHurt = false;
      }
    }

    if (isShooting)
    {
      if (shotClock < 2)
        shotClock++;
      else
      {
        shotClock = 0;
        isShooting = false;
      }
    }

    if (inv)
    {
      if (respawnInv < 100)
        respawnInv++;
      else
      {
        respawnInv = 0;
        inv = false;
      }
    }
    
    if (isDead && !isPlayer)
    {
      if (bodyFade < 255)
        bodyFade++;
      else
      {
        bodyFade = 0;
        noBody = true;
      }
    }


    if (isPlayer)
    {
      if (healClock < 40)
      {
        if (!isHurt)
          healClock++;
      } else
      {
        if (hp < maxHP && !isDead)
          this.heal(1);
        healClock = 0;
      }
    }

    if (isPlayer && isDead)
    {
      if (respawnTimer > 200)
      {
        this.hp = this.maxHP;
        this.isDead = false;
        this.inv = true;
        respawnTimer = 0;
      } else
      {
        respawnTimer++;
      }
    }

    if (hp <= 0)
    {
      if (!isDead && !isPlayer)
      {
        ArcticShock.player.kills++;
        ArcticShock.player.streak++;
      } else if (!isDead && isPlayer)
      {
        deaths++;
        streak = 0;
      }
      isDead = true;
    }
  }

  void hurt(int dmg)
  {
    if (!isDead && hp - dmg >= 0)
    {
      if ( !inv )
      {
        isHurt = true;
        hp -= dmg;
      }
    } else
      hp = 0;
  }

  void heal(int dmg)
  {
    if (hp + dmg <= maxHP)
      hp += dmg;
  }

  void up(float e) {
    if (!isDead)
    {
      if (!checkForCollisionWithRock(ArcticShock.rocksFTW, 0, (int)-e/2))
      {
        y -= e;
        moveMap(0, e);
      }
      direction = UP;
    }
  }

  void down(float e) {
    if (!isDead)
    {
      if (!checkForCollisionWithRock(ArcticShock.rocksFTW, 0, (int)e/2))
      {
        y += e;
        moveMap(0, -e);
      }
      direction = DOWN;
    }
  }

  void left(float e) 
  {
    if (!isDead)
    {
      if (!checkForCollisionWithRock(ArcticShock.rocksFTW, (int)-e/2, 0))
      {
        x -= e;
        moveMap(e, 0);
      }
      direction = LEFT;
    }
  }

  void right(float e) {
    if (!isDead)
    {
      if (!checkForCollisionWithRock(ArcticShock.rocksFTW, (int)e/2, 0))
      {
        x += e;
        moveMap(-e, 0);
      }
      direction = RIGHT;
    }
  }

  void moveMap(float dx, float dy)
  {
    if (isPlayer)
    {
      for (Bullet b : ArcticShock.shots)
      {
        b.x += dx;
        b.y += dy;
      }

      for (Soldier b : ArcticShock.enemies)
      {
        b.x += dx;
        b.y += dy;
      }

      for (Rock b : ArcticShock.rocksFTW)
      {
        b.posX += dx;
        b.posY += dy;
      }
    }
  }

  void shoot() 
  {
    if (!isDead)
    {
      ArcticShock.shots.add(new Bullet(this));
      isShooting = true;
    }
  }

  void checkForCollision(ArrayList<Bullet> bullets)
  {
    for (int i = 0; i < bullets.size (); ) 
    {
      Bullet b = bullets.get(i);
      if (!isPlayer)
      {
        if (dist(this.x, this.y, b.x, b.y) < 30 && !isDead && b.isPlayer != this.isPlayer)
        {
          this.hurt(6);
          bullets.remove(i);
        } else
        {
          i++;
        }
      }
      else
      {
        if (dist(width/2, height/2, b.x, b.y) < 30 && !isDead && b.isPlayer != this.isPlayer)
        {
          this.hurt(4);
          bullets.remove(i);
        } else
        {
          i++;
        }
      }
    }
  }

  //Rock Collision Code //
  boolean checkForCollisionWithRock(ArrayList<Rock> rocksFTW, float moveX, float moveY)
  {
    boolean collide = false;
    for (int i = 0; i < rocksFTW.size (); i++) 
    {
      Rock b = rocksFTW.get(i);
      if (!isPlayer)
      {
        if (dist(this.x + moveX, this.y + moveY, b.posX, b.posY) < rocksFTW.get(i).sizeX /2 + 30)
          collide = true;
      } else
      {
        if (dist(width/2 + moveX, height/2 + moveY, b.posX, b.posY) < rocksFTW.get(i).sizeX /2 + 30)
          collide = true;
      }
    }
    return collide;
  }
}
//
//=======
//static final float DEGREE = radians(1);
//
//class Soldier {
//  int hp, maxHP;
//  int ammo, maxAmmo;
//
//  PImage sprite = loadImage("soldier.png");
//
//  float x, y;
//  int direction; // which way to face (UP, DOWN, LEFT, RIGHT)
//
//  int kills, falls, money;
//
//  Soldier(float x, float y) {
//    this.x = x;
//    this.y = y;
//  }
//
//  void draw() {
//    imageMode(CENTER);
//    image(sprite, x, y);
//  }
//
//  void up() {
//    y -= 2;
//    direction = UP;
//  }
//
//  void down() {
//    y += 2;
//    direction = DOWN;
//  }
//
//  void left() {
//    x -= 2;
//    direction = LEFT;
//  }
//
//  void right() {
//    x += 2;
//    direction = RIGHT;
//  }
//  
//  void shoot() {
//    new Bullet(this);
//  }
//}
//
//class Bullet {
//  float x, y;
//  int direction; // UP, DOWN, LEFT, RIGHT
//  Soldier parent;
//  
//  Bullet(Soldier s) {
//    parent = s;
//    x = parent.x;
//    y = parent.y;
//    direction = parent.direction;
//  }
//  
//  void draw() {
//    stroke(51);
//    strokeWeight(1);
//    line(x, y, x+dx(), y+dy());
//  }
//  
//  void move() {
//    x += dx();
//    y += dy();
//  }
//  
//  float dx() {
//    switch (direction) {
//      case LEFT: return -4;
//      case RIGHT: return 4;
//      default: return 0;
//    }
//  }
//  
//  float dy() {
//    switch (direction) {
//      case UP: return -4;
//      case DOWN: return 4;
//      default: return 0;
//    }
//  }
//}
//>>>>>>> ea8f90f06ae2879ad9919e3394074423824d52a2

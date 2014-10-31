
/*class Grenade {
  float x;
  float y;
  float diameter;
  PImage grenade;
  PImage grenadeexplosion;
  float seconds; 
  float grenadeexplosionseconds;
  float grenadethrowseconds;

  Grenade(float x, float y, float diameter, PImage img) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    grenade = img;
    seconds = 100;
    grenadethrowseconds = 50;
    grenadeexplosion = loadImage("explosion.png");
    grenadeexplosionseconds = 125;
  }
  void draw() {
    grenadethrowseconds--;
    if (grenadethrowseconds >= 0) {
      x = x + 4.5;
    }
    if (seconds >= 0) {
      image(grenade, x, y, diameter, diameter - 10);
    }
    if (explode == true && seconds >= 0) {
      seconds--;
    }

    if (seconds <= 0) {
      explosion();
    }
  }

  void explosion() {
    image(grenadeexplosion, x - 65, y - 65, 200, 200);
    grenadeexplosionseconds--;
    if (grenadeexplosionseconds <= 0) {
      explode = false;
    }
  }
}*/


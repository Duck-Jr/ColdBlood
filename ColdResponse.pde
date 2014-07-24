// ISSUE: whole program running slowly

Soldier p1;

void setup() {
  size(900, 600);
  p1 = new Soldier(width/2, height/2);
}

void draw() {
  background(0);
  // Absolute positioned rectangle for reference
//  fill(255, 224, 128);
//  rect(0, 0, 300, 100);
  p1.draw();
}

void keyPressed() {
  if (altMovement) {
    switch (keyCode) {
      case UP:
        p1.up();
        break;
      case DOWN:
        p1.down();
        break;
      case LEFT:
        p1.left();
        break;
      case RIGHT:
        p1.right();
        break;
    }
  }
  else {
    switch (key) {
      case 'w': case 'W':
        p1.up();
        break;
      case 's': case 'S':
        p1.down();
        break;
      case 'a': case 'A':
        p1.left();
        break;
      case 'd': case 'D':
        p1.right();
        break;
    }
  }
}

//images
PImage titlebackground;
PImage startButton;
PImage controlsButton;
//numbers
float startgamebuttonx, startgamebuttony;
float controlsbuttonx, controlsbuttony;
float s;
float movecontrolswitchx, movecontrolswitchy, moveswitchx;
//booleans
boolean changetoControlsScene;
boolean wasd;
boolean spacebar;
boolean g;
boolean moveswitchright;
boolean dontmoveswitchright;
boolean moveswitchleft;
boolean dontmoveswitchleft;

void setup() {
  size(900, 600);
  //images
  titlebackground = loadImage("coldresponsebackground.png");
  startButton = loadImage("redbutton.png");
  controlsButton = loadImage("greenbutton.png");
  //integer and float values
  s = 60;
  movecontrolswitchx = 350;
  movecontrolswitchy = 150;
  moveswitchx = 350;
  startgamebuttonx = width/2 - 445;
  startgamebuttony = height/2 - 125;
  controlsbuttonx = width/2 + 125;
  controlsbuttony = height/2 + 190;
  //boolean values (true or false)
  changetoControlsScene = false;
  wasd = true;
  spacebar = true;
  g = true;
}

void startgamebutton(float x, float y) {
  image(startButton, x, y, startButton.width/2, startButton.height/2 - 150);
  fill(0);
  textSize(35);
  text("Start", x + 115, y - 20);
}

void controlsbutton(float a, float b) {
  image(controlsButton, a, b, controlsButton.width/2 - 20, controlsButton.height/2 - 50);
  fill(#F77C16);
  textSize(35);
  text("Controls", a + 80, b + 65);
}

void titlescreen() {
  background(255,0,0);
  image(titlebackground, 0, 0, 900, 600);
  startgamebutton(startgamebuttonx, startgamebuttony);
  controlsbutton(controlsbuttonx, controlsbuttony);
}

/////////////////////////////////////////////////

////////////////////////////////////////////////

///////////////////////////////////////////////

/* This is the controls scene. All the code below is
 
 different from the one above. The code above is all 
 
 the code involved with the title screen. */

//move controls switch

void movecontrolswitch(float x, float y, float a) {
  noFill();
  stroke(255);
  rect(x, y, 500, 100);
  line(x + 250, y, 600, 250);
  textSize(30);
  fill(0, 0, 255);
  text("WASD controls", x + 20, y + 60);
  fill(255, 0, 0);
  text("Arrow Keys", x + 290, y + 60);
  fill(255);
  rect(a, y, 250, 100);
  //making switch move whenever WASD or ARROW KEYS are selected
  if (mouseX >= 600 && mouseY <= 250 && mouseX <= 850 && mouseY >= 150 && mousePressed == true && dontmoveswitchright == false) {
    moveswitchright = true;
  } 
  if (mouseX >= 350 && mouseY <= 250 && mouseX <= 600 && mouseY >= 150 && mousePressed == true && dontmoveswitchleft == false) {
    moveswitchleft = true;
  }
}

//shoot controls switch

void shootcontrolswitch() {
  noFill();
  stroke(255);
  rect(350, 300, 500, 100);
  line(600, 300, 600, 400);
  textSize(30);
  fill(0, 0, 255);
  text("Space Bar", 405, 360);
  fill(255, 0, 0);
  text("Mouse Click", 635, 360);
}

void grenadecontrolswitch() {
  noFill();
  stroke(255);
  rect(350, 450, 500, 100);
  line(600, 450, 600, 550);
  textSize(30);
  fill(0, 0, 255);
  text("G Key", 430, 510);
  fill(255, 0, 0);
  text("Enter Key", 655, 510);
}

void controlsscreen() {
  background(0);
  fill(#8688E5);
  textSize(40);
  text("Controls", width/2 - 95, height/2 - 225);
  stroke(255);
  line(0, 100, 900, 100);
  line(300, 100, 300, 600);

  //move control switch attributes
  fill(#EDE651);
  textSize(50);
  text(("Move"), 80, 210);
  movecontrolswitch(movecontrolswitchx, movecontrolswitchy, moveswitchx);
  if (moveswitchright == true) {
    moveswitchx = moveswitchx + 10;
  }
  if (moveswitchx >= 600) {
    moveswitchright = false;
    dontmoveswitchright = true;
    dontmoveswitchleft = false;
  }
  if (moveswitchleft == true) {
    moveswitchx = moveswitchx - 10;
  }
  if (moveswitchx <= 350) {
    moveswitchleft = false;
    dontmoveswitchleft = true;
    dontmoveswitchright = false;
  }

  //shoot control switch attributes

  fill(#EDE651);
  textSize(50);
  text(("Shoot"), 75, 360);
  shootcontrolswitch();
  fill(#EDE651);
  textSize(50);
  text(("Grenade"), 50, 510);
  grenadecontrolswitch();
}

void draw() {
  //the change into the Control Scene
  if (mouseX >= controlsbuttonx && mouseX <= controlsbuttonx + controlsButton.width/2 - 20 && mouseY >= controlsbuttony && mouseY <= controlsbuttony + controlsButton.height/2 - 50 && mousePressed == true) {
    changetoControlsScene = true;
  }

  if (changetoControlsScene == false) {
    titlescreen();
  }

  if (changetoControlsScene == true) {
    controlsscreen();
  }
}


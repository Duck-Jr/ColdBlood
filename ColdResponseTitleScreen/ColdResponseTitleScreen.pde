PImage titlebackground;
PImage startButton;

void setup() {
  size(800, 600);
  titlebackground = loadImage("gun.png");
  startButton = loadImage("redbutton.png");
}

void startgamebutton() {
  image(startButton, width/2 - 145, height/2 + 125, startButton.width/2, startButton.height/2 - 150);
  fill(#E5A056);
  textSize(35);
  text("Start", width/2 - 40, height/2 + 105);
}

void titlescreen() {
  background(#AA1116);
  image(titlebackground, width/2 - 150, height/2 - 175, titlebackground.width/2, titlebackground.height/2);
  startgamebutton();
  fill(#8688E5);
  textSize(40);
  text("Cold Response", width/2 - 140, height/2 - 225);
  
}

void draw() {
  titlescreen();
}


//Imports
import processing.video.*;

//Capture cam;


HUD hud;
static World world;

//images
PImage titlebackground, startButton, controlsButton, bg, derptitle;
//numbers
float startgamebuttonx, startgamebuttony;
float controlsbuttonx, controlsbuttony;

int tempX, tempY;

static ArrayList<Bullet> shots = new ArrayList<Bullet>();
static ArrayList<Soldier> enemies = new ArrayList<Soldier>();
static ArrayList<Rock> rocksFTW = new ArrayList<Rock>();

int hp = 0;
float movecontrolswitchx, movecontrolswitchy, moveswitchx;
float shootcontrolswitchx, shootcontrolswitchy, shootswitchx;
float grenadecontrolswitchx, grenadecontrolswitchy, grenadeswitchx;
//booleans
boolean hpRefilling = false;
boolean hasPlayed = false;
boolean isStarted;
boolean changetoControlsScene;
boolean wasdkeys;
boolean arrowkeys;
boolean spacebar;
boolean mouseclick;
boolean g;
boolean enterkey;
boolean moveswitchright;
boolean dontmoveswitchright;
boolean moveswitchleft;
boolean dontmoveswitchleft;
boolean shootswitchright;
boolean dontshootswitchright;
boolean shootswitchleft;
boolean dontshootswitchleft;
boolean grenadeswitchright;
boolean dontgrenadeswitchright;
boolean grenadeswitchleft;
boolean dontgrenadeswitchleft;
boolean isTabbed = false;

static Soldier player;
ArrayList<PImage> sprites = new ArrayList<PImage>();
ArrayList<PImage> spritesEnemy = new ArrayList<PImage>();

ArrayList<PImage> img = new ArrayList<PImage>();

void setup() {
  size(1280, 720);
  //images
  img.add(loadImage("Graphics/HUD/hpBar.png"));
  img.add(loadImage("Graphics/HUD/infoWindow.png"));
  img.add(loadImage("Graphics/Weapon/railGun.png"));
  img.add(loadImage("Graphics/HUD/radar.png"));
  img.add(loadImage("Graphics/HUD/US.png"));
  img.add(loadImage("Graphics/HUD/RU.png"));
  img.add(loadImage("Graphics/HUD/death.png"));
  img.add(loadImage("Graphics/HUD/immortal.png"));

  bg = loadImage("Graphics/Background/derpington.png");

  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_LEFT.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_RIGHT.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_UP.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DOWN.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_HURT.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DEAD_1.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DEAD_2.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DEAD_3.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DEAD_4.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_LEFT_FIRE.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_RIGHT_FIRE.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_UP_FIRE.png"));
  sprites.add(loadImage("Graphics/Sprite/Player/Soldier_DOWN_FIRE.png"));

  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_LEFT.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_RIGHT.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_UP.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DOWN.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_HURT.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DEAD_1.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DEAD_2.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DEAD_3.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DEAD_4.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_LEFT_FIRE.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_RIGHT_FIRE.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_UP_FIRE.png"));
  spritesEnemy.add(loadImage("Graphics/Sprite/Enemy/Soldier_DOWN_FIRE.png"));
  hud = new HUD(100, img, loadFont("Font/Base02.vlw"), loadFont("Font/Sans.vlw"), 0.8F);
  isStarted = false;
  titlebackground = loadImage("Graphics/Background/bgHomeScreen.png");
  derptitle = loadImage("Graphics/Background/bgHomeScreenDERP.png");
  startButton = loadImage("Graphics/GUI/buttonStart.png");
  controlsButton = loadImage("Graphics/GUI/buttonControls.png");
  movecontrolswitchx = 350;
  movecontrolswitchy = 150;
  moveswitchx = 350;
  shootcontrolswitchx = 350;
  shootcontrolswitchy = 300;
  shootswitchx = 350;
  grenadecontrolswitchx = 350;
  grenadecontrolswitchy = 450;
  grenadeswitchx = 350;

  world = new World(4000, 4000, loadImage("Graphics/Background/frost.png"));
  tempX = width/2;
  tempY = height/2;
  player = new Soldier(tempX, tempY, sprites, true);
  for (int i = 0; i < 180; i++)
    enemies.add(new Soldier(140 + random(world.sizeX - 140), 140 + random(world.sizeY - 140), spritesEnemy, false));
  /*for (int i = 0; i < 20; i++)
   rocksFTW.add(new Rock(random(world.sizeX), random(world.sizeY), 40, 40, loadImage("Graphics/Rock/Rock1.png")));*/

  for (int i = 0; i < world.sizeX; i += 40)
    rocksFTW.add(new Rock(50 + i, 50, 40, 40, loadImage("Graphics/Rock/Rock" + (1 + (int)random(2)) + ".png")));

  for (int i = 0; i < world.sizeX; i += 40)
    rocksFTW.add(new Rock(50 + i, world.sizeY, 40, 40, loadImage("Graphics/Rock/Rock" + (1 + (int)random(2)) + ".png")));

  for (int i = 0; i < world.sizeY; i += 40)
    rocksFTW.add(new Rock(40, 50 + i, 40, 40, loadImage("Graphics/Rock/Rock" + (1 + (int)random(2)) + ".png")));

  for (int i = 0; i < world.sizeY; i += 40)
    rocksFTW.add(new Rock(world.sizeX, 50 + i, 40, 40, loadImage("Graphics/Rock/Rock" + (1 + (int)random(2)) + ".png")));
  for (int i = 0; i < 50; i++)
    rocksFTW.add(new Rock( 80 + random(world.sizeX) - 80, 80 + random(world.sizeY) - 80, 40, 40, loadImage("Graphics/Rock/Rock3.png")));
  //integer and float values
  movecontrolswitchx = 350;
  movecontrolswitchy = 150;
  moveswitchx = 350;
  startgamebuttonx = width/2 - width/3 - 150;
  startgamebuttony = height/2;
  controlsbuttonx = width/2 + width/3 - 150;
  controlsbuttony = height/2;
  //boolean values (true or false)
  changetoControlsScene = false;
  wasdkeys = true;
  spacebar = true;
  g = true;
  //cam = new Capture(this, 320, 240, 30);
  //cam.start();
}

void startgamebutton(float x, float y) 
{
  //imageMode(CENTER);
  image(startButton, x, y, 300, 75);
  imageMode(CORNER);
}

void controlsbutton(float a, float b) {
  //imageMode(CENTER);
  image(controlsButton, a, b, 300, 75);
  imageMode(CORNER);
}

void titlescreen() {
  background(255, 0, 0);
  if(!hasPlayed)
  image(titlebackground, 0, 0, width, height);
  else
  image(derptitle, 0, 0, width, height);
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
  stroke(0);
  rect(x, y, 500, 100);
  line(x + 250, y, 600, 250);
  textSize(30);
  fill(#210550);
  text("WASD controls", x + 20, y + 60);
  fill(#670914);
  text("Arrow Keys", x + 290, y + 60);
  fill(0, 255, 0, 100);
  rect(a, y, 250, 100);
  //making switch move whenever WASD or ARROW KEYS are selected
  if (mouseX >= 600 && mouseY <= 250 && mouseX <= 850 && mouseY >= 150 && mousePressed && !dontmoveswitchright) {
    moveswitchright = true;
    arrowkeys = true;
    wasdkeys = false;
  }
  if (mouseX >= 350 && mouseY <= 250 && mouseX <= 600 && mouseY >= 150 && mousePressed  && !dontmoveswitchleft) {
    moveswitchleft = true;
    arrowkeys = false;
    wasdkeys = true;
  }
}

//shoot controls switch
//////////////////////////////////

///////////////////////////////////

/////////////////////////////////////

void shootcontrolswitch(float sx, float sy, float sa) {
  noFill();
  stroke(0);
  rect(sx, sy, 500, 100);
  line(sx + 250, sy, 600, 400);
  textSize(30);
  fill(#210550);
  text("Space Bar", sx + 65, sy + 60);
  fill(#670914);
  text("Mouse Click", sx + 285, sy + 60);
  fill(0, 255, 0, 100);
  rect(sa, sy, 250, 100);
  if (mouseX >= 600 && mouseY <= 400 && mouseX <= 850 && mouseY >= 300 && mousePressed && !dontshootswitchright) {
    shootswitchright = true;
    mouseclick = true;
    spacebar = false;
  }
  if (mouseX >= 350 && mouseY <= 400 && mouseX <= 600 && mouseY >= 300 && mousePressed && !dontshootswitchleft) {
    shootswitchleft = true;
    mouseclick = false;
    spacebar = true;
  }
}

void mousePressed()
{
  if (mouseclick)
    player.shoot();
}

//grenade controls switch
////////////////////////////////////

//////////////////////////////////////

///////////////////////////////////////

void grenadecontrolswitch(float gx, float gy, float ga) {
  noFill();
  stroke(0);
  rect(gx, gy, 500, 100);
  line(gx + 250, gy, 600, 550);
  textSize(30);
  fill(#210550);
  text("G Key", gx + 80, gy + 60);
  fill(#670914);
  text("Enter Key", gx + 305, gy + 60);
  fill(0, 255, 0, 100);
  rect(ga, gy, 250, 100); 
  if (mouseX >= 600 && mouseY <= 550 && mouseX <= 850 && mouseY >= 450 && mousePressed && !dontgrenadeswitchright) {
    grenadeswitchright = true;
    enterkey = true;
    g = false;
  }
  if (mouseX >= 350 && mouseY <= 550 && mouseX <= 600 && mouseY >= 450 && mousePressed && !dontgrenadeswitchleft) {
    grenadeswitchleft = true;
    enterkey = false;
    g = true;
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
  background(#B6B3BC);
  fill(#0D8B1C);
  textSize(40);
  textAlign(CENTER);
  text("Push 'b' To Go Back", width/2 - 95, height/2 + height/3);
  textAlign(LEFT);
  text("Controls", width/2 - 95, height/2 - height/2.5);
  stroke(0);
  line(0, 100, width, 100);
  line(300, 100, 300, height);

  //move control switch attributes
  fill(#3F4574);
  textSize(50);
  text(("Move"), 80, 210);
  movecontrolswitch(movecontrolswitchx, movecontrolswitchy, moveswitchx);
  if (moveswitchright && dontmoveswitchleft) 
    moveswitchx = moveswitchx + 10;

  if (moveswitchx >= 600) {
    moveswitchright = false;
    dontmoveswitchright = true;
    dontmoveswitchleft = false;
  }
  if (moveswitchleft && dontmoveswitchright) 
    moveswitchx = moveswitchx - 10;

  if (moveswitchx <= 350) {
    moveswitchleft = false;
    dontmoveswitchleft = true;
    dontmoveswitchright = false;
  }

  //shoot control switch attributes

  fill(#3F4574);
  textSize(50);
  text(("Shoot"), 75, 360);
  shootcontrolswitch(shootcontrolswitchx, shootcontrolswitchy, shootswitchx);
  if (shootswitchright && dontshootswitchleft) 
    shootswitchx = shootswitchx + 10;

  if (shootswitchx >= 600) {
    shootswitchright = false;
    dontshootswitchright = true;
    dontshootswitchleft = false;
  }
  if (shootswitchleft && dontshootswitchright) 
    shootswitchx = shootswitchx - 10;

  if (shootswitchx <= 350) {
    shootswitchleft = false;
    dontshootswitchleft = true;
    dontshootswitchright = false;
  }

  //grenade control switch attributes

  fill(#3F4574);
  textSize(50);
  text(("Grenade"), 50, 510);
  grenadecontrolswitch(grenadecontrolswitchx, grenadecontrolswitchy, grenadeswitchx);
  if (grenadeswitchright && dontgrenadeswitchleft) 
    grenadeswitchx = grenadeswitchx + 10;

  if (grenadeswitchx >= 600) {
    grenadeswitchright = false;
    dontgrenadeswitchright = true;
    dontgrenadeswitchleft = false;
  }
  if (grenadeswitchleft && dontgrenadeswitchright) 
    grenadeswitchx = grenadeswitchx - 10;

  if (grenadeswitchx <= 350) {
    grenadeswitchleft = false;
    dontgrenadeswitchleft = true;
    dontgrenadeswitchright = false;
  }
}

void draw() {
  //the change into the Control Scene
  clear();

  if (isStarted)
  {
    hasPlayed = true;
    world.draw((int)player.x, (int)player.y);
    fill(0, 100);
    //ellipse(width/2, height/2, height, height);
    for (int i = 0; i < shots.size (); i++)
    {
      shots.get(i).draw();
      shots.get(i).x += shots.get(i).dx();
      shots.get(i).y += shots.get(i).dy();
    }

    for (int i = 0; i < enemies.size (); i++)
      if (!enemies.get(i).noBody)
      {
        if (enemies.get(i).isDead)
        {
          tint(255, 255 / ((enemies.get(i).bodyFade) / 100));
        }
        enemies.get(i).draw();
        noTint();
      }
      
      player.draw();

    for (int i = 0; i < rocksFTW.size (); i++)
      rocksFTW.get(i).draw();

    hud.draw(player.hp, isTabbed, player.isDead, player.kills);

    for (int i = 0; i < shots.size (); i++)
    {
      if (shots.get(i).x > world.sizeX || shots.get(i).y > world.sizeY || shots.get(i).x < 0 || shots.get(i).y < 0)
        shots.remove(i);
    }
    println(shots.size());
  }

  if (!changetoControlsScene && !isStarted)
    titlescreen();

  if (changetoControlsScene)
  {
    controlsscreen();
    /* if(cam.available()) {
     cam.read();
     }
     image(cam, random(width), random(height));*/
  }
}


public void mouseClicked()
{
  if (mouseX >= controlsbuttonx && mouseX <= controlsbuttonx + 300 && mouseY >= controlsbuttony && mouseY <= controlsbuttony + 75)
    changetoControlsScene = true;

  if (mouseX >= startgamebuttonx && mouseX <= startgamebuttonx + 300 && mouseY >= startgamebuttony && mouseY <= startgamebuttony + 75)
    isStarted = true;
}


public void keyPressed()
{

  if (keyCode == 113)
    save("screenshot" + ".png");
  if (key == 'b' || key == 'B')
  {
    changetoControlsScene = false;
    isStarted = false;
  }

  if (key == TAB)
    isTabbed = !isTabbed;

  if (!arrowkeys)
  {
    //if (player.y > 10)
    //{
    if (key == 'W')
    {
      player.up(6);
    }
    if (key == 'w')
    {
      player.up(6);
    }
    // }

    //if (player.y < world.sizeY)
    //{
    if (key == 'S')
    {
      player.down(6);
    }
    if (key == 's')
    {
      player.down(6);
    }
    // }

    // if (player.x > 10)
    // {
    if (key == 'A')
    {
      player.left(6);
    }
    if (key == 'a')
    {
      player.left(6);
    }
    //}

    //if (player.x < world.sizeX)
    //{
    if (key == 'D')
    {
      player.right(6);
    }
    if (key == 'd')
    {
      player.right(6);
      // }
    }
  } else

  {
    //if (player.y > 10)
    //{
    if (keyCode == UP)
    {
      player.up(6);
    }
    //}

    // if (player.y < world.sizeY - 10)
    // {
    if (keyCode == DOWN)
    {
      player.down(6);
    }
    //}

    // if (player.x > 10)
    // {
    if (keyCode == LEFT)
    {
      player.left(6);
    }
    // }

    // if (player.x < world.sizeX - 10)
    // {
    if (keyCode == RIGHT)
    {
      player.right(6);
    }
    // }
  }

  if (key == ' ' && !mouseclick)
    player.shoot();

  if (key == 'P')
    player.hurt(10);
}


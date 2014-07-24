class Soldier {
  
  // Everything should be read from a JSON save file
  String name;
  PImage sprite;
  boolean enemy; // true if bad guy, false if good guy
  
  final Soldier(String name, String imgfile, boolean isEnemy) {
    this.name = name;
    this.sprite = loadImage(imgfile);
    this.enemy = isEnemy;
    level = 1;
    
  }
  
  int level;
  int hp, maxHP;
  int ammo, maxAmmo;
  int exp;
}

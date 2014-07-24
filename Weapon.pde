abstract class Weapon {
  String name;
  PImage sprite;
  
  // Subclasses should call this
  final Weapon(String name, String imgfile) {
    this.name = name;
    this.sprite = loadImage(imgfile);
  }
  
  // Called whenever a soldier uses his weapon.
  // Can probably be parametrized with an int or something.
  abstract void use();
}

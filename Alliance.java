import processing.core.*;
/**
 * enum for alliances (Blue = NATO, Red = Russia etc.)
 */
public enum Alliance {
  BLUE(loadShape("nato.svg")), RED(loadShape("russia.svg"));
  
  PShape flag;
  
  public Alliance(PShape flag) {
    this.flag = flag;
  }
}

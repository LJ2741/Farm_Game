class WaterCan extends Dragable {
  
  
  WaterCan(int x,int y) {
    super();
    pos = new PVector(x,y);
    drag = false;
    img = loadImage("data/Images/watercan.png");
  }
}

class Hoe extends Dragable {
  

  Hoe(int x,int y) {
    super();
    pos = new PVector(x,y);
    drag = false;
    img = loadImage("data/Images/hoe.png");
  }
}

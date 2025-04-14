class Knife extends Dragable {
  

  Knife(int x,int y) {
    super();
    pos = new PVector(x,y);
    drag = false;
    img = loadImage("data/Images/knife.png");
  }
}

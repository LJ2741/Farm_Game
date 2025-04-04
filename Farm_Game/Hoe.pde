class Hoe extends Tools {
  

  Hoe(int x,int y) {
    super();
    pos = new PVector(x,y);
    drag = false;
    img = loadImage("data/Images/hoe.png");
  }
}

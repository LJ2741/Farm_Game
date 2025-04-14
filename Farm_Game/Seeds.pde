class Seeds extends Dragable {
  
  
  String name = "Seeds";
  Seeds(int x,int y) {
    super();
    pos = new PVector(x,y);
    drag = false;
    img = loadImage("data/Images/seeds.png");
  }
}

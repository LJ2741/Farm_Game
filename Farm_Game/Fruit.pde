class Fruit extends Dragable {

  boolean drag;
  PVector pos;
  PImage img;
  String name;
  Fruit(float x,float y) {
    super();
    img = loadImage("data/Images/fruit.png");
    pos = new PVector(x,y);
    drag = false;
  }
  
  void display() {
    image(img,pos.x,pos.y);
    dragging();
  }
  
  void dragging() {
    if (drag == true) {
      pos = new PVector(mouseX,mouseY);
    }
  }
    
}

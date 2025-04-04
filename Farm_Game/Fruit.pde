class Fruit {

  boolean drag;
  PVector pos;
  PImage img;
  String name;
  Fruit(int x,int y) {
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

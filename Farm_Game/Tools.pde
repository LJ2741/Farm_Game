class Tools {
  
  boolean drag;
  PVector pos;
  PImage img;
  Tools() {
    pos = new PVector(700,700);
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

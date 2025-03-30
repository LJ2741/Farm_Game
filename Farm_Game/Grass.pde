class Grass {
  
  PVector pos;
  PImage img;
  
  Grass(int x,int y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/grass.png");
  }
  
  
  
  void display() {
    image(img,pos.x,pos.y);
  }
}

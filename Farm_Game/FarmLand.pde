class farmland {
  
  
  PVector pos;
  Boolean is_tilled = false,is_watered = false,has_seeds = false,has_fruit = false;
  PImage img;
  
  farmland(float x,float y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/untilled_land.png");
  }
  
  
  void display() {
    progress();
    image(img,pos.x,pos.y);
  }
  
  void progress() {
    if (is_tilled == false) {
      img = loadImage("data/Images/untilled_land.png");
    } else if (is_tilled == true && is_watered == false) {
      img = loadImage("data/Images/tilled_land.png");
    } else if (is_tilled == true && is_watered == true && has_seeds == false) {
      img = loadImage("data/Images/watered_land.png");
    } else if (has_seeds == true && is_tilled == true && is_watered == true) {
      img = loadImage("data/Images/seeded_land.png");
    } else if (has_fruit == true) {
      img = loadImage("data/Images/fruit_land/png");
    }
  }
}

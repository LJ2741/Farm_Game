class farmland {
  
  
  PVector pos;
  Boolean is_tilled = false,is_watered = false,has_seeds = false,has_fruit = false,can_timer = true;
  PImage img;
  int savedTime,totalTime,passedTime;
  farmland(float x,float y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/untilled_land.png");
  }
  
  
  void display() {
    progress();
    bearFruit();
    image(img,pos.x,pos.y);
  }
  
  void progress() {
    if (is_tilled == false) {
      img = loadImage("data/Images/untilled_land.png");
    } else if (is_tilled == true && is_watered == false) {
      img = loadImage("data/Images/tilled_land.png");
    } else if (is_tilled == true && is_watered == true && has_seeds == false) {
      img = loadImage("data/Images/watered_land.png");
    } else if (has_seeds == true && is_tilled == true && is_watered == true && has_fruit == false) {
      img = loadImage("data/Images/seeded_land.png");
      can_timer = false;
    } else if (has_fruit == true) {
      img = loadImage("data/Images/fruit_land.png");
    }
  }
  
  void bearFruit() {
    if (can_timer == true) {
      savedTime = millis();
      totalTime = 7000;
    } else {
      passedTime = millis() - savedTime;
      if (passedTime > totalTime) {
        has_fruit = true;
        can_timer = true;
      }
    }
  }
}

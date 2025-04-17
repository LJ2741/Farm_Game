class farmland {
  
  
  PVector pos;
  Boolean can_timer = true;
  PImage img;
  int savedTime,totalTime,passedTime,age;
  farmland(float x,float y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/untilled_land.png");
    age = 0;
  }
  
  
  void display() {
    progress();
    bearFruit();
    image(img,pos.x,pos.y);
  }
  
  void progress() {
    switch(age) {
      case 0:
        img = loadImage("data/Images/untilled_land.png");
        break;
      case 1:
        img = loadImage("data/Images/tilled_land.png");
        break;
      case 2:
        img = loadImage("data/Images/watered_land.png");
        break;
      case 3:
        img = loadImage("data/Images/seeded_land.png");
        can_timer = false;
        break;
      case 4:
        img = loadImage("data/Images/fruit_land.png");
        break;
    }
    
  }
  
  void bearFruit() {
    if (can_timer == true) {
      savedTime = millis();
      totalTime = 7000;
    } else {
      passedTime = millis() - savedTime;
      if (passedTime > totalTime) {
        age = 4;
        can_timer = true;
      }
    }
  }
  
}

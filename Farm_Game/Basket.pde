class Basket {
  
  
  PVector pos;
  PImage img;
  int max_capacity,capacity,savedTimeSell,totalTimeSell,savedTimeGM,totalTimeGM,bills;
  Basket(int x,int y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/basket.png");
    max_capacity = 5;
    capacity = 0;
    savedTimeSell = millis();
    totalTimeSell = 10000;
    savedTimeGM = millis();
    totalTimeGM = 60000;
  }
  
  
  
  void display() {
    image(img,pos.x,pos.y);
    texts();
    selling();
    goldTimer();
  }
  
  void texts() {
    textAlign(LEFT);
    text(capacity + "/" + max_capacity,pos.x - 30,pos.y - 70);
  }
  
  void selling() {
    if (capacity > 0) {
      int passedTimeS = millis() - savedTimeSell;
      if (passedTimeS > totalTimeSell) {
        capacity -= 1;
        gold += 10;
      }
    } else {
      savedTimeSell = millis();
    }
  }
  
  void goldTimer() {
    int passedTimeG = millis() - savedTimeGM;
    bills = ((totalTimeGM - passedTimeG)/1000);
    if (passedTimeG > totalTimeGM) {
      savedTimeGM = millis();
      gold -= 30;
    }
  }
     
      
      
}

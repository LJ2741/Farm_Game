class Basket {
  
  
  PVector pos;
  PImage img;
  int gold_increase,max_capacity,capacity,savedTimeSell,totalTimeSell,savedTimeGM,totalTimeGM,billsTimer,bills;
  Basket(int x,int y) {
    pos = new PVector(x,y);
    img = loadImage("data/Images/basket.png");
    gold_increase = 10;
    max_capacity = 5;
    bills = 30;
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
    fill(255);
    textSize(45);
    textAlign(LEFT);
    text(capacity + "/" + max_capacity,pos.x - 30,pos.y - 70);
  }
  
  void selling() {
    if (capacity > 0) {
      int passedTimeS = millis() - savedTimeSell;
      if (passedTimeS > totalTimeSell) {
        capacity -= 1;
        gold += gold_increase;
      }
    } else {
      savedTimeSell = millis();
    }
  }
  
  void goldTimer() {
    int passedTimeG = millis() - savedTimeGM;
    billsTimer = ((totalTimeGM - passedTimeG)/1000);
    if (passedTimeG > totalTimeGM) {
      savedTimeGM = millis();
      gold -= bills;
      bills += 10;
    }
  }
     
      
      
}

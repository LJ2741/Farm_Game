class Button {
  
  PVector pos;
  int a = 0,idx,cost;
  Button(int x,int y,int i,int c) {
    pos = new PVector(x,y);
    idx = i;
    cost = c;
  }
  
  void display() {
    fill(a);
    rect(pos.x,pos.y,200,50);
    a = 0;
  }
  
  void displayText(String t) {
    fill(255);
    textAlign(CENTER);
    text(t,pos.x,pos.y + 5);
    text("Cost: " + cost,pos.x,pos.y + 20);
  }
}

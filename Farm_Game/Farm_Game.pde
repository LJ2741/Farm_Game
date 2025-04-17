
int gold = 0;
boolean dragging = false;
Collision col = new Collision();
farmland[][] land;
Grass[][] grass;
Basket basket;
ArrayList<Dragable> drables = new ArrayList<Dragable>();
ArrayList<Fruit> fruits = new ArrayList<Fruit>();

void setup() {
  imageMode(CENTER);
  textSize(50);
  textAlign(LEFT);
  size(800,800);
  background(0);
  land = new farmland[6][4];
  grass = new Grass[7][4];
  basket = new Basket(50,650);
  spawnTiles();
  drables.add(new Hoe(500,700));
  drables.add(new WaterCan(600,700));
  drables.add(new Seeds(500,700));
  drables.add(new Knife(400,700));
  fruits.add(new Fruit(-1000,-1000));
}


void draw() {
  imageMode(CENTER);
  background(0);
  
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
      land[i][y].display();
      Collisions(drables.get(0),drables.get(1),drables.get(2),drables.get(3),land[i][y]);
  }
  }
  
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < grass.length; i++) {
      grass[i][y].display();
      
  }
  }
  
  displayTexts();
  basket.display();
  
  for (int i = 0; i < fruits.size(); i++) {
    fruits.get(i).display();
  }
  
  for (int i = 0; i < drables.size(); i++) {
    drables.get(i).display();
  }
  
  gameOver();
}
  

  
void mouseClicked() {
  if (dragging == false) {
    
    dragCollisions(drables.get(0));
    dragCollisions(drables.get(1));
    dragCollisions(drables.get(2));
    dragCollisions(drables.get(3));
  } else {
    
    dragging = false;
    drables.get(0).drag = false;
    drables.get(1).drag = false;
    drables.get(2).drag = false;
    drables.get(3).drag = false;
     
    for (int i = 0; i < fruits.size(); i++ ) {
      Fruit f = fruits.get(i);
      f.drag = false;
    }
  }
    
    
}
  
   
void dragCollisions(Dragable d) {
  Fruit f = fruits.get(0);
  for (int i = 0; i < fruits.size(); i++) {
    f = fruits.get(i);
  
    if (col.coll(mouseX,mouseY,f.pos.x,f.pos.y,50)) {
      dragging = true;
      f.drag = true;
    } else if (col.coll(mouseX,mouseY,d.pos.x,d.pos.y,50) && dragging == false) {
      dragging = true;
      d.drag = true;
      
    }
  }
  
}
  
void Collisions(Dragable h,Dragable w,Dragable s,Dragable k,farmland l) {
  
  if (col.coll(h.pos.x,h.pos.y,l.pos.x,l.pos.y,25) && l.age == 0 && h.drag == true) {
    l.age = 1;
  }
  
  if (col.coll(w.pos.x,w.pos.y,l.pos.x,l.pos.y,25) && l.age == 1 && w.drag == true) {
    l.age = 2;
  }
  
  if (col.coll(s.pos.x,s.pos.y,l.pos.x,l.pos.y,25) && l.age == 2 && s.drag == true) {
    l.age = 3;
  }
  
  if (col.coll(k.pos.x,k.pos.y,l.pos.x,l.pos.y,25) && l.age == 4 && k.drag == true) {
    l.age = 0;
    addFruit(l);
  }
  
  for (int i = 0; i < fruits.size(); i++) {
    Fruit f = fruits.get(i);
    if (col.coll(f.pos.x,f.pos.y,basket.pos.x,basket.pos.y,30) && (basket.capacity < basket.max_capacity)) {
      fruits.remove(f);
      basket.capacity += 1;
    }
  }
  
  
    
}
  
void spawnTiles() {
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
      land[i][y] = new farmland(i * 128 + 85,y * 128 + 65);
  }
  }
  
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < grass.length; i++) {
      grass[i][y] = new Grass(i * 128,y * 128 + 577);
  }
  }
  
}

void addFruit(farmland l) {
  fruits.add(new Fruit(l.pos.x - 25,l.pos.y - 25));
  fruits.add(new Fruit(l.pos.x + 25,l.pos.y + 25));
}

void displayTexts() {
  textAlign(LEFT);
  text("Gold: " + gold,10,50);
  textAlign(RIGHT);
  text("Bills: " + basket.bills,width - 10,50);
}

void gameOver() {
  if (gold < 0) {
    textAlign(CENTER);
    text("GAME OVER",width/2,height/2);
  }
}

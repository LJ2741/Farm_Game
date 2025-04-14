

boolean dragging = false;
Collision col = new Collision();
farmland[][] land;
Grass[][] grass;
ArrayList<Dragable> drables = new ArrayList<Dragable>();
ArrayList<Fruit> fruits = new ArrayList<Fruit>();

void setup() {
  imageMode(CENTER);
  size(800,800);
  background(0);
  land = new farmland[6][4];
  grass = new Grass[7][4];
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
  
  for (int i = 0; i < fruits.size(); i++) {
    fruits.get(i).display();
  }
  
  for (int i = 0; i < drables.size(); i++) {
    drables.get(i).display();
  }

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
  
    if (col.coll(mouseX,mouseY,f.pos.x,f.pos.y,50) && dragging == false) {
      dragging = true;
      f.drag = true;
    } else if (col.coll(mouseX,mouseY,d.pos.x,d.pos.y,50) && dragging == false) {
      dragging = true;
      d.drag = true;
      
    }
  }
  
}
  
void Collisions(Dragable h,Dragable w,Dragable s,Dragable k,farmland l) {
  
  if (col.coll(h.pos.x,h.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == false && l.is_watered == false && l.has_fruit == false) {
    l.is_tilled = true;
  }
  
  if (col.coll(w.pos.x,w.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == true && l.is_watered == false && l.has_fruit == false) {
    l.is_watered = true;
  }
  
  if (col.coll(s.pos.x,s.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == true && l.is_watered == true && l.has_seeds == false && l.has_fruit == false) {
    l.has_seeds = true;
  }
  
  if (col.coll(k.pos.x,k.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == true && l.is_watered == true && l.has_seeds == true && l.has_fruit == true) {
    l.harvest = true;
    addFruit(l);
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

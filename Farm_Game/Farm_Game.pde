

boolean dragging = false;
Collision col = new Collision();
farmland[][] land;
Grass[][] grass;
Hoe hoe;
WaterCan water;
Seeds seeds;
Knife knife;
ArrayList<Fruit> fruits = new ArrayList<Fruit>();

void setup() {
  imageMode(CENTER);
  size(800,800);
  background(0);
  land = new farmland[6][4];
  grass = new Grass[7][4];
  spawnTiles();
  hoe = new Hoe(700,700);
  water = new WaterCan(700,750);
  seeds = new Seeds(700,650);
  knife = new Knife(700,600);
}


void draw() {
  background(0);
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
      land[i][y].display();
      Collisions(hoe,water,seeds,knife,land[i][y]);
  }
  }
  
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < grass.length; i++) {
      grass[i][y].display();
      
  }
  }
  
  hoe.display();
  water.display();
  seeds.display();
  knife.display();

}
  

  
void mouseClicked() {
  if (dragging == false) {
    dragCollisions(hoe);
    dragCollisions(water);
    dragCollisions(seeds);
    dragCollisions(knife);
  } else {
    dragging = false;
    hoe.drag = false;
    water.drag = false;
    seeds.drag = false;
    knife.drag = false;
    
    
    
  }
  
}

    
void dragCollisions(Tools t) {
  if (col.coll(mouseX,mouseY,t.pos.x,t.pos.y,80) && dragging == false) {
      dragging = true;
      t.drag = true;
  }
}
  
void Collisions(Hoe h,WaterCan w,Seeds s,Knife k,farmland l) {
  
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
    l.has_seeds = true;
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

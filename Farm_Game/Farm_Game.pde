

boolean dragging = false;
Collision col = new Collision();
farmland[][] land;
Grass[][] grass;
Hoe hoe;
WaterCan water;
Seeds seeds;

void setup() {
  imageMode(CENTER);
  size(800,800);
  background(0);
  land = new farmland[6][4];
  grass = new Grass[7][4];
  spawnTiles();
  hoe = new Hoe(700,700);
  water = new WaterCan(700,750);
  seeds = new Seeds(700,630);
}


void draw() {
  background(0);
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
      land[i][y].display();
      Collisions(hoe,water,seeds,land[i][y]);
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
}
  

  
void mouseClicked() {
  if (dragging == false) {
    dragCollisions(hoe);
    dragCollisions(water);
    dragCollisions(seeds);
  } else {
    dragging = false;
    hoe.drag = false;
    water.drag = false;
    seeds.drag = false;
    
  }
}
    
void dragCollisions(Tools t) {
  if (col.coll(mouseX,mouseY,t.pos.x,t.pos.y,50) && dragging == false) {
      dragging = true;
      t.drag = true;
  }
}
  
void Collisions(Hoe h,WaterCan w,Seeds s,farmland l) {
  
  if (col.coll(h.pos.x,h.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == false && l.is_watered == false && l.has_fruit == false) {
    l.is_tilled = true;
  }
  
  if (col.coll(w.pos.x,w.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == true && l.is_watered == false && l.has_fruit == false) {
    l.is_watered = true;
  }
  
  if (col.coll(s.pos.x,s.pos.y,l.pos.x,l.pos.y,25) && l.is_tilled == true && l.is_watered == true && l.has_seeds == false && l.has_fruit == false) {
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



boolean dragging = false;
Collision col = new Collision();
farmland[][] land;
Hoe hoe;

void setup() {
  imageMode(CENTER);
  size(800,800);
  background(0);
  land = new farmland[6][4];
  spawnTiles();
  hoe = new Hoe(700,700);
}


void draw() {
  background(0);
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
    land[i][y].display();
    Collisions(hoe,land[i][y]);
  }
  }
  hoe.display();
  
}
  

  
void mouseClicked() {
  if (dragging == false) {
    dragging = true;
    dragCollisions(hoe);
  } else {
    dragging = false;
    hoe.drag = false;
    
  }
}
    
void dragCollisions(Tools t) {
  if (col.coll(mouseX,mouseY,t.pos.x,t.pos.y,40)) {
      t.drag = true;
  }
}
  
void Collisions(Hoe h,farmland l) {
  if (col.coll(h.pos.x,h.pos.y,l.pos.x,l.pos.y,20) && l.is_tilled == false && l.is_watered == false && l.has_fruit == false) {
    l.is_tilled = true;
  }
  
  if (col.coll(h.pos.x,h.pos.y,l.pos.x,l.pos.y,20) && l.is_tilled == true && l.is_watered == false && l.has_fruit == false) {
    l.is_watered = true;
  }
  
    
}
  
void spawnTiles() {
  for (int y = 0; y < 4; y++) {
  for (int i = 0; i < land.length; i++) {
    land[i][y] = new farmland(i * 128 + 85,y * 128 + 65);
  }
  }
}

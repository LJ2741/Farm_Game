class Collision {
  
  
  
  Collision() {
  }
  
  
  Boolean coll(float a,float b,float c,float d,int num) {
    if (dist(a,b,c,d) < num) {
      return true;
    } else {
      return false;
    }
  }
}
     

class Room {
  boolean[] exits = new boolean[4];
  
  Room() {
     exits[0] = random(1)>0.5;
     exits[1] = random(1)>0.5;
     exits[2] = random(1)>0.5;
     exits[3] = random(1)>0.5;
  }
  
  void render() {
    square(0,0,170);
    square(512-170,0,170);
    square(0,512-170,170);
    square(512-170,512-170,170);
    if(!exits[0]) {
      rect(0,0,512,170); 
    }
    if(!exits[1]) {
      rect(512-170,0,170,512);
    }
    if(!exits[2]) {
      rect(0,512-170,512,170);
    }
    if(!exits[3]) {
      rect(0,0,170,512);
    }
  }
  
  boolean OOB(int x, int y) {
    if(x > 512-170 && y > 512-170)
      return true;
    if(x < 170 && y < 170)
      return true;
    if(x < 170 && y > 512-170)
      return true;
    if(x > 512-170 && y < 170)
      return true;
    if(!exits[0] && y < 170)
      return true;
    if(!exits[1] && x > 512-170)
      return true;
    if(!exits[2] && y > 512-170)
      return true;
    if(!exits[3] && x < 170)
      return true;
     return false; 
  }
  
}

void nextRoom(int gx, int gy,int d) {
  if(grid[gx][gy] != null) {
     room = grid[gx][gy];
     return;
  }
  Room r = new Room();
  if(d == 0)
    r.exits[2] = true;
  if(d == 1)
    r.exits[3] = true;
  if(d == 2)
    r.exits[0] = true;
  if(d == 3)
    r.exits[1] = true;
  if(gy == 0)
    r.exits[0] = false;
  if(gy == 4)
    r.exits[2] = false;
  if(gx == 0)
    r.exits[3] = false;
  if(gx == 4)
    r.exits[1] = false;
  grid[gx][gy] = r;
  room = r;
}

class Room {
  boolean[] exits = new boolean[4];
  
  Room() {
     exits[0] = random(1)>0.3;
     exits[1] = random(1)>0.3;
     exits[2] = random(1)>0.3;
     exits[3] = random(1)>0.3;
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

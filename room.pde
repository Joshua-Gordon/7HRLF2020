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
  if(gy == 0) {
    r.exits[0] = false;
  } else if (grid[gx][gy-1] != null && grid[gx][gy-1].exits[2]) {
     r.exits[0] = true; 
  }
  if(gy == 4) {
    r.exits[2] = false;
  } else if(grid[gx][gy+1] != null && grid[gx][gy+1].exits[0]) {
    r.exits[2] = true; 
  }
  if(gx == 0) {
    r.exits[3] = false;
  } else if (grid[gx-1][gy] != null && grid[gx-1][gy].exits[1]) {
    r.exits[3] = true; 
  }
  if(gx == 4) {
    r.exits[1] = false;
  } else if (grid[gx+1][gy] != null && grid[gx+1][gy].exits[3]) {
    r.exits[1] = true; 
  }
  grid[gx][gy] = r;
  room = r;
}

class Room {
  boolean[] exits = new boolean[4];
  Enemy[] enemies = null;
  
  Room() {
     exits[0] = random(1)>0.3;
     exits[1] = random(1)>0.3;
     exits[2] = random(1)>0.3;
     exits[3] = random(1)>0.3;
     if(random(1) > 0.7){
       enemies = new Enemy[2];
     } else if(random(1) > 0.9) {
       enemies = new Enemy[3]; 
     } else {
       println("no enemies"); 
     }
     if(enemies != null) {
        for(int i = 0; i < enemies.length; ++i) {
           int rx = int(random(512));
           int ry = int(random(512));
           while(sqrt((bbrian.x - rx)*(bbrian.x - rx) + (bbrian.y - ry)*(bbrian.y - ry)) < 200) {  
             rx = int(random(512));
             ry = int(random(512));
           }
           Enemy e = new Enemy(rx,ry);
           enemies[i] = e;
        }
     }
  }
  
  void update() {
    if(enemies != null) {
       for(int i = 0; i < enemies.length; ++i) {
          enemies[i].update(); 
       }
    }
  }
  
  void render() {
    stroke(255,255,255,127);
    fill(255,255,255,127);
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
    if(enemies != null) {
       for(int i = 0; i < enemies.length; ++i) {
          enemies[i].render(); 
       }
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

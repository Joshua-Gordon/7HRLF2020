
Player bbrian = new Player();
Room room = new Room();
Room[][] grid = new Room[5][5];


class Player {
  int x,y;
  int dx,dy;
  boolean moving;
  int direction;
  
  int size;
  
  Player() {
    x = 256;
    y = 256;
    dx = 0;
    dy = 0;
    size = 30;
    direction = 0;
  }
  
  void render() {
    direction %= 4;
    switch(direction) {
       case 0:
         triangle(x-size/2,y+size/2,x+size/2,y+size/2,x,y-size/2);
         break;
       case 1:
         triangle(x+size/2,y,x-size/2,y-size/2,x-size/2,y+size/2);
         break;
       case 2:
         triangle(x-size/2,y-size/2,x+size/2,y-size/2,x,y+size/2);
         break;
       case 3:
         triangle(x-size/2,y,x+size/2,y-size/2,x+size/2,y+size/2);
         break;
    }
  }
  
  void update() {
    if(room.OOB(x+dx,y+dy))
      return;
    x += dx;
    y += dy;
  }
  
}

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

void keyPressed() {
   if(key == 'w') {
     bbrian.direction = 0;
     bbrian.dy = constrain(bbrian.dy-5,-5,5);
   } else if (key == 's') {
     bbrian.direction = 2;
     bbrian.dy = constrain(bbrian.dy+5,-5,5);
   } else if (key == 'd') {
     bbrian.direction = 1;
     bbrian.dx  = constrain(bbrian.dx+5,-5,5);
   } else if(key == 'a') {
     bbrian.direction = 3;
     bbrian.dx = constrain(bbrian.dx-5,-5,5);
   }
}

void keyReleased() {
  if(key == 'w') {
     bbrian.dy += 5;
   } else if (key == 's') {
     bbrian.dy -= 5;
   } else if (key == 'd') {
     bbrian.dx -= 5;
   } else if(key == 'a') {
     bbrian.dx += 5;
   }
}


void setup() {
  size(512,512); 
  noStroke();
  grid[0][0] = room;
}

void draw() {
   clear();
   room.render();
   bbrian.render();
   bbrian.update();
}

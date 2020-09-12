class Player {
  int x,y;
  int dx,dy;
  int gx,gy;
  boolean moving;
  int direction;
  
  int size;
  
  Player() {
    x = 256;
    y = 256;
    dx = 0;
    dy = 0;
    gx = 0;
    gy = 0;
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
    if(x+dx > 512) {
      nextRoom(gx+1,gy,1);
      gx+=1;
      x = 30;
    } else if (x+dx < 0) {
      nextRoom(gx-1,gy,3);
      gx-=1;
      x = 512-30;
    } else if (y+dy > 512) {
      nextRoom(gx,gy+1,2); 
      gy+=1;
      y = 30;
    } else if(y+dy < 0) {
      nextRoom(gx,gy-1,0); 
      gy-=1;
      y = 512-30;
    }
    x += dx;
    y += dy;
  }
  
}

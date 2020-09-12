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
    x += dx;
    y += dy;
  }
  
}

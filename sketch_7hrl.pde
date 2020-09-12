Player bbrian = new Player();
Room room;
Room[][] grid = new Room[5][5];
Stairs stairs = new Stairs();

PImage computer; 

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
  for(int x = 0; x < 5; ++x) {
    for(int y = 0; y < 5; ++y) {
      grid[x][y] = null;
    }
  }
  nextRoom(0,0,3);
  room = grid[0][0];
  computer = loadImage("computer.png");
}

void draw() {
   clear();
   room.render();
   room.update();
   bbrian.render();
   bbrian.update();
   if(stairs.doStairs(bbrian)){
     bbrian = new Player();
     grid = new Room[5][5];
     room = grid[0][0];
   }
}

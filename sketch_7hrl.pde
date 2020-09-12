Player bbrian = new Player();
Room room = new Room();
Room[][] grid = new Room[5][5];

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
  for(int i = 0; i < 5; ++i) {
     for(int j = 0; j < 5; ++j) {
        grid[i][j] = null; 
     }
  }
  nextRoom(0,0,3);
}

void draw() {
   clear();
   room.render();
   bbrian.render();
   bbrian.update();
}

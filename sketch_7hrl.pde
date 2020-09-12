import processing.sound.*;

Player bbrian = new Player();
Room room;
Room[][] grid = new Room[5][5];
Stairs stairs = new Stairs();

int score = 0;

PImage computer, seola, monke, rock, startup; 
SoundFile monkeysound;

boolean dead = false;
int start = 5000;

void keyPressed() {
  if (key == 'w') {
    bbrian.direction = 0;
    bbrian.dy = constrain(bbrian.dy-5, -5, 5);
  } else if (key == 's') {
    bbrian.direction = 2;
    bbrian.dy = constrain(bbrian.dy+5, -5, 5);
  } else if (key == 'd') {
    bbrian.direction = 1;
    bbrian.dx  = constrain(bbrian.dx+5, -5, 5);
  } else if (key == 'a') {
    bbrian.direction = 3;
    bbrian.dx = constrain(bbrian.dx-5, -5, 5);
  } else if (key == 'm') {
    for (int x = 0; x < 5; ++x) {
      for (int y = 0; y < 5; ++y) {
        grid[x][y] = null;
      }
    }
    nextRoom(0, 0, 3);
    room = grid[0][0];
    placeStairs(stairs);
    projectiles = new ArrayList();
    bbrian.gx = 0;
    bbrian.gy = 0;
    bbrian.x = 256;
    bbrian.y = 256;
  }
}

void keyReleased() {
  if (key == 'w') {
    bbrian.dy += 5;
  } else if (key == 's') {
    bbrian.dy -= 5;
  } else if (key == 'd') {
    bbrian.dx -= 5;
  } else if (key == 'a') {
    bbrian.dx += 5;
  }
}

void mousePressed() {
  Projectile p = bbrian.shoot();
  if(p != null)
    projectiles.add(p);
}

ArrayList<Projectile> projectiles;

void setup() {
  size(512, 512); 
  noStroke();
  
  startup = loadImage("angrymonke.png");
  
  
  
  
  for (int x = 0; x < 5; ++x) {
    for (int y = 0; y < 5; ++y) {
      grid[x][y] = null;
    }
  }
  nextRoom(0, 0, 3);
  room = grid[0][0];
  placeStairs(stairs);
  projectiles = new ArrayList();

  computer = loadImage("computer.png");
  monke = loadImage("monke.png");
  seola = loadImage("enemy2.png");
  rock = loadImage("rock.png");
  rock.resize(30, 30);

  monkeysound = new SoundFile(this, "monkey1.mp3");
}

void draw() {
  clear();
  if(start > 0) {
    tint(255,255*start/5000);
     image(startup,0,0);
     start-=100;
     return;
  }
  room.render();
  room.update();
  bbrian.render();
  if (!dead)
    bbrian.update();

  ArrayList<Projectile> toRemove = new ArrayList();
  for (Projectile p : projectiles) {
    p.update();

    if (p.gx == bbrian.gx && p.gy == bbrian.gy) {
      if (room.enemies != null) {
        for (Enemy e: room.enemies) {
          if (e.collide(p)) {
            toRemove.add(p);
          }
        }
      }
      p.render();
    }

    if (p.x < -50 || p.x > width + 50 || p.y < -50 || p.y > height + 50) {
      toRemove.add(p);
    }
  }
  projectiles.removeAll(toRemove);

  if (stairs.doStairs(bbrian)) {
    monkeysound.play();
    bbrian.gx = 0;
    bbrian.gy = 0;
    grid = new Room[5][5];
    for (int x = 0; x < 5; ++x) {
      for (int y = 0; y < 5; ++y) {
        grid[x][y] = null;
      }
    }
    nextRoom(0, 0, 3);
    room = grid[0][0];  
    placeStairs(stairs);
    score++;
  }
  if (stairs.gx == bbrian.gx && stairs.gy == bbrian.gy) {
    stairs.render();
  }
  text("Returned to monkey " + score + " time" + (score==1?"":"s"), 256, 256);
  if (dead) {
    println("YOU ARE DEAD!");
  }
}

class Enemy {
  int x,y;
  
  Enemy(int x, int y) {
     this.x = x;
     this.y = y;
  }

  void render() {
     image(computer,x,y); 
  }
  
  void update() {
    int dx = bbrian.x - x;
    int dy = bbrian.y - y;
    float mag = sqrt(float(dx*dx + dy*dy));
    if(mag < 5)
      dead = true;
    dx /= mag/2;
    dy /= mag/2;
    x += dx;
    y += dy;
    println("moving!");
  }
  
  boolean collide(Projectile p) {
    int dx = p.x - x;
    int dy = p.y - y;
    float mag = sqrt(float(dx*dx + dy*dy));
    if(mag < 25) {
      this.x += 2 * p.dx;
      this.y += 2 * p.dy;
      return true;
    } else {
      return false;
    }
  }
}

class Seola extends Enemy {
  
  Seola(int x, int y) {
    super(x,y); 
  }
  
  void render() {
    image(seola,x,y);
  }
  
  void update() {
    int dx = bbrian.x - x;
    int dy = bbrian.y - y;
    float mag = sqrt(float(dx*dx + dy*dy));
    if(mag < 5)
      dead = true;
    dx /= mag/4;
    dy /= mag/4;
    x += dx;
    y += dy;
    println("moving!");
  }
  
}

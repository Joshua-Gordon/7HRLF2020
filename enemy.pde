class Enemy {
  int x,y;
  
  void render() {
     image(computer,x,y); 
  }
  
  void update() {
    int dx = bbrian.x - x;
    int dy = bbrian.y - y;
    float mag = sqrt(float(dx*dx + dy*dy));
    dx /= mag/5;
    dy /= mag/5;
    x += dx;
    y += dy;
  }
  
}

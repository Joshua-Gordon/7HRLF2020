class Projectile {
  int x,y;
  int dx,dy;
  int gx,gy;

  String asset;

  public Projectile(int x, int y, int dx, int dy, int gx, int gy) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.gx = gx;
    this.gy = gy;
  }
  
  void update() {
    this.x += dx;
    this.y += dy;
  }
  
  void render() {
    image(rock, this.x, this.y);
  }
}

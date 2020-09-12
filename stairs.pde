class Stairs {
	int x,y,gx,gy;

	Stairs(){
		x=256;
		y=256;
    gx=0;
    gy=0;
	}

	Boolean doStairs(Player player){
    println(player.gx,player.gy,player.x,player.y);
    println(this.gx,this.gy,this.x,this.y);
    Boolean hitStairs = (this.gx == player.gx
    && this.gy == player.gy
    && abs(player.x - this.x) < 50
    && abs(player.y - this.y) < 50 );
    println(hitStairs);
    return hitStairs;
  }

  void render() {
     image(monke,x,y);
  }
}

void placeStairs(Stairs s) {
  int direction;
   for(int i = 0; i < 25; ++i) {
      direction = int(random(4));
      while(!room.exits[direction]) {
         direction = int(random(4));
      }
      dir: switch(direction) {
         case 0:
           s.gy -= 1;
           break dir;
         case 1:
           s.gx += 1;
           break dir;
         case 2:
           s.gy += 1;
           break dir;
         case 3:
           s.gx -= 1;
           break dir;
      }
      nextRoom(s.gx,s.gy,direction);
   }
   room = grid[0][0];
}

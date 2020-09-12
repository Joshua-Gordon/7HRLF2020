class Stairs {
	int x,y,gx,gy;

	Stairs(){
		x=356;
		y=256;
		gx=0;
		gy=0;
	}

	Player doStairs(Player player){
    if(this.gx == player.gx 
    && this.gy == player.gy 
    && abs(player.x - this.x) < 50 
    && abs(player.y - this.y) < 50 ){
		  player.x=0;
		  player.y=0;
		  player.dx=0;
		  player.dy=0;
    }
		return player;
	}
}

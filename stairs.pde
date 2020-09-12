class Stairs {
	int x,y,gx,gy;

	Stairs(){
		x=0;
		y=0;
		gx=0;
		gy=0;
	}

	Player doStairs(Player player){
    if(this.gx == player.gx 
    && this.gy == player.gy 
    && abs(player.x - this.x) < 10 
    && abs(player.y - this.y) < 10 ){
		  player.x=0;
		  player.y=0;
		  player.dx=0;
		  player.dy=0;
    }
		return player;
	}
}

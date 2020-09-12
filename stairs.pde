class Stairs {
	int x,y;

	Stairs(){
		x=0;
		y=0;
		gx=0;
		gy=0;
	}

	ResetPlayer(Player p){
		player.x=0;
		player.y=0;
		player.dx=0;
		player.dy=0;
		return player;
	}
}

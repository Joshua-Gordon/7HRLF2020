class Stairs {
	int x,y,gx,gy;

	Stairs(){
		x=256;
		y=256;
		gx=1;
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

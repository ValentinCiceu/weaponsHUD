class TableFront extends GameObjects {
  //this is for the hud (basic)
  color c1 = color(227, 23, 23);
  color c2 = color(52, 180, 59);
  color newc;
  float cspeed;
  float choose;
  float change=0;
  float lineX;
  float lineY;
  float goTo;
  TableFront(float x, float y, float speed) {
    super(x, y, speed);
    cspeed=0.005;
    choose=0.005;
    lineX=pos.x+138;
    goTo=pos.x+(138+155);
  }


  void update() {
    newc=lerpColor(c1, c2, change); //changing the colour of the stars so they twinkle
    change+=cspeed;
    if (change>1) {
      cspeed-=choose;
    } else if (change<0.01) {
      cspeed+=choose;
    }
    
  lineX=lerp(lineX,goTo,0.009);
  if(lineX>=goTo-1){
   goTo=pos.x+138; 
  }
  if(lineX<=pos.x+140){
   goTo=pos.x+(138+155);
  } //might think about using vectors instead for this.
  //change the colour reletive to the mover
  }

  void render() {
    stroke(255); //comment this out, something intersting will happen
    fill(175);
    rect(pos.x, pos.y, width, height);  //main bar

    fill(newc);
    stroke(0); 
    rect(pos.x+138, pos.y+54, 161, 33); //1
    stroke(255);
    for (int i=0; i<16; i++) {
      line(pos.x+(145+(i*10)), pos.y+54, pos.x+(145+(i*10)), pos.y+60);
    }
    fill(0);
    rect(pos.x+505, pos.y+16, 115, 115); //2

    rect(pos.x+664, pos.y+16, 28, 113); //3
  fill(255,0,0);
    rect(lineX,609,6,25);
}
  
}
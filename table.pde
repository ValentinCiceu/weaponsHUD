class TableFront extends GameObjects {
  //this is for the hud (basic)
  color c1 = color(0, 255, 0);//color(227, 23, 23);
  color c2 = color(255, 0, 0);//color(52, 180, 59);
  color newc;

  float lineX;
  float lineY;
  float goTo;
  PVector newPos;
  float meas;
  String[] num={"1", "2", "3", "4", "5", "6", "7", "8", "9", "A","B","C","D","E","F","G"};
  TableFront(float x, float y, float speed) {
    super(x, y, speed);

    lineX=pos.x+138;
    lineY=609;
    goTo=pos.x+(138+155);
    newPos=new PVector(lineX, lineY);
  }


  void update() {
    newc=lerpColor(c1, c2, meas/100000);
    meas=lerp(pos.x+130, pos.x+410, newPos.x);//130 and 400 seems to work
    //changing the colour of the stars so they twinkle
    //might think about using vectors instead for this to get a more smoother movement
    //change the colour reletive to the mover
    newPos.x +=speed;



    if (newPos.x>pos.x+(138+155)) {
      speed=speed*-1;
    }
    if (newPos.x<pos.x+138) {
      speed=speed *-1;
    }
    println(meas/100000);
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
    for(int i=0; i<num.length; i++){
      stroke(0);
      fill(0);
      textSize(8);
      text(num[i],pos.x +(143+(i*10)),pos.y+66);
    }
    fill(0);
    rect(pos.x+505, pos.y+16, 115, 115); //2
    rect(pos.x+664, pos.y+16, 28, 113); //3
    fill(255, 0, 0);
    noStroke();
    //rect(lineX, 609, 6, 25);
    stroke(0);
    fill(0);
    rect(newPos.x, newPos.y, 6, 25);
    line(newPos.x+3, 605, newPos.x+3, 608);
    line(newPos.x+3, 634, newPos.x+3, 636);
  }
}
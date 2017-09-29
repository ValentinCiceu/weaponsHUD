class TableFront extends GameObjects {
  //this is for the hud (basic)
  color c1 = color(0, 255, 0);//color(227, 23, 23);
  color c2 = color(255, 0, 0);//color(52, 180, 59);
  color newc;
  color newcv;

  float vspeed;
  float lineX;
  float lineY;
  float goTo;
  PVector newPos;
  PVector newPosy;
  float meas;
  float measv;
  String[] num={"1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G"};
  TableFront(float x, float y, float speed) {
    super(x, y, speed);

    lineX=pos.x+138;
    lineY=609;
    goTo=pos.x+(138+155);
    newPos=new PVector(lineX, lineY);
    newPosy=new PVector(lineX+527, lineY-40);
    vspeed=this.speed;
  }


  void update() {
    newc=lerpColor(c1, c2, meas/100000);
    newcv=lerpColor(c1, c2, measv/100000);
    meas=lerp(pos.x+130, pos.x+410, newPos.x);//130 and 400 seems to work
    measv=lerp(pos.y+59, height, newPosy.y);
    //changing the colour of the stars so they twinkle
    //might think about using vectors instead for this to get a more smoother movement
    //change the colour reletive to the mover
    newPos.x +=speed;
    newPosy.y +=vspeed;


    //horizontal mover boundaries
    if (newPos.x>pos.x+(138+155)) {
      speed=speed*-1;
    }
    if (newPos.x<pos.x+138) {
      speed=speed *-1;
    }
    println(measv/100000);

    //vertical mover boundaries
    if (newPosy.y<pos.y+16) {
      vspeed=vspeed *-1;
    }
    if (newPosy.y>pos.y+122) {
      vspeed=vspeed*-1;
    }
  }


  void render() {
    stroke(255); //comment this out, something intersting will happen
    fill(175);
    rect(pos.x, pos.y, width, height);  //main bar

    fill(newc);
    stroke(0); 
    rect(pos.x+138, pos.y+54, 162, 33); //1 horizontal bar
    stroke(255);
    for (int i=0; i<16; i++) {
      line(pos.x+(145+(i*10)), pos.y+54, pos.x+(145+(i*10)), pos.y+60);
    }
    for (int i=0; i<num.length; i++) {
      stroke(0);
      fill(0);
      textSize(8);
      text(num[i], pos.x +(143+(i*10)), pos.y+66);
    }
    fill(0);
    stroke(0);
    rect(pos.x+505, pos.y+16, 115, 115); //2
    fill(newcv);
    rect(pos.x+661, pos.y+16, 33, 115); //3 vertical bar
    for (int i=0; i<11; i++) {
      stroke(255);
      line(pos.x+687, pos.y+(23+(i*10)), pos.x+690, pos.y+(23+(i*10)));
      fill(255);
      //textSize(7);
      text(num[i], pos.x+682, pos.y+(26+(i*10)));
    }
    fill(255, 0, 0);
    noStroke();
    //rect(lineX, 609, 6, 25);
    stroke(0);
    fill(0);
    //drawing the horizontal mover
    rect(newPos.x, newPos.y, 6, 25);
    line(newPos.x+3, 605, newPos.x+3, 608);
    line(newPos.x+3, 634, newPos.x+3, 636);
    //drawing the vertical mover
    fill(0);
    rect(newPosy.x+1, newPosy.y, 25, 6); //main bar
    stroke(255);
    line(newPosy.x, newPosy.y+3, newPosy.x-3, newPosy.y+3);//hinge on left
    line(newPosy.x+26, newPosy.y+3, newPosy.x+30, newPosy.y+3);
  }
}
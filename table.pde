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

  //circuit variables
  float cirX, cirY;
  color circuit1 = color(255, 0, 0);
  color circuit2 = color(0, 255, 0);
  color  newCircuit;
  float []circuitRate={0, 0, 0, 0};
  float []circuitSpeed={0.005, 0.01, 0.002, 0.008};
  float circuitChoose;




  TableFront(float x, float y, float speed) {
    super(x, y, speed);

    lineX=pos.x+138;
    lineY=609;
    goTo=pos.x+(138+155);
    newPos=new PVector(lineX, lineY);
    newPosy=new PVector(lineX+527, lineY-40);
    vspeed=this.speed;

    cirX =1150;
    cirY=570;
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
    //println(measv/100000);

    //vertical mover boundaries
    if (newPosy.y<pos.y+16) {
      vspeed=vspeed *-1;
    }
    if (newPosy.y>pos.y+122) {
      vspeed=vspeed*-1;
    }
    /*
    //for the circuit lerp
     newCircuit=lerpColor(circuit1,circuit2,circuitRate);
     circuitRate+=circuitSpeed;
     
     if(circuitRate>=1){
     circuitSpeed-=circuitChoose;
     }
     else if(circuitRate <0){
     circuitSpeed += circuitChoose; 
     }
     */
    //float []circuitSpeed={0.005,0.01,0.002,0.008};

    for (int i=0; i<circuitSpeed.length; i++) {
      circuitRate[i]+=circuitSpeed[i];
      if (circuitRate[i]>1) {
        circuitSpeed[i]=circuitSpeed[i]*-1;
      } else if (circuitRate[i] <0) {
        circuitSpeed[i]=circuitSpeed[i]*-1;
      }
      newCircuit=lerpColor(circuit1, circuit2, circuitRate[i]);
      //println(circuitRate[i]);
    }

    //newCircuit=lerpColor(circuit1,circuit2,circuitRate[i]);
  }


  void render() {
    pushMatrix();
    rectMode(CORNER);
    popMatrix();
    stroke(255); //comment this out, something intersting will happen
    fill(175);
    rect(pos.x, pos.y, width, height);  //main bar

    fill(newc);
    stroke(0); 
    //horizontal bars
    rect(pos.x+138, pos.y+54, 162, 33); //1 horizontal bar
    rect(pos.x+138, pos.y+104, 162, 33);
    rect(pos.x+138, pos.y+10, 162, 33);

    stroke(255);
    //horizontal bars
    for (int i=0; i<16; i++) {
      //for middle bar
      line(pos.x+(145+(i*10)), pos.y+55, pos.x+(145+(i*10)), pos.y+60);
      //for upper bar
      line(pos.x+(145+(i*10)), pos.y+11, pos.x+(145+(i*10)), pos.y+17);
      //for lower bar
      line(pos.x+(145+(i*10)), pos.y+105, pos.x+(145+(i*10)), pos.y+110);
    }
    //thi is for the horixontal bar
    for (int i=0; i<num.length; i++) {
      stroke(0);
      fill(0);
      textSize(8);
      text(num[i], pos.x +(143+(i*10)), pos.y+66);
      //for upper var
      text(num[i], pos.x +(143+(i*10)), pos.y+23);
      //for lower bar
      text(num[i], pos.x +(143+(i*10)), pos.y+116);
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

    rect(newPos.x, newPos.y+-46, 6, 25);
    line(newPos.x+3, 593, newPos.x+3, 589);
    line(newPos.x+3, 560, newPos.x+3, 569);

    rect(newPos.x, newPos.y+49, 6, 25);
    line(newPos.x+3, 654, newPos.x+3, 663);
    line(newPos.x+3, 681, newPos.x+3, 687);


    //drawing the vertical mover
    fill(0);
    rect(newPosy.x+1, newPosy.y, 25, 6); //main bar
    stroke(255);
    line(newPosy.x, newPosy.y+3, newPosy.x-3, newPosy.y+3);//hinge on left
    line(newPosy.x+26, newPosy.y+3, newPosy.x+30, newPosy.y+3);

    //drawing circuit wires for the colour sequence
    //stroke(newCircuit);
    stroke(newCircuit);
    for (int i=0; i<3; i++) {
      //start of colour sequence circuit board
      line(cirX+5+(i*5), cirY, cirX+5+(i*5), cirY+50); //1 

      line(cirX+5+(i*5), cirY+50, cirX+5+(i*5), cirY+100); //2

      line(cirX+20, cirY+5+(i*5), cirX+75, cirY+5+(i*5)); //3

      line(cirX+20, cirY+55+(i*5), cirX+75, cirY+55+(i*5));//4 

      line(cirX+20, cirY+105+(i*5), cirX+75, cirY+105+(i*5));//5

      line(cirX+80+(i*5), cirY+55, cirX+80+(i*5), cirY+105);//6

      line(cirX+80+(i*5), cirY+5, cirX+80+(i*5), cirY+55);//7

      line(cirX+155+(i*5), cirY+55, cirX+155+(i*5), cirY+105);//8

      line(cirX+155+(i*5), cirY+5, cirX+155+(i*5), cirY+55);//9

      line(cirX+80, cirY+5+(i*5), cirX+155, cirY+5+(i*5));//10

      line(cirX+80, cirY+55+(i*5), cirX+155, cirY+55+(i*5));//11

      line(cirX+80, cirY+105+(i*5), cirX+155, cirY+105+(i*5));//12
      //end of colour sequence board
    }
  }
}
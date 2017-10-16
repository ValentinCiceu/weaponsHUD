//this will act like the altiduder for the jet. Must clean the code up though

/*
String[] textUp={"10", "20", "30", "40"};
 int up[]={10, 20, 30, 40};
 float down1=250;
 float down2=200;
 float speed1 = 0.2;
 float speed2 = 0.2;
 void draw() {
 background(175);
 stroke(0,255,0);
 line(200, down2, 300, down2); //line 2
 stroke(255,0,0);
 line(200, down1, 300, down1); //line 1
 down1+=speed1;
 down2+=speed2;
 if(down2>=300){
 down2=200;
 }
 if(down1>=300){
 down1=200;
 }
 }
 */


//do the lerp function for the stroke of the squares, green to red

//the colour sequence method
void sequence() {
  //first square
  fill(c1[0]);
  rect(pointX[0], pointY[0], recWidth, recHeight);

  //second square
  fill(c1[1]);
  rect(pointX[1], pointY[1], recWidth, recHeight);

  //thrid square
  fill(c1[2]);
  rect(pointX[2], pointY[2], recWidth, recHeight);

  //fourth square
  fill(c1[3]);
  rect(pointX[3], pointY[3], recWidth, recHeight);

  //fifth square
  fill(c1[4]);
  rect(pointX[4], pointY[4], recWidth, recHeight);

  //sixth square
  fill(c1[5]);
  rect(pointX[5], pointY[5], recWidth, recHeight);
  
    //seventh square
  fill(c1[6]);
  rect(pointX[6], pointY[6], recWidth, recHeight);

  //eight square
  fill(c1[7]);
  rect(pointX[7], pointY[7], recWidth, recHeight);

  //ninth square
  fill(c1[8]);
  rect(pointX[8], pointY[8], recWidth, recHeight);


  time+=timer;
  if (time>100 && time<150) {
    state[die2[0]] = true; 
    next[die2[0]] = true;
  }
  //////////////////////////////////////////////////////////
  //the die[0] controls the position of the square, i.e. if die2[0] =1
  //then the second swquare wwill colour up as it goes to the 1th posiotion 
  ////////////////////////
  if (time>200 && time <300) {
    c1[die2[0]]=color(255, 0, 0);
    state[die2[0]] = true;
  }
  //change the first colour back to grey (initial)
  if (time>300 && time <310) {

    c1[die2[0]]=color(100, 100, 100);
  }

  //for second block
  if (time > 400 && time<500) {
    c1[die2[1]]=color(255, 0, 0);
    state[die2[1]]=true;
  }
  //reset back to grey
  if (time > 500 && time <510) {
    c1[die2[1]]=color(100, 100, 100);
  }
  /////////////////////////////////////////////
  //for the last block
  if (time>600 && time <700) {
    c1[die2[2]]=color(255, 0, 0);
    state[die2[2]]=true;
  }

  if (time >710 && time <720) {
    c1[die2[2]]=color(100, 100, 100);
  }

  text("Time: " +time, 250, 250);
}

void mousePressed() {
  /////////////////////////////////////////////////////////
  //this is for the colour sequnce controller/mechanic\\///
  /////////////////////////////////////////////////////////
  if (time>700) {

    //this is the controller for the first block
    if (mouseX>pointX[die2[0]] && mouseX<pointX[die2[0]]+recWidth && mouseY >pointY[die2[0]] && mouseY <pointY[die2[0]]+recHeight
      && state[die2[0]]==true && checkMouse==false && counter==0) {
      next[die2[0]]=false;
      next[die2[2]]=false;

      next[die2[1]]=true;

      checkMouse=true;
      counter++;
      println("SUCCESS FOR 1!!!");
      println("Counter: " + counter);
    }

    ///this is the contriller for the second block
    if (mouseX>pointX[die2[1]] && mouseX < pointX[die2[1]] + recWidth && mouseY > pointY[die2[1]] && mouseY<pointY[die2[1]] + recHeight 
      && state[die2[1]] == true && next[die2[1]]==true && counter==1 
      && checkMouse==false ) {

      next[die2[0]]=false;
      next[die2[1]]=false;
      next[die2[2]]=true;
      checkMouse=true;
      counter++;
      println("SUCCES FOR 2!!");
      println("counter: " + counter);
    }
    ///this is the controller for the second block
    if (mouseX>pointX[die2[2]] && mouseX < pointX[die2[2]] + recWidth && mouseY > pointY[die2[2]] && mouseY<pointY[die2[2]] + recHeight
      && state[die2[2]] == true && next[die2[2]]==true && counter ==2 
      && checkMouse==false ) {
      counter++;
      println("SUCCESS3!!!!");
      println("counter: " + counter);
    }
    
    
  }//end of main if statment
  println("WorksP");
}


void mouseReleased() {
  checkMouse=false;
}
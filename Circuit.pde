class Circuit extends GameObjects {
  //float [] points;an array of each point
  float []points= new float[40];
  int y1 = 638, y2 = 653;
  int y1Top = 594, y2Top = 604;
  float [] moveX={138, 145, 153, 155, 162, 165, 172, 175, 182, 185, 192, 195, 202, 205, 212, 215, 222, 225, 232, 235, 242, 245, 252, 255, 262, 265, 272, 275, 282, 285, 292, 295, 299};//33 elements (32 by loop)
  float[] lX1 = {138, 153, 153, 162, 162, 172, 172, 182, 182, 192, 192, 202, 202, 212, 212, 222, 222, 232, 232, 242, 242, 252, 252, 262, 262, 272, 272, 282, 282, 292, 292, 299};//31 elements (30 by loop)
  float[] lX2 = {145, 145, 155, 155, 165, 165, 175, 175, 185, 185, 195, 195, 205, 205, 215, 215, 225, 225, 235, 235, 245, 245, 255, 255, 265, 265, 275, 275, 285, 285, 295, 295}; //31 elements (30 by loop)
  float[] lY = {y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1, y2, y1};

  float[] lY2 = {y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, 
    y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top, y2Top, y1Top};
  //float[] lY = new float[lX1.length];  
  //must decide wheter or not i want to keep this inside an inherited class or not :/
  int next = 1;
  int counter=0;
  int counter2=0;
  int next2 = 1;


  PVector pos2;
  PVector forward2;
  Circuit(float x, float y, float speed , float x2 , float y2 ) {
    super( x, y, speed);
    pos=new PVector(x, y);
    forward = new PVector();
    forward2 = new PVector();
    pos2=new PVector(x2, y2);
    //int next = 1;
  }

  void update() { 
    
    //in order for this to work i need to start at element 1
    /*
    for (int i=1; i<lY.length; i++) {
     if ( i % 2 ==0 && i!=0) {
     lY[i]=654;
     } else {
     lY[i] = 638;
     }
     println("ly:" + lY[i]);
     }
     */
    for (int i=0; i<moveX.length-1; i++) {
      PVector path = new PVector(moveX[counter], lY[counter]);
      forward = PVector.sub(path, pos);
      forward.normalize();
      pos.add(PVector.mult(forward, speed));

      PVector path2 = new PVector(moveX[counter2], lY2[counter2]);
      forward2 = PVector.sub(path2, pos2);
      forward2.normalize();
      pos2.add(PVector.mult(forward2, speed));

      //for the first ai.
      if (dist(path.x, path.y, pos.x, pos.y)<2.5) {
        counter+=next;
      }
      if (counter==moveX.length-1) {
        next=-1;
      }
      if (counter==0) {
        next=1;
      }
      ///for the second ai
      if (dist(path2.x, path2.y, pos2.x, pos2.y)<2.5) {
        counter2+=next2;
      }
      if (counter2==moveX.length-1) {
        next2=-1;
      }
      if (counter2==0) {
        next2=1;
      }
    }

    //ai path finder for the sliders!
  }


  void render() {
    fill(0, 0, 0);
    //draw lines to each slider and get a couple of cirlces to follow the line pattern
    //drw these lines in the table section (not in this class)
    //draw the ai in here! mad a method for the ciruit Ai thingy.
    stroke(0);

    for (int i=0; i<lX1.length; i++) {
      line(lX1[i], 638, lX2[i], 653); 
      line(lX1[i], 594, lX2[i], 604);
      // println("Lx2:" + lX1[i]);
    }


    /*
   line(500,500,600,600);
     line(500,500,600,600);
     */
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 5, 5);
    ellipse(pos2.x, pos2.y, 5, 5);
  }
}
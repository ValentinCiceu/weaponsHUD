class Circuit extends GameObjects {
  //float [] points;an array of each point
  float []points= new float[40];
  float [] moveX={138, 145, 153, 155, 162, 165, 172, 175, 182, 185, 192, 195, 202, 205, 212, 215, 222, 225, 232, 235, 242, 245, 252, 255, 262, 265, 272, 275, 282, 285, 292, 295, 299};//33 elements (32 by loop)
  float[] lX1 = {138, 153, 153, 162, 162, 172, 172, 182, 182, 192, 192, 202, 202, 212, 212, 222, 222, 232, 232, 242, 242, 252, 252, 262, 262, 272, 272, 282, 282, 292, 292, 299};//31 elements (30 by loop)
  float[] lX2 = {145, 145, 155, 155, 165, 165, 175, 175, 185, 185, 195, 195, 205, 205, 215, 215, 225, 225, 235, 235, 245, 245, 255, 255, 265, 265, 275, 275, 285, 285, 295, 295}; //31 elements (30 by loop)
  float[] lY = {638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638,653,638};
  
  //float[] lY = new float[lX1.length];  
  //must decide wheter or not i want to keep this inside an inherited class or not :/
 int next = 1;
 int counter=0;
  Circuit(float x, float y, float speed ) {
    super( x, y, speed);
    pos=new PVector(x, y);
    forward = new PVector();
    
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
    for(int i=0; i<moveX.length-1; i++){
     PVector path = new PVector(moveX[counter] , lY[counter]);
     forward = PVector.sub(path , pos);
     forward.normalize();
     pos.add(PVector.mult(forward,0.08));
     if(dist(path.x, path.y , pos.x , pos.y)<2.5){
      counter+=next; 
     }
     if(counter==moveX.length-1){
      next=-1; 
     }
     if(counter==0){
      next=1; 
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
     // println("Lx2:" + lX1[i]);
    }

    /*
    line(138, 637, 145, 654);
     line(153, 638, 145, 654);
     line(153, 638, 155, 653);
     line(162, 638, 155, 653);
     line(162, 638, 165, 653);
     line(172, 638, 165, 653);
     line(172, 638, 175, 653);
     line(182, 638, 175, 653);
     line(182, 638, 185, 653);
     line(192, 638, 185, 653);
     line(192, 638, 195, 653);
     line(202, 638, 195, 653);
     line(202, 638, 205, 653);
     line(212, 638, 205, 653);
     line(212, 638, 215, 653);
     line(222, 638, 215, 653);
     line(222, 638, 225, 653);
     line(232, 638, 225, 653);
     line(232, 638, 235, 653);
     line(242, 638, 235, 653);
     line(242, 638, 245, 653);
     line(252, 638, 245, 653);
     line(252, 638, 255, 653);
     line(262, 638, 255, 653);
     line(262, 638, 265, 653);
     line(272, 638, 265, 653);
     line(272, 638, 275, 653);
     line(282, 638, 275, 653);
     line(282, 638, 285, 653);
     line(292, 638, 285, 653);
     line(292, 638, 295, 653);
     line(299, 638, 295, 653);
     */
    /*
   line(500,500,600,600);
     line(500,500,600,600);
     */
     fill(255,0,0);
     ellipse(pos.x,pos.y,5,5);
  }
}
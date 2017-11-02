class Aimer extends GameObjects {
  //PVector topL;
  Aimer(float x, float y, float speed) {
    super(x, y, speed); 
    pos = new PVector(x, y);
    forward = new PVector();
    //topL = new PVector(x,y);
  }

  void update() {
    //moving the aimer
    // image(earth,earthX,earthY); //main earth   earthX=width-100; float earthY=0f;
    PVector moveTo = new PVector(earthX+50, earthY+50);
    forward = PVector.sub(moveTo, pos);
    forward.normalize();
    pos.add(PVector.mult(forward, speed));

    if (dist(pos.x, pos.y, moveTo.x, moveTo.y)<10) {
      speed=0;
    }
  }




  void render() {    
    stroke(255, 0, 0); //line aims //primary lines
    line(pos.x, 0, pos.x, pos.y);
    line(0, pos.y, pos.x, pos.y);
    line(pos.x, table.pos.y, pos.x, pos.y);
    line(width, pos.y, pos.x, pos.y);
    //secondary lines
    rect(pos.x+-20, pos.y+-78, 40, 10);
    rect(pos.x+-20, pos.y+-219, 40, 10);
    rect(pos.x+-20, pos.y+84, 40, 10);
    rect(pos.x+-141, pos.y+-20, 10, 40);
    rect(pos.x+-20, pos.y+274, 40, 10);
    rect(pos.x+-432, pos.y+-19, 10, 40);
    for(int i=0; i<10; i++){
     rect(pos.x+(-432 - i*300), pos.y+-19, 10, 40); 
    }
    
    
    rect(pos.x+91, pos.y+-19, 10, 40);
for(int i=0; i<10; i++){
  rect(pos.x+(91 + i*300), pos.y+-19, 10, 40);
}


    fill(255);
    rect(pos.x-50, pos.y-25, 100, 50);
  }
}
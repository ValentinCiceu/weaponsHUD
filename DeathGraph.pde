class DeathGraph extends Graphic {
  int birth;
  int death;
  PVector deathFor;
  PVector deathPos; 
  PVector dPoint;
  PVector point;
  PVector myPos;
  float speedD;

  float dTic;
  float counter;
  float counterTimer = 1.5f;


  int rate = 0;

  boolean ready = false;
  //Graphic(float x, float y,float speed ,float len, float tic)
  DeathGraph(float x, float y, float speed, float len, float tic) {
    super(x, y, speed, len, tic);
    //pos done
    //for done
    deathFor = new PVector();
    myPos = new PVector (0, 0);
    dPoint = new PVector(0, 0);
    dTic = tic;    
    deathPos = new PVector(0, dTic);
    speedD = 1;
    point = new PVector(0, tic);
  }

///this is for the the death graph
  void death() {
   
    textAlign(0, 0);
    PVector goTo = new PVector(point.x, point.y);
    forward = PVector.sub(goTo, myPos);
    forward.normalize();
    myPos.add(PVector.mult(forward, speed));
    deathPos.add(PVector.mult(deathFor, speedD));

    if (dist(myPos.x, myPos.y, point.x, point.y)<5) {
      point.y = random(100, tic);
      speed = random(0.05, 1);
    }

    speedD = speed;
    if (deathPos.y > tic) {
      deathPos.y = tic;
    }

    if (forward.y == -1) {
      println("negative");
      deathFor.y = +1;
    }

    if (forward.y ==1) { //the birth rate graph
      println("positive");
      deathFor.y = -1;
    }

    counter += counterTimer;
    if (counter > 150) {
      counter = 0;
    }

    if (forward.y !=-1 && ready ==false && counter <100) {
      fill(0, 255, 0);
      text("Analyizing", pos.x + 30, pos.y);
    } else if (forward.y == -1) {
      ready=true;
    }

    if (forward.y ==1 && ready ==true) {
      fill(0, 255, 0);
      text("Baby Boom", pos.x + 30, pos.y);
    }

    if (forward.y ==-1 && counter <100 && ready == true) {
      fill(255, 0, 0);
      text("WAR!", pos.x+65, pos.y);
    }
    
   
  } //end of update

void update(){
  death();
}

  void render() {
    stroke(0);
    fill(0, 255, 255);
    rect(pos.x, pos.y+tic, len, -myPos.y);
    stroke(0);
    color c = color(0, 255, 255, 230);
    fill(c);
    rect(pos.x + 100, pos.y + tic, len, -deathPos.y);


    //width line
    stroke(0, 255, 255);
    line(pos.x-10, pos.y, pos.x -10, pos.y+tic);

    //displaying the text
    fill(0, 255, 255);
    text("Birth Rate", pos.x - 10, pos.y + tic + 20);
    text("Death Rate", pos.x + 80, pos.y + tic + 20);

    //numbers along the graph bar measured by months
    //going up in k
    textSize(12);
    for (int i=20; i > 0; i--) {
      text(rate + i * 2 + "m", pos.x - 45, pos.y + tic + 10 - (i*20));
    }

    pushMatrix();
    translate(pos.x - 60, pos.y + tic/2);
    rotate(-HALF_PI); // 4.74
    textAlign(CENTER, CENTER);
    textSize(13);
    text("Population in millions per month", 0, 0);
    popMatrix();
  }//end of render
}
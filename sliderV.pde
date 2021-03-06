//vertical sliders
class SliderV extends Graphic{
  //vertical slider

  SliderV(float x, float y, float speed, float len, float tic) {
    super(x, y, speed, len, tic);
    pos = new PVector(x, y);
    forward = new PVector();
    myPos = new PVector(0, 0);
    point = new PVector(0, tic);
    this.len = len;
    this.tic = tic;
    speed = random(0.05, 5);
  }


  void update() {
    PVector goTo = new PVector(point.x, point.y);
    forward = PVector.sub(goTo, myPos);
    forward.normalize();
    myPos.add(PVector.mult(forward, speed));

    if (dist(myPos.x, myPos.y, point.x, point.y) <5) {
      point.y = random(0, tic);
      speed = random(0.05, 5);
    }
  }
  void test() {
    println("hello i am a test!!!!");
  }  
  void render() {
    //noStroke();
    //horizontal sliders
    stroke(0);
    fill(255);
    rect(pos.x, pos.y, len, tic);
    //filler/slider part
    //noStroke();
    fill(0, 255, 0);
    rect(pos.x, pos.y+tic, len, - myPos.y );
  }
}
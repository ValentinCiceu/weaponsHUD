abstract class Graphic {
  PVector pos;
  PVector forward;
  float len;
  float tic;
  float filler;

  PVector myPos; //position for the slider.
  PVector point;//point to go to
  
  float speed;
  
  Graphic(float x, float y,float speed ,float len, float tic) {

    pos = new PVector(x, y);
    forward = new PVector();
    this.len = len;
    this.tic = tic;
    //this.filler = filler;
    myPos = new PVector(0, 0);
    this.speed = speed;
  }
  //making sure my base classes have these methods
  abstract void update();


  abstract void render();
}
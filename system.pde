class System extends GameObjects {
  //drawing out the stars
  color c1 = color(255, 255, 255);
  color c2 = color(0, 0, 0);
  color newc;
  float change=0;
  float cspeed;
  float choose;
  System(float x, float y, float speed) {
    super(x, y, speed);
    cspeed=random(0.001, 0.0005);
    choose=random(0.0005, 0.001);
  }

  void update() {

    newc=lerpColor(c1, c2, change); //changing the colour of the stars so they twinkle
    change+=cspeed;
    if (change>1) {
      cspeed-=choose;
    } else if (change<0.01) {
      cspeed+=choose;
    }
    //println(newc);
  }

  void render() {
    stroke(newc);
    point(pos.x, pos.y);
  }
}
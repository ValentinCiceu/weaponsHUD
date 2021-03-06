class Slider extends Graphic {
//hori

  Slider(float x, float y, float speed, float len, float tic) {
    //super(x, y, speed);
    //Graphic(float x, float y,float speed ,float len, float tic, float filler) 
    super(x,y,speed,len,tic);
    pos = new PVector(x, y);
    forward = new PVector();
    myPos = new PVector(0, 0);
    point = new PVector(len,0);
    this.len = len;
    this.tic = tic;
    speed = random(0.05 , 5);
  }
  

  void update(){
    PVector goTo = new PVector(point.x,point.y);
    forward = PVector.sub(goTo,myPos);
    forward.normalize();
    myPos.add(PVector.mult(forward , speed));
    
    if(dist(myPos.x, myPos.y , point.x , point.y) <5){
     point.x = random(0,len);
     speed = random(0.05 , 5);
    }

  }
  
  void render(){
    //noStroke();
    //horizontal sliders
    stroke(0);
    fill(255);
    rect(pos.x , pos.y , len, tic);
    //filler/slider part
    //noStroke();
    //stroke(0);
    fill(0,255,0);
    rect(pos.x , pos.y , myPos.x , tic);
    
  }
}
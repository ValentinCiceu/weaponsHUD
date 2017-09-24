

void setup() {
  //fullScreen();
  size(1366,700);
  println("Widht:" + width, "Height: " +height);
  
  for(int i=0; i< 1000; i++){ //draw 1000 stars on the screen.
   sys=new System(random(width),random(height), 0); 
   go.add(sys);
  }
  
}

ArrayList<GameObjects> go=new ArrayList();
System sys;
void draw(){
  background(0);
  for(int i=0; i<go.size(); i++){ //this will loop the update and render of GameObjects
   GameObjects g=go.get(i);
    g.update();
    g.render();
   
  }
  sys.update();
  sys.render();
  
}
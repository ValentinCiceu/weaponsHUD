

void setup() {
  //fullScreen();
  size(1366,700);
  println("Widht:" + width, "Height: " +height);
  
  for(int i=0; i< 1000; i++){ //draw 1000 stars on the screen.
   sys=new System(random(width),random(height), 0); 
   go.add(sys);
  }
  table=new TableFront(0,height-150,1); //adding the front table
  go.add(table);
  cannon=new Cannon(0,0,0); //adding the gun
  go.add(cannon);
  
  for(int i=0; i<3; i++){
   println("die2:  " + die2[i]);  //this will print out the 3 dice number
  }
}

ArrayList<GameObjects> go=new ArrayList();
System sys;
TableFront table;
Cannon cannon;
boolean test2=true;

///variables for the colour sequence
boolean[] state = {false,false,false};
float[] pointX={100,250,400}; //these are the x co-ordinates of the rects/squares to choose
color[] c1={color(175,175,175),color(175,175,175),color(175,175,175)}; //for 3 squares (will multiply this to 10 :O
float time; //these two variables will control the time of the sequence of when choosing the colours
float timer=1.5f;
boolean[] next={false,false,false};
int counter=0;
int[] die2={(int)random(0,3),(int)random(0,3),(int)random(0,3)}; //initialising the 3 die numbers to random between 0,3
boolean checkMouse=false;//this will check if the mouse is pressed or released 
color bac=color(120,120,120);//this will change the background colour
boolean[] test={false,false,false}; //doesnt look like it will be used


void draw(){
  background(0);
  for(int i=0; i<go.size(); i++){ //this will loop the update and render of GameObjects
   GameObjects g=go.get(i);
    g.update();
    g.render();
  }
  

}



void mousePressed(){
  
  
}


void mouseReleased(){
  checkMouse=false;
  println("checkMouse" + checkMouse);
  
}
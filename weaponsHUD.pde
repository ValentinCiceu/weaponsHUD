
PImage earth;
PImage earthR;
//add an array for PImage to do an explosion animation
void setup() {
  //fullScreen();
  size(1366,700);
  
  earth = loadImage("earth.png");
  earthR = loadImage("digitEarth.png");
  
  println("Widht:" + width, "Height: " +height);
  
  for(int i=0; i< 1500; i++){ //draw 1000 stars on the screen.
   sys=new System(random(width),random(height), 0); 
   go.add(sys);
  }
  table=new TableFront(0,height-150,1); //adding the front table
  go.add(table);
  cannon=new Cannon(0,0,0); //adding the gun
  go.add(cannon);
  circuit = new Circuit(50,600,0);
  go.add(circuit);
  
  //this is for the random number generator
  for(int i=0; i<3; i++){
   println("die2:  " + die2[i]);  //this will print out the 3 dice number
  }
  
  //this is for the earth co-ordinates
  earthX=width-100;
  
}

ArrayList<GameObjects> go=new ArrayList();
System sys;
TableFront table;
Cannon cannon;
Circuit circuit;
boolean test2=true;

///variables for the colour sequence\\\\\\\\\\\\\\
boolean[] state = {false,false,false,false,false,false,false,false,false};//only had 3 states false

float[] pointX={1150,1225,1300,1150,1225,1300,1150,1225,1300}; //these are the x co-ordinates of the rects/squares to choose
float[] pointY={570,570,570,620,620,620,670,670,670}; //the first 3 represents the y axis of the forst three blocks, the next 3 is for the next 3 blocks, etc.

color[] c1={color(100,100,100),color(100,100,100),color(100,100,100),color(100,100,100),color(100,100,100),
color(100,100,100),color(100,100,100),color(100,100,100),color(100,100,100)}; //for 3 squares (will multiply this to 10 :O

float time; //these two variables will control the time of the sequence of when choosing the colours

float timer=1.5f;

boolean[] next={false,false,false,false,false,false,false,false,false}; //originally had 3

int counter=0;

int[] die2={(int)random(0,9),(int)random(0,9),(int)random(0,9)}; //initialising the 3 die numbers to random between 0,3

boolean checkMouse=false;//this will check if the mouse is pressed or released 

color bac=color(120,120,120);//this will change the background colour

boolean[] test={false,false,false}; //doesnt look like it will be used

int rectY=570;

int recWidth=20;

int recHeight=20;

float earthX;
float earthY=0f;
//
///end of variables for the colour sequence\\\\\\\\\\\

void draw(){
  background(0);
  for(int i=0; i<go.size(); i++){ //this will loop the update and render of GameObjects
   GameObjects g=go.get(i);
    g.update();
    g.render();
  }
  
  sequence();
  //temp border
  fill(0);
  pushMatrix();
  rectMode(CORNER);
  popMatrix();
  rect(1114,550,14,152);
  image(earth,earthX,earthY); //main earth
  image(earthR,500,562); //eath hud on table
  
  //main laser hits earth
  if(dist(cannon.pos.x+-70, cannon.pos.y+1381,earthX,earthY)<100){
    println("Hit");
  }
  
  //println("The postion of end laser is: ",cannon.pos.x+-70, cannon.pos.y+1381);

}
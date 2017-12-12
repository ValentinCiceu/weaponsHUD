import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
//for the explosion
AudioPlayer explosive;
AudioPlayer section;
AudioPlayer back; //this is the background ambiance
float sound;
float soundRate = 1.5f;
PImage earth;
PImage earthR;
//image sprite sheet for th explosion
PImage[] explosion = new PImage[29];
boolean explode = false;
//add an array for PImage to do an explosion animation

//image for the tie fighter
PImage galactic;

void setup() {
  //fullScreen();
  size(1366, 700);
  //loading the images
  earth = loadImage("earth.png");
  earthR = loadImage("digitEarth.png");
  galactic= loadImage("galactic2.png");

  //loading the sprite sheet 
  for (int i = 1; i<=explosion.length-1; i++) {
    explosion[i]=loadImage("ex"+i+".png"); //loading all the images
  }

  //loading the sounds
  minim =new Minim(this);
  explosive = minim.loadFile("rock_breaking.wav");
  section= minim.loadFile("change.wav");
  back = minim.loadFile("amb.wav");

  println("Widht:" + width, "Height: " +height);

  for (int i=0; i< 1500; i++) { //draw 1000 stars on the screen.
    sys=new System(random(width), random(height), 0); 
    go.add(sys);
  }
  table=new TableFront(0, height-150, 1); //adding the front table
  go.add(table);
  cannon=new Cannon(0, 0, 0); //adding the gun
  go.add(cannon);
  circuit = new Circuit(138, 638, 0.08, 138, 594);
  go.add(circuit);

  /**for the graphs**/

  //the aimer
  aim = new Aimer(width/3, height/3, 5);
  //go.add(aim);


  sliderPie = new SliderV(800, 200, random(0.05, 5), 15, 135);
  //ag = new AllGraph((width/2)-100,10,random(0.005 , 2) , 20 , 400);
  ag = new AllGraph((width/2)+50, height - 150, 1, 20, 400);
  gr.add(ag);
  graph = new DeathGraph((width/2)-100, 10, random(0.5, 4), 20, 140);

  /**********The pie chart***********/
  life = new LifeDesc((width/2), (height/2) - 100, 0, 100);
  //gr.add(life);
  //gr.add(graph);
  //sliderV = new SliderV(200,250,1,10,75);
  //go.add(sliderV);
  // slider = new Slider(200,250,1,100,10);
  //go.add(slider);

  def = new Default((width/2)+155, (height/2) + 280, 1, 100);
  //gr.add(def);
  //this is for the random number generator
  for (int i=0; i<3; i++) {
    println("die2:  " + die2[i]);  //this will print out the 3 dice number
  }

  //this is for the earth co-ordinates
  earthX=width-100;

  //adding multiple horizonatal sliders sliders
  for (int i=0; i< 6; i ++) {
    slider = new Slider(0, (table.pos.y + 10) + (i*10), random(0.05, 5), 135, 10);
    gr.add(slider);
  }

  //adding multiple vertical sliders
  for (int i=0; i< 13; i++) {
    sliderV =  new SliderV(table.pos.x + (i * 10), height - 75, random(0.05, 5), 10, 75);
    gr.add(sliderV);
  }

  //adding the tie fighter
  for (int i=0; i< 2; i++) {
    tie = new Tie(random(width+200, width+800), random(0, table.pos.y - 100), random(-10, -3));
    go.add(tie);
  }
  back.setGain(-10);
  back.loop();
  loadData();
}//end of setup
//all of the classes.
ArrayList<GameObjects> go=new ArrayList<GameObjects>();
ArrayList<Graphic> gr = new ArrayList<Graphic>();
//an arraylist dedicated for the data
ArrayList<Data>data = new ArrayList<Data>();
Data da;
void loadData() {
  Table table = loadTable("cafe.csv", "header"); 
  for (TableRow r : table.rows()) {
    //to retrieve all the data
    da = new Data(r);
    data.add(da);
    //Data d = new Data(r);
    //data.add(d);
    //bug here. added so many objects
    //d.update(); 
    //d.render();
    //println(d);
  }
  da.update(); //adding the object just once
}


//graph stuff
DeathGraph graph;
AllGraph ag;
LifeDesc life;

//object stuff

System sys;
TableFront table;
Cannon cannon;
Circuit circuit;
Aimer aim;
Slider slider;
SliderV sliderPie;
SliderV sliderV;
Default def;
Tie tie;

boolean test2=true;

///variables for the colour sequence\\\\\\\\\\\\\\
boolean[] state = {false, false, false, false, false, false, false, false, false};//only had 3 states false

float[] pointX={1150, 1225, 1300, 1150, 1225, 1300, 1150, 1225, 1300}; //these are the x co-ordinates of the rects/squares to choose
float[] pointY={570, 570, 570, 620, 620, 620, 670, 670, 670}; //the first 3 represents the y axis of the forst three blocks, the next 3 is for the next 3 blocks, etc.

color[] c1={color(100, 100, 100), color(100, 100, 100), color(100, 100, 100), color(100, 100, 100), color(100, 100, 100), 
  color(100, 100, 100), color(100, 100, 100), color(100, 100, 100), color(100, 100, 100)}; //for 3 squares (will multiply this to 10 :O

float time; //these two variables will control the time of the sequence of when choosing the colours

float timer=1.5f;

boolean[] next={false, false, false, false, false, false, false, false, false}; //originally had 3

int counter=0;

int[] die2={(int)random(0, 9), (int)random(0, 9), (int)random(0, 9)}; //initialising the 3 die numbers to random between 0,3

boolean checkMouse=false;//this will check if the mouse is pressed or released 

color bac=color(120, 120, 120);//this will change the background colour

boolean[] test={false, false, false}; //doesnt look like it will be used

int rectY=570;

int recWidth=20;

int recHeight=20;

float earthX;
float earthY=0f;

//
///end of variables for the colour sequence\\\\\\\\\\\


//to load the data for the population



//for the animation
int change = 1;
color white = color(0);
color black = color(0);
color newc;
float rate;

void draw() {

  background(newc);
  newc= lerpColor(white, black, rate);
  if (!explode) {
    image(earth, earthX, earthY); //main earth
    //play the explosion
  }
  //when the fire button is pressed
  if (cannon.triTime >=200 && cannon.fire==true && cannon.inital ==true && mousePressed) {
    explode = true;
  }
  if (explode) {
    if (frameCount%30==0 && change < 28) {
      change++;
      explosive.setGain(-5);
      explosive.play();
    }
    white = color(255);
    image(explosion[change], earthX, earthY, 100, 100);
    rate+=0.005;
  }

  if (change >= 27) {
    change=27;
  }


  for (int i=0; i<go.size(); i++) { //this will loop the update and render of GameObjects
    GameObjects g=go.get(i);
    g.update();
    g.render();
  }

  for (int i =0; i < gr.size(); i++) {
    Graphic graphic = gr.get(i);
    graphic.update();
    graphic.render();
  }

  sequence();



  //temp border
  fill(0);
  pushMatrix();
  rectMode(CORNER);
  popMatrix();
  rect(1114, 550, 14, 152);
  //image(earth,earthX,earthY); //main earth
  if (counter >=3) { //when user succeeds in the sequnce thingy show earth hud
    image(earthR, 500, 562); //eath hud on table
  }
  //main laser hits earth
  if (dist(cannon.pos.x+-70, cannon.pos.y+1381, earthX, earthY)<100) {
    println("Hit");
  }

  //audio controller
  sound+=soundRate;
 // back.setGain(-10);
  if (sound >=0) {

    //back.play();
  }
  if (sound >1000 && sound <1005) {
    //back.rewind();
//sound=0;
  }
}

void keyReleased() {
  if (key >='1' && key <='9') {
    section.rewind();
    section.play();
  }
}

//1708
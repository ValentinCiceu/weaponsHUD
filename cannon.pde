class Cannon extends GameObjects {

  float theta;
  float rotateSpeed;
  float growth, growthSpeed;
  float controlSpeed;
  float y;
  float triTime;
  float triSpeed =0;
  
  boolean fire=false;
  
  boolean inital =false;
  
  boolean destroy =false;
  
  float destroyTime;
  float destroyTimer=0;
  

  Cannon(float x, float y, float speed) {
    super(x, y, speed);
    pos.x=0;
    pos.y=0;
    theta=3.0;
    rotateSpeed=0;
    controlSpeed=1;
    growthSpeed = 1f;
  }

  void update() {
    //this is the charger for the cannon

    if (counter ==3 && theta <4.3) { //when the colour sequnce is a succes you can rotate the cannon, 
      //now add a button to press as well.
      rotateSpeed=0.01;
    }

    theta+=rotateSpeed;
    if (theta >=4.3) {
      rotateSpeed=0;
    }

    if (theta >=4.3 && rotateSpeed ==0) {
      y-=controlSpeed;
      growth+=growthSpeed;
    }

    if (growth >=297) {
      controlSpeed=0;
      growthSpeed=0;
      triSpeed=1.5f;
      inital =true;
    }
    triTime+=triSpeed;


    //println(growth);
    
    if(dist(mouseX,mouseY,table.pos.x+405,table.pos.y+75)<table.buttonR/2){ //inside the fire button
      fire=true;

    }
    
    else{ //outside the fire button
     fire =false; 
    }
    
    if (triTime >=200 && fire==true && inital ==true && mousePressed) {
     destroy =true;
      //println("planet Destroyed");
      destroyTimer=1.5f;
    }
    destroyTime+=destroyTimer;
    
    //println(destroy);
  }//end of update


  void render() {
    if (test2) {///this proves that a global boolean will work in classes.
      rect(pos.x, pos.y, 100, 100);
    }

    pushMatrix();
    //rectMode(CENTER);
    translate(-7, 549); //positioning the cannon'
    //translate(250,250);
    rotate(theta);
    fill(255);
    rect(pos.x, pos.y, 59, 297);
    fill(0);
    rect(pos.x+19, pos.y+0, 21, 297); //filler
    //this will grow/charge the laser
    fill(255);
    rect(pos.x+27, y+297, 5, growth);

    //drawing the tri laser hingy for the cannon (like in the death star)
    stroke(0, 255, 0);
    if (triTime >=150) {

      line(pos.x+59, pos.y+298, pos.x+32, pos.y+362);//left
      }
      
      if (triTime >=100) {
      line(pos.x+30, pos.y+298, pos.x+32, pos.y+362);//middle
      }
      
      if (triTime >=200) {
      line(pos.x+1, pos.y+298, pos.x+32, pos.y+362);//right
        }
        
       if(destroy && destroyTime <300){
          line(pos.x+32, pos.y+362, pos.x+-70, pos.y+1381);//destroy laser
       }
    popMatrix();
    //do the death star laser
  }
}
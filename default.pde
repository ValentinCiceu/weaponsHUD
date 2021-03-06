//this is the default graph
/*it will present a custom made radar with two stages
 1) searching for a planet
 2) once you complete the sequence thingy then a small circle appears on the radar
 representing earth has been found
 */

class Default extends Graphic {

  float diameter;
  float theta;
  float shift =30;// for the rings
  ////used for the line effect of the radar
  float tempTheta; 
  float tempX;
  float tempY;

  //for the lines around the border
  float borderTheta = TWO_PI / 100;
  //for the 8 main points in a unit circle
   int[] values = {0 , 45 , 80 , 135 , 180  , 225 , 270 , 315 };
  float aTheta = TWO_PI/8;

  Default(float x, float y, float speed, float diameter) {
    super(x, y, speed, 0, 0);
    this.diameter = diameter;
    theta = 0;
    tempTheta = theta;
  }

  void update() {
    tempX=pos.x+sin(tempTheta)*diameter/2;
    tempY=pos.y-cos(tempTheta)*diameter/2;
    //to move the lines around
    theta+=0.05;
    tempTheta+=0.05;
  }

  void render() {
    textAlign(CENTER);
    stroke(0, 255, 0);
    noFill();
    //the main circle
    ellipse(pos.x, pos.y, diameter, diameter);

    //the rings for the circle (like in any radar
    for (int i=0; i < 4; i++) {   
      ellipse(pos.x, pos.y, shift +i*30, shift + i * 30 );
    }
    //the multiple following lines
    for (int i=0; i<10; i++) { 
      //pudhiing all the extra lines back a bit and halfing it
      tempX=pos.x+sin(theta +i * 0.05)*diameter/2;
      tempY=pos.y-cos(theta +i * 0.05)*diameter/2;
      line(pos.x, pos.y, tempX, tempY);
    }

    fill(255, 0, 0);
    for (int i=0; i<100; i++) {
      float cx = pos.x + sin(borderTheta * i) *((diameter/2) + 8); //133
      float cy = pos.y - cos(borderTheta * i)* ((diameter/2) + 8);//133
      float cx2 = pos.x + sin(borderTheta * i) *diameter/2;//125
      float cy2 = pos.y - cos(borderTheta * i)* diameter/2;//125
      //ellipse(cx,cy ,10 , 10);
      line(cx, cy, cx2, cy2);
    }


    //the cross airs of 8 main points of a unit circle
    for (int i=0; i<8; i++) {
      float pox = pos.x + sin(aTheta * i ) *diameter/2;//125
      float poy = pos.y - cos(aTheta * i) *diameter/2;//125
      line(pos.x, pos.y, pox, poy);
      fill(255);
      text(values[i], pos.x + sin(aTheta * i ) *(diameter/2), pos.y - cos(aTheta * i) *(diameter/2) );//115 115
    }
   
  }//end of render
}
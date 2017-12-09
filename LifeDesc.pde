class LifeDesc extends Graphic {
  //most populated countries in the world
  //the pie chart will represent the top ten most populated countries in the world
  //info taken from http://www.internetworldstats.com/stats8.htm

  float diameter;
  //to test to see if com can handle big numbers
  //does take a couple of moments to load the calculations onto the pie chart
  //float []data = {1268301605, 1006300297, 282162411, 214090575};//these are the data of creatures living on 
  float []data = {500, 200, 150, 60};
  String[]desc = {"Humans", "Other Sea", "Other Land", "Unkown"};
  //earth. 100 = humans , 30 = other sea creatures , other land creatures , 4 represents
  //Axanar (or other beings)
  color[] multi = {color(255, 0, 0), color(0, 255, 255), color(0, 0, 255), color(255, 255, 0)};

  float time; 
  float timer=1.5f;

  float dtime; 
  float dtimer=1.5f;

  float rateG = 2;
  //this is for the rotating object
  float theta;
  float radius;  
  
  //variables for the population csv files
  String name;
  float population;
  
  LifeDesc(float x, float y, float speed, float diameter) {
    super(x, y, speed, 0, 0);
    this.diameter = diameter;
    //rateG = random(0.5, 2);
  }

  void loadData(){
    
    
    
  }


  void update() {

    //this is the analyzing the earth text
    time+=timer;
    dtime+=dtimer;
    println(time);
    textSize(13);
    //if (time<100) {
    //  //text("Analyzing subject: Earth", pos.x, pos.y);      
    //} else if (time > 150) {
    //  time=0;
    //}

    //if (dtime > 50 ) {
    //  text("Dominant species: Human", pos.x-65, pos.y/2 - 35);
    //}

    //if (dtime > 100) {
    //  text("Advancment : Moderate", pos.x-65, pos.y/2 - 15);
    //}

    //if (dtime > 150) {
    //  text("Behaviour: Aggressive", pos.x-65, pos.y/2 +5);
    //}

    //if (dtime > 200) {
    //  dtime=0;
    //}

    //this is the pie chart
    //convert all numbers to fill the circle, i.e. convert to 360/
    //step 1) calculate the total of the circles
    float total = 0;
    for (int i =0; i<data.length; i++) {
      total = total + data[i];
    }
    //step2) calculate the percentage by dividing each value by the percentage
    for (int i=0; i<data.length; i++) {
      data[i] = data[i] / total; 
      //converting all the data to the it's representing percentage
    }
    //step3) converting to put in range of 360
    for (int i=0; i<data.length; i++) {
      data[i] = data[i] * 360;
    }

    //growing and shrinking data based on the population boom and lost for all creatures
    //data[0]+=rateG;
    if (data[0] > 300) {
      //rateG=-2;//random(-2 , -0.5);
    }
    //if (data[0] < data[0]-200) {
    //  rateG = 2;//random(0.5,2);
    //}
    //println(data[0]);



    //println(data);
    //borrowing a slider from the class
    //sliderPie.update();
    //sliderPie.render();
  }

  void render() {
    float lastAngle =0;
    noStroke();
    for (int i=0; i < data.length; i++) {
      float greenScale = map(i, 0, data.length, 144, 255);//this is just for the colour part
      float blueScale = map(i, 0, data.length, 136, 255);//this is just for the colour part
      fill(0, greenScale, blueScale);
      //fill(multi[i]);
      //pos x , pos ,y size width , size height, start angle , got to this angle
      arc(ag.pos.x+30, ag.pos.y+100, diameter, diameter, lastAngle, lastAngle + radians(data[i]));
      lastAngle += radians(data[i]); //this is for the second angle

      //the key for the pi chart
      rectMode(CENTER);
      //rect(pos.x-250, pos.y  +i*20, 15, 15);
      // text(desc[i], pos.x-235, pos.y +10 +i*20);

      //for the rotating rectangles which is for sytem charaging
      //stroke(0);
      //float cx = pos.x + sin(-theta)*100;
      //float cy = pos.y - cos(-theta)*100;//clockwise rotation

      //float ax = pos.x + sin(theta) * 50;//anti-clockwise rotation
      //float ay = pos.y - cos(theta)*50;

      //pushMatrix();
      //translate(ax, ay);
      //rotate(theta);
      //rect(0, 0, 80, 20);
      //popMatrix();

      //pushMatrix();
      //translate(cx, cy);
      //rotate(-theta);
      //rect(0, 0, 100, 20);
      //popMatrix();
      rectMode(CORNER);
      //theta +=0.05;
    }//end of for loop

    textSize(10);
    if (time<100) {
      text("Analyzing subject: Earth", ag.pos.x+5, ag.pos.y+10);
    } else if (time > 150) {
      time=0;
    }

    if (dtime > 50 ) {
      text("Dominant species: Human", ag.pos.x+5, ag.pos.y+20);
    }

    if (dtime > 100) {
      text("Advancment : Moderate", ag.pos.x+5, ag.pos.y+30);
    }

    if (dtime > 150) {
      text("Behaviour: Aggressive", ag.pos.x+5, ag.pos.y+40);
    }

    if (dtime > 200) {
      dtime=0;
    }


    //fill(255);
    //text(desc[0], ag.pos.x+70, ag.pos.y+100);
    //pushMatrix();
    //translate(ag.pos.x+103, ag.pos.y+75);
    //rotate(-HALF_PI);
    //textSize(10);
    //text(desc[1], 0, 0 );
    //popMatrix();

    //pushMatrix();
    //translate(ag.pos.x+115,ag.pos.y+75);
    //rotate(-QUARTER_PI);
    //textSize(10);
    //text(desc[2], 0, 0 );
    //popMatrix();

    fill(255);
    textSize(10);
    text(desc[0], ag.pos.x+10, ag.pos.y+140);
    text(desc[1], ag.pos.x+10, ag.pos.y+70);
    text(desc[2], ag.pos.x+50, ag.pos.y+85);
    text(desc[3], ag.pos.x+55, ag.pos.y+98);
  }
}
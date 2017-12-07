class LifeDesc extends Graphic {
  float diameter;
  float []data = {400, 120, 75, 30};//these are the data of creatures living on 
  String[]desc = {"Humans" , "Other Sea Creatures" , "Other Land Creatures" , "Unkown"};
  //earth. 100 = humans , 30 = other sea creatures , other land creatures , 4 represents
  //Axanar (or other beings)
  color[] multi = {color(255, 0, 0), color(0, 255, 255), color(0, 0, 255), color(255, 255, 0)};

  float time; 
  float timer=1.5f;

  float dtime; 
  float dtimer=1.5f;
  LifeDesc(float x, float y, float speed, float diameter) {
    super(x, y, speed, 0, 0);
    this.diameter = diameter;
  }

  void update() {

    //this is the analyzing the earth text
    time+=timer;
    dtime+=dtimer;
    textSize(13);
    if (time<100) {
      text("Analyzing subject: Earth", pos.x-65, pos.y/2 -50);
    } else if (time > 150) {
      time=0;
    }

    if (dtime > 50 ) {
      text("Dominant species: Human", pos.x-65, pos.y/2 - 35);
    }

    if (dtime > 100) {
      text("Advancment : Moderate", pos.x-65, pos.y/2 - 15);
    }

    if (dtime > 150) {
      text("Behaviour: Aggressive", pos.x-65, pos.y/2 +5);
    }
    
    if(dtime > 200){
     dtime=0; 
    }

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

    println(data);
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
      arc(pos.x, pos.y, diameter, diameter, lastAngle, lastAngle + radians(data[i]));
      lastAngle += radians(data[i]); //this is for the second angle
      
      //the key for the pi chart
      rect(pos.x-250 , pos.y  +i*20 , 15 ,15);
      text(desc[i] , pos.x-235 , pos.y +10 +i*20);
    }
    
  
  
    
  }
}
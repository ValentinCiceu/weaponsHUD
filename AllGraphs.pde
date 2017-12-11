class AllGraph extends Graphic {

  int change = 0;
  float time;
  float timer = 1.5f;

  //float time2;
  //float timer2 = 1.5f;

  //for the lerp color
  color c1= color(255, 0, 0);
  color c2=color(0, 255, 0);
  color newc;
  float rate;

  /*this class will be responsible fro diplaying all of the graphs and hud stuff on the screen*/
  AllGraph(float x, float y, float speed, float len, float tic) {
    super(x, y, speed, len, tic);
  }



  void update() {
    // graph = new DeathGraph((width/2)-100, 10, random(0.005, 2), 20, 400);
    //graph.update();

    //positioning the graph
    // graph.pos.x = pos.x+65;
    //graph.pos.y = pos.y ;

    //life.update();
    newc = lerpColor(c1, c2, rate);
    rate+=speed;
    if (rate>0.9) {
      speed = -0.005;
    }
    if (rate<0.1) {
      speed = 0.005;
    }
    //statments to switch between the graphs
    if (key=='1') {
      graph.update(); 
      graph.pos.x = pos.x+65;
      graph.pos.y = pos.y ;
      println("1");
    } else if (key=='2') {
      life.update();
      println("2");
    } else if (key=='3') {
      aim.update();
      println("3");
    } else {
      def.update();
      println("No key");
    }

    //to flash the dots at end of first text
    time += timer;
    if (time > 200) {
      time = 0;
    }

    //time2 += timer2; //for the flickering text
    //if(time2>250){
    // time2=0; 
    //}
  }//end of update



  void render() {
    //the screen to display the graphs
    fill(0, 0, 0);
    stroke(100);
    rect(pos.x, pos.y, 200, 150);
    if (key=='1') {
      graph.render();
    } else if (key=='2') {
      life.render();
    } else if (key=='3') {
      aim.render();
      //to display a message on the displayer
      textSize(12);
      textAlign(CENTER);
      fill(newc);
      text("Searching Target", pos.x+100, pos.y + 15);

      if (time > 50) {
        text(".", pos.x+152, pos.y+15);
      }
      if (time > 100) {
        text(".", pos.x+156, pos.y+15);
      }
      if (time>150) {
        text(".", pos.x+160, pos.y+15);
      } 
      if (time>100) {
        text("Press flashing buttons", pos.x + 100, pos.y + 35);
      }
      if (time>150) {
        text("To locate target!", pos.x +100, pos.y + 55);
      }
    } else {
      def.render();
    }

    //println(key);

    //drwaing the squres to represent the modes you can select
    //red means unselected , green means selected
    stroke(0);
    if (key=='1') {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0); //the barchart
    }
    rect(pos.x+205, pos.y+5, 20, 20);
    if (key=='2') {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);//the pie chart
    }
    rect(pos.x+205, pos.y+45, 20, 20);
    if (key=='3') {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(pos.x+205, pos.y+85, 20, 20);
    //fo the default option
    if (key>'3' ) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(pos.x+205, pos.y+125, 20, 20);
  }//end of render
}//end of class
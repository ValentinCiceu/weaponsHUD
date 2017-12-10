class AllGraph extends Graphic {

  int chage = 0;

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

    //statments to switch between the graphs
    if (key=='1') {
      graph.update(); 
      graph.pos.x = pos.x+65;
      graph.pos.y = pos.y ;
    }

    if (key=='2') {
      life.update();
    }
    
    if(key=='3'){
     aim.update(); 
    }
  }//end of update

  void render() {
    //the screen to display the graphs
    fill(0, 0, 0);
    stroke(100);
    rect(pos.x, pos.y, 200, 150);
    if (key=='1') {
      graph.render();
    }
    if (key=='2') {
      life.render();
    }
    
    if(key=='3'){
     aim.render(); 
    }
    //println(key);

    //drwaing the squres to represent the modes you can select
    //red means unselected , green means selected
    stroke(0);
    if(key=='1'){
      fill(0,255,0);
    }else{
    fill(255, 0, 0); //the barchart
    }
    rect(pos.x+205, pos.y+5, 20, 20);
    if(key=='2'){
     fill(0,255,0); 
    }else{
    fill(255, 0, 0);//the pie chart
    }
    rect(pos.x+205, pos.y+45, 20, 20);
    if(key=='3'){
     fill(0,255,0); 
    }else{
    fill(255, 0, 0);//the aimer
    }
    rect(pos.x+205, pos.y+85, 20, 20);
  }//end of render
}//end of class
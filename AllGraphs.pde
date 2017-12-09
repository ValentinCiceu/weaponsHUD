class AllGraph extends Graphic {

/*this class will be responsible fro diplaying all of the graphs and hud stuff on the screen*/
  AllGraph(float x, float y, float speed, float len, float tic) {
    super(x, y, speed, len, tic);
  }



  void update() {
   // graph = new DeathGraph((width/2)-100, 10, random(0.005, 2), 20, 400);
    //graph.update();
    
    //positioning the graph
    //graph.pos.x = pos.x+65;
    //graph.pos.y = pos.y ;
  }

  void render() {
    //the screen to display the graphs
    fill(0,0,0);
    stroke(100);
    rect(pos.x , pos.y , 200,150);
    //graph.render();
    
  }
}
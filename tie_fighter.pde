
class Tie extends GameObjects {

  float tieX=random(width, width+5000);
  float tieY=random(0,500);
  //float tieX=450;
  //float tieY=141;
  float tieSpeed=-4;
  //float tieSpeed;
  float tieCollisionX=230;
  float tieCollisionY=141;
  float tieCollisionWidth=20;
  float tieCollisionHeight=82;
  //controllers
  int X=0;
  int s=1;

  float theta;
  float choose;

  Tie(float x , float y , float speed) {
    super(x,y,speed);
   // pos = new PVector(random(width , width + 5000) , random(0,table.pos.y));
    theta=0;
    choose=random(-1, 0);
   
  }

  void update() {
    tieCollisionX+=speed;
    pos.x+=speed;


    ///tie fighter manouvers


    if (pos.y<=-100) {  ///controller
      // pos.x=random(width, width+5000);
      pos.x=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      pos.y=random(0 , table.pos.y-100);
      //pos.y=141;
      speed=random(-10, -3);  //first num was 6
      //speed=-0.5;
      choose=random(-5, 0);
    }


    if (pos.y>height+100) { //controller 
      // pos.x=random(width, width+5000);
      pos.x=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      pos.y=random(0 , table.pos.y-100);
      //pos.y=141;
      speed=random(-10, -3);  //first num was 6
      //speed=-0.5;
      choose=random(-5, 0);
    }

    if (pos.x<=width/3.5) {

      pos.y=(pos.y+(choose)*cos(theta));
    }



    //Tie controller
    if (pos.x<=-50) { //if outside of the screen
      // pos.x=random(width, width+5000);
      pos.x=width;
      tieCollisionX=width;
      tieCollisionY=random(height);
      //tieCollisionY=141;
      pos.y=random(0 , table.pos.y-100);
      //pos.y=141;
      speed=random(-10, -3);  //first num was 6
      //speed=-0.5;
      choose=random(-5, 0);
    }

    //collision with the fighter// //wings//



    //After processing crashed on me, the collision point went wonky a bit
    //and so the normal detection that I did on first attempt
    //Does not work anymore and so I had to alter the code by using the -95 bit
    // which I do not fully understand as to why it works now and that te old version stopped
    //working
    //Collision of the triangle part of the fighter.
  }








  void render() {
    ///Add colours!!!!
    //Tie fighter
    //rect(240, 182, 20, 120); //wing span original
    fill(255);
    stroke(0);

    beginShape(); // the wing (upper)
    fill(80);
    //stroke(255);
    vertex(pos.x+20, pos.y+1);//v19            int pos.x=230;  int pos.y=141;
    vertex(pos.x+20, pos.y+19);//v22
    vertex(pos.x+40, pos.y+19);//v7
    vertex(pos.x+20, pos.y+1);//v19
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+1);//v19
    vertex(pos.x+40, pos.y+19);//v7
    vertex(pos.x+40, pos.y+1);//v8
    vertex(pos.x+40, pos.y+1);//v19
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+1);//v19
    vertex(pos.x+40, pos.y+1);//v8
    vertex(pos.x+40, pos.y-21);//v9
    vertex(pos.x+20, pos.y+1);//v19
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+1);//v19
    vertex(pos.x+40, pos.y-21);//v9
    vertex(pos.x-20, pos.y-21);//v10
    vertex(pos.x, pos.y+1);//v20
    endShape();

    beginShape();
    vertex(pos.x, pos.y+1);//v20
    vertex(pos.x-20, pos.y-21);//v10
    vertex(pos.x-20, pos.y+1);//v11
    vertex(pos.x, pos.y+1);//v20
    endShape();

    beginShape();
    vertex(pos.x, pos.y+1);//v20
    vertex(pos.x-20, pos.y+1);//v11
    vertex(pos.x-20, pos.y+19);//v12
    vertex(pos.x, pos.y+1);//v20
    endShape();

    beginShape();
    vertex(pos.x, pos.y+1);//v20
    vertex(pos.x-20, pos.y+19);//v12
    vertex(pos.x, pos.y+19);//v21
    vertex(pos.x, pos.y+1);//v20
    endShape();
    //upper wing is finished////////////

    beginShape(); //lower wing
    vertex(pos.x+20, pos.y+81);//v26
    vertex(pos.x+40, pos.y+70);//v13
    vertex(pos.x+20, pos.y+70);//v24
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+81);//v26
    vertex(pos.x+40, pos.y+81);//v14
    vertex(pos.x+40, pos.y+70);//v13
    vertex(pos.x+20, pos.y+81);//v26
    vertex(pos.x+20, pos.y+62);//v25
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+81);//v26
    vertex(pos.x+40, pos.y+81);//v14
    vertex(pos.x+40, pos.y+99);//v15
    vertex(pos.x+20, pos.y+81);//v26
    endShape();

    beginShape();
    vertex(pos.x+20, pos.y+81);//v26
    vertex(pos.x+40, pos.y+99);//v15
    vertex(pos.x, pos.y+99);//v16

    vertex(pos.x-20, pos.y+99);
    vertex(pos.x, pos.y+81);//v25
    vertex(pos.x+20, pos.y+81);//v26
    endShape();

    beginShape();
    vertex(pos.x+2, pos.y+81);//v26
    vertex(pos.x-21, pos.y+81);//v17
    vertex(pos.x-20, pos.y+99);//v16
    vertex(pos.x-1, pos.y+81);//vunkown 
    endShape();

    beginShape();
    vertex(pos.x, pos.y+81);//v23
    vertex(pos.x-21, pos.y+81);//v17
    vertex(pos.x-21, pos.y+70);//v18
    endShape();

    beginShape();
    vertex(pos.x-21, pos.y+70);//v18
    vertex(pos.x, pos.y+70);
    vertex(pos.x, pos.y+81);
    vertex(pos.x-21, pos.y+70);

    endShape();
    //lower wing finished


    fill(150);
    //stroke(0);
    rect(pos.x, pos.y, tieCollisionWidth, tieCollisionHeight);//wing span use this as a collision detector //Origin point

    fill(220);
    ellipse(pos.x+10, pos.y+39, 40, 40); //main circle
    image(galactic, pos.x+1, pos.y+-19);
    ellipse(pos.x+10, pos.y+39, 15, 15); //middle circle


    beginShape();  //cockpit
    fill(255); //white is better//black not so much
    vertex(pos.x-8, pos.y+31); //v1
    vertex(pos.x-5, pos.y+36);//v2
    vertex(pos.x-4, pos.y+39);//v3
    vertex(pos.x-8, pos.y+47);//v4
    endShape();
  }
  /*
  so far the ties are done. The collisions, movment, everything works fine
   I'm thinking of adding some random manouvers to the tie fighters
   If they get to a certain range they would randomly pull up or down at a certain angle.
   thinking of adding this towards the end of this week.
   Two more things i would like to add are shooting back and explosions.
   Again maybe start on this towards the end of this week.
   */
}
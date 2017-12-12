# weaponsHUD
This is an assignment for computer sceince oop. I have to make a hud/interface using processing (language java). It can be anything as long as it shows creativity. 

## Death Star
So I opted in making a simple version of the deathstar with some user inout and animation.

## Contols
1. The colour sequence
Observe the 3 sequnce that appears on the right hand side of the screen. After the third red flash, press each square (using the left click on the mouse) that flashed red in order. If success all of the squares will go green including the aim button beside them.

2. Buttons
There are two buttons on screen which the user can press. the first being the Aim button and the second being the fire button. You can only press these buttons once they are green. When red nothing until you do the order.

3. Graphs.
press the following button 1 , 2 , 3 or 4 on the keyboard and observe the Graphs on the displayer beside the aim button change to a different visual. You will also observe the red squares beside the Displayer go green on the representing graph.

## The code
The direction I went was inheritence. Practically all class' in my sketch ar extended by a super class.
I have 2 Super class'
1.GameObjects
```
class GameObjects{
 PVector pos;
 PVector forward;
 float speed;
 
 GameObjects(float x, float y, float speed){
  pos=new PVector(x, y); 
  forward=new PVector();
  this.speed = speed;
 }
  
  void update(){
  }
  
  void render(){
    
  }
}
``` 
This was used for most of the visuals and also those i wanted to have multiple of. For exmple the system class which is the stars.




2. The Graphic class

``` 
abstract class Graphic {
  PVector pos;
  PVector forward;
  float len;
  float tic;
  float filler;

  PVector myPos; //position for the slider.
  PVector point;//point to go to
  
  float speed;
  
  Graphic(float x, float y,float speed ,float len, float tic) {

    pos = new PVector(x, y);
    forward = new PVector();
    this.len = len;
    this.tic = tic;
    //this.filler = filler;
    myPos = new PVector(0, 0);
    this.speed = speed;
  }
  //making sure my base classes have these methods
  
  void  setting(){
    
  }
  
  abstract void update();


  abstract void render();
}
```
This super class will be used for the graphs like pie charts, bar charts , zliders, etc. Mainly seen in the displayer.
Reaon for the extensive use of inheritence was to make my code neater and simpler to read and implement.

I also used 3 arrayLists, 2 for the super class and 1 for the data.
The data is a csv file of the top 10 most populated countries in the world which is displayed using a pie chartin the displayer.


## Features im proud of.
1.The Slider that changes colour reletive to the position of the black bar as seen in the sketch and video. If the black bar is closer to the LFH then it goes green, RHS is red. I used the Lerp functions to achieve this.

2.All the graphs, although it looks simple alot of thought went into this, especially integrating the data from a csv file to the pie chart. Which involved taking data from a class to another using a for loop 

  ``` 
  for (int i =0; i<da.popArr.length; i++) { //was data.length
      total = total + data[i];
    }
```

3.Blowing up earth. Although this might seem evil it was probably the most fun I had. With the animation of the explosion, white flash in the background and then the noise of the explosion.

4. This would be my proudest part of the whole assignment which is the Sequnce colour you see at the Right hand side of the screen.
3 random squares will flash red and a random sequnce in which the user press the squares that flasehd red in the order given.
everytime you start a new sketch the order is completly differen as well. I'ts one of the first things i worked on when i started the assignment.

# Video of assignment in work
[![YouTube](http://img.youtube.com/vi/ENDHavHsL2k/0.jpg)](https://www.youtube.com/watch?v=ENDHavHsL2k&feature=youtu.be)


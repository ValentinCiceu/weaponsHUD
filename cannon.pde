class Cannon extends GameObjects{
  
 
  Cannon(float x, float y, float speed){
  super(x,y,speed);
  
  
 }
 
 void update(){
   
   
 }
 
 
 void render(){
   if(test2){///this proves that a global boolean will work in classes.
    rect(pos.x,pos.y,100,100); 
   }
   
 }
 
 
 
}
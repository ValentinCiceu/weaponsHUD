class Data {
  //this is to get the data which will be used in the pie chart
  String name;
  long population; //to get the long number :3
  float [] arr = new float[10];
  Data(TableRow row){
    name = row.getString("Country");
    population = row.getLong("Population");
   
  }
  
  String toString(){
   return name + " , " + population + " , "; 
    
  }
  void update(){
    
    
  
    for(int i=0; i<data.size(); i++){
     println(data.get(i).name);
      
    }
    
  }
  
  
  void render(){
    
  }
}
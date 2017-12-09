class Data {
  //this is to get the data which will be used in the pie chart
  String name;
  long population; //to get the long number :3
  String [] nameArr = new String[10]; //to store all the names in an array
  //to be used in the pie chart
  long[] popArr = new long[10];
  Data(TableRow row){
    name = row.getString("Country");
    population = row.getLong("Population");
   
  }
  
  String toString(){
   return name + " , " + population + " , "; 
    
  }
  void update(){
    
    //storing the values in an array to be used in the pie chart
  
    for(int i=0; i<data.size(); i++){
     //println(data.get(i).name);
      nameArr[i] = data.get(i).name;
      popArr[i] = data.get(i).population;
    }
    //println(popArr[0]);
  }
  
  
  void render(){
    
  }
}
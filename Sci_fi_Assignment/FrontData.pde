class FrontData
{
  //Declare datatypes here
  
  float startDistance;
  float totalDistance;

  float arc1START;
  float arc1STOP;

  float arc2START;
  float arc2STOP;

  float arc3START;
  float arc3STOP;

  float arc4START = PI;
  float arc4STOP;

  float arc5START;
  float arc5STOP;

  float arcX;
  float arcY;
  float increaseSize;
  float speed;
  
  FrontData()
  {
    //Contructors here
    startDistance = 20;
    arc1START = 0;
    arc1STOP = PI;
    
    arc2START = 0;
    arc2STOP = PI+HALF_PI;
    
    arc3START = HALF_PI;
    arc3STOP = PI;
    
    arc4START = PI;
    arc4STOP = PI+HALF_PI+QUARTER_PI;
    
    arc5START = PI+QUARTER_PI;
    arc5STOP = TWO_PI+HALF_PI;
    
    arcX = 250;
    arcY = 250;
    increaseSize = 0;
    speed = .01;
  }
  
  
  void display()
  {
    
  }
  
  void spiral()
  {
    
  }
  
  
}//end FrontData
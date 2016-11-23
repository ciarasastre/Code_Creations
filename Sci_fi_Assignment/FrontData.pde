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

  float arc4START;
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
    
    arcX = width/2;
    arcY = height/2;
    increaseSize = 0;
    speed = .05;
  }
  
  
  void display()
  {
    background(0);
    totalDistance = startDistance;
    stroke(255);
    noFill();
    strokeWeight(5);
    
    arc1();
    arc2();
    arc3();
    arc4();
    arc5();
    
    arc4();
    arc3();
    arc2();
    arc1();
    
    arc1();
    arc4();
    arc5();
    arc2();
    arc3();
    
    arc2();
    arc1();
    arc4();
    arc3();
    
    if(down == true)
    {
      spin();
    }
    
  }
  
  void arc1()
  {
    arc(arcX, arcY, startDistance, startDistance, arc1START, arc1STOP); //x, y, wid, hei, start, stop //1
    totalDistance += startDistance + increaseSize;
    
    arc1START += speed;
    arc1STOP += 1;
    
  }
  
  void arc2()
  {
    arc(arcX, arcY, totalDistance, totalDistance, arc2START, arc2STOP);//2
    totalDistance += startDistance;
    
    arc2START += speed;
    arc2STOP += speed;
  
  }
  
  void arc3()
  {
    arc(arcX, arcY, totalDistance, totalDistance, arc3START, arc3STOP);//3
    totalDistance += startDistance;
    
    arc3START += speed;
    arc3STOP += speed;
  }
  
  void arc4()
  {
    arc(arcX, arcY, totalDistance, totalDistance, arc4START, arc4STOP); //4
    totalDistance += startDistance;
    
    arc4START += speed;
    arc4STOP += speed;
  }
  
  void arc5()
  {
     arc(arcX, arcY, totalDistance, totalDistance, arc5START, arc5STOP ); //5
    totalDistance += startDistance;
    
    arc5START += speed;
    arc5STOP += speed;
    
  }

  void spin()
  {
    //totalDistance = startDistance;
    stroke(255);
    noFill();
    strokeWeight(5);
    
    increaseSize += .5; //This increases all
    startDistance += 1; //This increases center on
    
    println(increaseSize);
    
    if(increaseSize == 50) //200
    {
      simState = 1;
    }
  }

}//end FrontData
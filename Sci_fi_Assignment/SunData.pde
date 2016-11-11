class SunData
{
  float cSunSize;
  float cSunX;
  float cSunY;
  float distance;
  float shrink;

  //Constructor
  SunData()
  {
    cSunSize = 150;
    cSunX = 250;
    cSunY = 250;
    distance = 120;
    shrink = 100;
  }
  void display()
  {
    noFill();
    stroke(224, 215, 25); //Rich gold colour
    strokeWeight(10);
    ellipse(cSunX, cSunY, cSunSize, cSunSize);
    
    //Top
    ellipse(cSunX, cSunY - distance, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX, cSunY - distance-60, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX, cSunY - distance-shrink, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Bottom
    ellipse(cSunX, cSunY + distance, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX, cSunY + distance+60, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX, cSunY + distance+shrink, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Left
    ellipse(cSunX - distance, cSunY, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX - distance-60, cSunY, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX - distance-shrink, cSunY, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Right
    ellipse(cSunX + distance, cSunY, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX + distance+60, cSunY, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX + distance+shrink, cSunY, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Top Left Corner
    ellipse(cSunX - 100, cSunY - 100, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX - 150, cSunY - 150, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX - 200, cSunY - 200, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Bot Right Corner
    ellipse(cSunX + 100, cSunY + 100, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX + 150, cSunY + 150, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX + 200, cSunY + 200, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Top Right Corner
    ellipse(cSunX + 100, cSunY - 100, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX + 150, cSunY - 150, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX + 200, cSunY - 200, cSunSize - shrink-40, cSunSize-shrink-40);
    
    //Bot Left Corner
    ellipse(cSunX - 100, cSunY + 100, cSunSize - shrink, cSunSize-shrink);
    ellipse(cSunX - 150, cSunY + 150, cSunSize - shrink-20, cSunSize-shrink-20);
    ellipse(cSunX - 200, cSunY + 200, cSunSize - shrink-40, cSunSize-shrink-40);
  }
}
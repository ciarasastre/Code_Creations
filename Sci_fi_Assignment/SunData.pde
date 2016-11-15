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
    cSunSize = 160;
    cSunX = 450;
    cSunY = 300;
    distance = 120;
    shrink = 100;
  }
  void display()
  {
    
    //Text first
    fill(0, 255, 0);
    textSize(15);
    textFont(intro);
    text("Click", 400, 290);
    text("Here", 400, 330);
    
    //Now main circle
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
  }//end display()
  
  void spiral()
  {
    //Spiral
        float spiralX = cx + sin(theta) * r1;
        float spiralY = cy - cos(theta) * r1;

        //Colour time!
        noStroke();
        fill(r,g,b); //RGB
  
        b += .6;
        g += .3;
        r += .1;
        
        println("Blue is %d", b);
        ellipse(spiralX, spiralY, r2, r2);
        theta += 0.1f;
  
        r1 ++;
        r2 += 1; 
        
        //If its completed move on
        if(b >= 400)
        {
          simState = 1;
        }
  }
}
PFont intro;

//CLASSES
SunData sun;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw");
  cursor(HAND);
  
  sun = new SunData();
  startTime = millis();
  simState = 0;
  lights();
  
  background(0);
  
  //This is for the spiral
  cx = width / 2;
  cy = height / 2;
  
  //Sun is called here at the begginnnig

}

//This is for the into scanner
int startTime;
int simState; //This is the state of the simulation

int frame = 100;

//This section is for the spiral
float cx, cy;
float theta = 0;
float r1 = 1;
float r2 = 60;

float r = 7;
float g = 72;
float b = 11;

//This section is incharge of starting up each sequence
boolean stars = false;
boolean down = false;
boolean scanComplete = false;

void draw()
{
  //simState = 0;
  
  switch(simState)
  {
    case(0):
    {
      if(down == false)
      {
        background(0);
        sun.display();
      }
      else
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
     break;
     }//end case(0)
     
     case(1):
     {
       fill(0, 0, 255);
       textSize(100);
       textFont(intro);
       text("[ Welcome back Commander ]", 150, 250);
       simState = 2;
       break;
     }//end case(1)
     
     
     case(2):
     {
          
         
          noStroke();
          fill(0, 10);
          rect(0, 0,width, height);
      
      //Now to create the Planet
          pushMatrix();
          translate(500, height*0.35, -500); // X, Y,Z Z controls how far away it is
          noFill();
          stroke(0, 255, 0);
          sphere(180); //Controls size of sphere
          popMatrix(); 
          
           fill(255);
           ellipse( random(0, width), random(0, height), 10, 10);
            
           break;  
     }//end case(2)

   
  }//end switch
  
}//end draw()

void mousePressed()
{
  down = true;
  scanComplete = true;
}

/*void planet()
{
  
  //Now to create the Planet
  pushMatrix();
  translate(500, height*0.35, -500); // X, Y,Z Z controls how far away it is
  noFill();
  stroke(0, 255, 0);
  sphere(180); //Controls size of sphere
  popMatrix(); 
  
}*/
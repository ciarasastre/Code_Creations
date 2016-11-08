//Hello!

PImage img = createImage(200, 200, RGB);
PFont intro;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw");
  cursor(HAND);
  startTime = millis();
  simState = 0;
  lights();
  
   
}

//This is for the into scanner
int startTime;
int simState; //This is the state of the simulation

int frame = 100;
int x = 0;
int y = -50;
int w = 900;
int h = 50;

boolean down = false;
boolean scanComplete = false;

void draw()
{
  switch(simState)
  {
    case(0):
    {
      background(255);
      //Load in thumb image
      img = loadImage("thumb.jpg");
       
      image(img, 220, 90);
      
      fill(0, 255, 0);
      noStroke();
      rect(x, y, w, h);
    
      if(down)
      {
          y = y+5; 
    
      }
      
      if(scanComplete == false)
      {
        fill(0);
        textSize(100);
        textFont(intro);
        text("Finger Identification Required:", 50, 100);
      }
      else
      {
        if (millis() - startTime > 5000) //After 5 second this will apear
        {
           //Do operation
              
              fill(0, 255, 0);
              textSize(100);
              textFont(intro);
              text("[ Finger Scanning Complete ]", 150, 100);
              
    
        } 
      }
      
     }//end case(0)
     
     case(1):
     {
       if (millis() - startTime > 8000) //After 8 second this will apear
        {
          background(0);
          
          planet();

        }
     }//end case(1)
   }//end switch
    
}//end draw()

void mousePressed()
{
  down = true;
  scanComplete = true;
}

void planet()
{
  //Now to create the Planet
  pushMatrix();
  translate(500, height*0.35, -500); // X, Y,Z Z controls how far away it is
  noFill();
  stroke(0, 255, 0);
  sphere(180); //Controls size of sphere
  popMatrix();
  
}
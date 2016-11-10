PImage img = createImage(200, 200, RGB);
PFont intro;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw");
  cursor(HAND);
  startTime = millis();
  //simState = 0;
  lights();
  
  //This is for the spiral
  cx = width / 2;
  cy = height / 2;
  
  thumb(); 
}

//This is for the into scanner
int startTime;
//int simState; //This is the state of the simulation

int frame = 100;
//int x = 0;
//int y = -50;
//int w = 900;
//int h = 50;

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
  //switch(simState)
  //{
    //case(0):
    //{      
    
      if(down == true)
      {
        float spiralX = cx + sin(theta) * r1;
        float spiralY = cy - cos(theta) * r1;

        //Spiral
        noStroke();
        //Colour time!
        fill(r,g,b); //RGB
  
        b += .6;
        g += .3;
        r += .1;
  
        ellipse(spiralX, spiralY, r2, r2);
        theta += 0.1f;
  
        r1 ++;
        r2 += 1;
    
      }
      
      if(scanComplete == false)
      {
        fill(255, 0, 0);
        textSize(100);
        textFont(intro);
        text("[ Finger Identification Required ]", 100, 100);
      }
      else
      {
        if (millis() - startTime > 10000) //After 10 second this will apear
        {
           //Do operation
              
              fill(0, 0, 255);
              textSize(100);
              textFont(intro);
              for(int i =0; i<3; i++)
              {
                
                text("[ Finger Scanning Complete ]", 150, 250);
              }
              
    
        } 
      }
      
     //}//end case(0)
     
     //case(1):
     //{
       if (millis() - startTime > 20000) //After 20 second this will apear
        {
          //Draw stars
       
       {
         fill(0, 10);
         rect(0, 0,width, height);
    
         fill(255);
         ellipse( random(0, width), random(0, height), 10, 10);
       }
       
          //Now to create the Planet
          pushMatrix();
          translate(500, height*0.35, -500); // X, Y,Z Z controls how far away it is
          noFill();
          stroke(0, 255, 0);
          sphere(180); //Controls size of sphere
          popMatrix(); 

        }
     //}//end case(1)
     
     //case(2):
     //{
       
     //}//end case 2
   
  // }//end switch
  
    
}//end draw()

void mousePressed()
{
  down = true;
  scanComplete = true;
}

void thumb()
{
  fill(0);
  rect(0, 0,width, height);
      
  //Load in thumb image
  img = loadImage("green_thumb.jpg");
       
  img.resize(300,400);
  image(img, 260, 150);
  
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
PFont intro;

//CLASSES
FrontData front;
//PanelData panel;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw"); 
  //intro = loadFont("Parchment-Regular-60.vlw");
  cursor(HAND);
  
  front = new FrontData();
  //panel = new PanelData();
  
  startTime = millis();
  simState = 0;
  lights();
  
  background(0);

}

//This is for the into scanner
int startTime;
int simState; //This is the state of the simulation

float time = 0;

//This section is incharge of starting up each sequence
boolean stars = false;
boolean down = false;

void draw()
{
  switch(simState)
  {
    case(0):
    {
        front.display();
        break;
    }//end case(0)
     
     case(1):
     {
       fill(0, 0, 255);
       textSize(100);
       textFont(intro);
       text("[ Welcome back ]", 150, 250);
       simState = 2;
       break;
     }//end case(1)
     
     
     case(2):
     {
       
       fade();
       break;    
         
     }//end case(2)
     
     case(3):
     {
       background(0);
       fill(0, 0, 255);
       textSize(100);
       textFont(intro);
       text("[ Welcome back ]", 150, 250);
       break;
     }//end case(3)

   
  }//end switch
  
}//end draw()

void mousePressed()
{
  down = true;
}

void fade()
{
  noStroke();
  fill(0, 10);
  rect(0, 0,width, height);
  
  time += 1;
  
  if(time > 1000)
  {
    simState = 3;
  }
          
  //fill(255);
  //ellipse( random(0, width), random(0, height), 10, 10);
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
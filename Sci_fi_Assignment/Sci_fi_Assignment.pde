PFont intro;
PFont infoMain;
PFont info;

//CLASSES
FrontData front;
PlanetData planet;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw"); 
  info = loadFont("ARDESTINE-20.vlw");
  infoMain = loadFont("ARDESTINE-25.vlw");
  
  cursor(HAND);
  
  front = new FrontData();
  planet = new PlanetData();
  
  
  startTime = millis();
  simState = 0;
  lights();
  
  background(0);

}

//This is for the into scanner
int startTime;
int simState; //This is the state of the simulation
int arrowChangeUp = 35;
int arrowChangeDown = 35;
int arrowChangeLeft = 35;
int arrowChangeRight = 35;

float time = 0;

//This section is incharge of starting up each sequence
boolean stars = false;
boolean down = false;

float rectSize = 60;
float rectX;
float rectY;

float lCircSize = 50;
float g = 100;
float h = 100;

float p = 450;
float z = -500;
float circSize = 10;
float small = 8;

void draw()
{
  switch(simState)
  {
    case(0):
    {
        front.display();
        simState =3;
        break;
    }//end case(0)
     
     case(1):
     {
       fill(0, 0, 255);
       textSize(100);
       textFont(intro);
       text("[ Welcome back ]", 270, 280);
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
       planet.display();
       //planet.display();
       
       smallOuterLine();
       topPost();
       largeOuterLine();
       details();
       arrows();

     }//end case(3)
     

   
  }//end switch
  
}//end draw()

void mousePressed()
{
  down = true;
}

//This section creates a fade out effect
void fade()
{
  noStroke();
  fill(0, 10);
  rect(0, 0,width, height);
  
  time += 1;
  println("%f", time);
  
  if(time > 70)
  {
    simState = 3;
  }

}

void largeOuterLine()
{
  fill(255);
  stroke(255);
  /*Bigger line*/
  
  //LEFT SIDE
  line(width/2-200,60, width/2-250, 60); //left top side
  line(width/2-250, 60, width/2-280, 80); //Dwn a bit
  line(width/2-280, 80, 30, 80); 
  
  line(30, 80, 30, 200); //Down
  line(30, 200, 50,230); //connecter
  line(50, 230, 50, 250); //connecting to rects
  
  //RIGHT SIDE
  line(width/2+200,60, width/2+250, 60); //left top side
  line(width/2+250, 60, width/2+280, 80); //Dwn a bit
  line(width/2+280, 80, 870, 80); 
  
  line(870, 80, 870, 200); //Down
  line(870, 200, 820, 230); //connecter
  line(820, 230, 820, 250); //connecting to rects

  //Circles to fill cracks
  ellipse(width/2-200,60, circSize, circSize);
  ellipse(width/2-250, 60, circSize, circSize);
  ellipse( width/2-280, 80, circSize, circSize); //ALL TOP LEFT SIDE
  
  ellipse(width/2+200,60, circSize, circSize);
  ellipse(width/2+250, 60, circSize, circSize);
  ellipse(width/2+280, 80, circSize, circSize); //ALL TOP RIGHT SIDE
  
  ellipse(30, 80, circSize, circSize);
  ellipse(30, 200, circSize, circSize);
  ellipse(50, 230, circSize, circSize);
  ellipse(50, 250, circSize, circSize+10); //ALL BOT LEFT SIDE
  
  ellipse(870, 80, circSize, circSize);
  ellipse(870, 200, circSize, circSize);
  ellipse(820, 230, circSize, circSize);
  ellipse(820, 250, circSize, circSize); //ALL BOT RIGHT SIDE
  
}

void smallOuterLine()
{
  stroke(255);
  strokeWeight(10);
  fill(255);
  
  //TOP PANEL SMALL LINE
  line(width/2-150,10, width/2+150,10); //top main line
  line(width/2-150,10, width/2-200, 40); //left side
  line(width/2+150,10, width/2+200, 40); //right side
  
  //Circles to fill cracks
  ellipse(width/2-150,10, circSize, circSize);
  ellipse(width/2-200, 40, circSize, circSize);
  ellipse(width/2+150,10, circSize, circSize);
  ellipse(width/2+200, 40, circSize, circSize);
  
  //Going from left + right side to beg
  line(width/2-200, 40, 0, 0); //L
  line(width/2+200, 40, width, 0); // R
  
  //BOTTOM PANEL SMALL LINE
  line(width/2-130,590, width/2+130,590); //bot main line
  line(width/2-130,590, width/2-150, 570); // left side
  line(width/2+130,590, width/2+150, 570); //right side
  
  //Circles to fill cracks
  ellipse(width/2-130,590, circSize, circSize);
  ellipse(width/2+130,590, circSize, circSize);
  ellipse(width/2-150, 570, circSize, circSize);
  ellipse(width/2+150, 570, circSize, circSize);
  
  //Going from left + right side to beg
  line(width/2-150, 570, 0, height); //L
  line(width/2+150, 570, width, height); //R
}

void topPost()
{
  strokeWeight(5);
  fill(49,35,57); // Grey
  
  rect(width/2-150, 30, 300, 130);
  triangle(width/2-200, 100, width/2-150, 30, width/2-150, 160); //Left Tri
  triangle(width/2+200, 100, width/2+150, 30, width/2+150, 160); //Right Tri
  
  /*fill(0, 0, 255);
  textSize(100);
  textFont(intro);
  text("[ Welcome back ]", 270, 280);*/

       
  //Read in info about planets here
  fill(255);
  textFont(infoMain);
  text("Planet Earth", 385, 60);
  
  textFont(info);
  text("Population : ", 310, 100);
  text("Description : Filled with", 310, 130);
  text("60% water or somethin", 310, 150);
  
}

void details()
{
  //fill(random(0,200), random(0,200), random(0,200) );
  fill(0);
  strokeWeight(2);
  stroke(0, 255, 0);
  
  //RIGHT SECTION
  triangle(820, 260, 740, 320, 895, 320);
  rect(740, 320, 150, 130);
  
  // the inside circle on the right
  ellipse(width-85, 385, 110, 110);
  
  //create circles inside this circle
  ellipse(width-85, 385, 80, 80);
  ellipse(width-85, 385, 60, 60);
  ellipse(width-85, 385, 40, 40);
  ellipse(width-85, 385, 20, 20);
  
  
  
  //TIME FOR RECTS LEFT RECTS
  fill(255);
  noStroke();
  rect(35, 260, 30, 20); //small top rect connecter
  rect(15, 275, rectSize+10, rectSize); // main ect
  
  rect(35, 330, 30, 20); //small top rect connecter
  rect(15, 345, rectSize+10, rectSize); // main ect
  
  rect(35, 400, 30, 20); //small top rect connecter
  rect(15, 415, rectSize+10, rectSize); // main ect
  
  rect(35, 470, 30, 20); //final small rect connecter
  
  //Create small circles on left
  fill(0, 255, 0); //green
  ellipse(50, 305, lCircSize, lCircSize);
  
  fill(0, 0, 255); //Red
  ellipse(50, 375, lCircSize, lCircSize);
  
  fill(255, 0, 0); //Blue
  ellipse(50, 445, lCircSize, lCircSize);
  
   
}


void arrows()
{
  //First boxes
  strokeWeight(5);
  fill(255);
  stroke(49,arrowChangeUp,57); // Grey at first
  rect(410, 420, 80, 60); // Up
  
  stroke(49,arrowChangeDown,57); // Grey at first
  rect(410, 500, 80, 60); //Down
  
  stroke(49,arrowChangeLeft,57); // Grey at first
  rect(340, 450, 60, 80); // Left
  
  stroke(49,arrowChangeRight,57); // Grey at first
  rect(500, 450, 60, 80); // Right
  
  //Then draw the arrows
  fill(0);
  stroke(0);
  strokeWeight(5);
  
  triangle(450, 425, 470, 445, 430, 445);
  line(450, 425, 450, 470); // UP KEY
  
  triangle(450, 555, 470, 535, 430, 535);
  line(450, 555, 450, 510); // DOWN KEY
  
  triangle(345, 490, 365, 470, 365, 510);
  line(345, 490, 390, 490); //LEFT KEY
  
  triangle(555, 490, 535, 470, 535, 510);
  line(555, 490, 505, 490); //RIGHT KEY
  
  if(keyPressed)
  {
    if(keyCode == LEFT)
    {
      p += 10;
      arrowChangeLeft = 255;
      arrowChangeRight = 35;
      arrowChangeUp = 35;
      arrowChangeDown = 35;
      
    }
    
    if(keyCode == RIGHT)
    {
      p -= 10;
      arrowChangeRight = 255;
      arrowChangeLeft = 35;
      arrowChangeUp = 35;
      arrowChangeDown = 35;
      
    }
    
    if(keyCode == UP)
    {
      z += 10;
      arrowChangeRight = 35;
      arrowChangeLeft = 35;
      arrowChangeUp = 255;
      arrowChangeDown = 35;
      
    }
    
    if(keyCode == DOWN)
    {
      z -= 10;
      arrowChangeDown = 255;
      arrowChangeRight = 35;
      arrowChangeLeft = 35;
      arrowChangeUp = 35;
      
    }
  }
}
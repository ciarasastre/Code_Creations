import ddf.minim.*;

Minim minim; //audio context
AudioPlayer beginning;
AudioPlayer transition;
AudioPlayer mainSong;

PFont intro;
PFont infoMain;
PFont info;

Table table;

//CLASSES
FrontData front;
PlanetData planet;

void setup()
{
  size(900,600, P3D);
  intro = loadFont("ARDESTINE-48.vlw"); 
  info = loadFont("ARDESTINE-20.vlw");
  infoMain = loadFont("ARDESTINE-25.vlw");
  
  minim = new Minim(this);
  beginning = minim.loadFile("begin.wav");
  
  transition = minim.loadFile("transition.wav");
  
  mainSong = minim.loadFile("main.wav");
  
  cursor(HAND);
  
  front = new FrontData();
  planet = new PlanetData();
  
  simState = 0;
  lights();

  background(0);
  

  beginning.rewind();
  beginning.play();
  
  showCoordinates();

}

//This is for the into scanner
//int startTime;
int simState; //This is the state of the simulation

int arrowChangeUp = 35;
int arrowChangeDown = 35;
int arrowChangeLeft = 35;
int arrowChangeRight = 35;

int fuel = 100;
int refuel = 0;
int oxy = 100;
int speed = 1;

float time = 0;
float moveX = 815;
float moveY = 330;
int xList = 600;
int yList = 490;
int music = 0;

//This section is incharge of starting up each sequence
boolean down = false;
boolean playMusic1 = false;

float rectSize = 60;
float rectX;
float rectY;

float lCircSize = 50;

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
        break;
    }//end case(0)
     
     case(1):
     {
       fill(128,48,198); //Purple
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
       
       smallOuterLine();
       topPost();
       largeOuterLine();
       details();
       arrows();
       
       radarDetails();
       buttonControls();
       
       loadCoordinates();
       showCoordinates();
       
       
       break;
     }//end case 3
     
     case(4):
     {
       lowOxy();
       break;
     }
     
     case(5):
     {
       //This function is for fuel DONT MOVE
       break;
     }


   
  }//end switch
  
}//end draw()

void mousePressed()
{
  down = true;
  beginning.pause();
  
  //transition.rewind();
  transition.play();
  
  //mainSong.rewind();
  mainSong.play();
  if(mainSong == null)
  {
    mainSong.rewind();
    mainSong.play();
  }
    
  
  if(mouseX > 10 && mouseX < 90)
  {
    //IF ITS OVER THE FUEL BUTTON
    if(mouseY > 270 && mouseY < 335)
    {
      fuel = 100;
      simState = 3;
    }
    
    //IF IT IS OVER THE OXYGEN BUTTON
    if(mouseY > 345 && mouseY < 405)
    {
      oxy = 100;
      simState = 3;
    }
    
    //IF IT IS OVER THE SPEED BUTTON
    if(mouseY > 410 && mouseY < 480)
    {
      speed += 1;
      
      if(speed == 4)
      {
        speed = 1;
      }
    }
  }
    
}

//This section creates a fade out effect
void fade()
{
  noStroke();
  fill(0, 10);
  rect(0, 0,width, height);
  
  time += 1;
  
  if(time > 65)
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

     
  //Read in info about planets here
  //LEFT SIDE FIRST
  
  //EARTH
  if(p > 0 && p < 950)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Earth", 385, 60);
    
    textFont(info);
    text("Population : 108 Billion", 310, 100);
    text("Description : Filled with", 310, 130);
    text("60% water or somethin", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX, moveY);// EARTH
  }
  
  //WHEN EARHT IS FULL CYCLE
  //EARTH
  if(p > 5600 && p < 5900)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Earth", 385, 60);
    
    textFont(info);
    text("Population : 108 Billion", 310, 100);
    text("Description : Filled with", 310, 130);
    text("60% water or somethin", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX, moveY);// EARTH
  }
  
  //LUTHREX
  if(p > 1500 && p< 2300)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Luthrex", 375, 60);
    
    textFont(info);
    text("Population : Around 1 Billion ", 310, 100);
    text("Description : Cloud species", 310, 130);
    text("live here ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX-55, moveY+55); //LUTHREX
  }
  
  //NEXUS
  if(p > 2800 && p< 3700)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Nexus", 385, 60);
    
    textFont(info);
    text("Population : 5 Queens ", 310, 100);
    text("Description : Yaas Queen", 310, 130);
    text("Yaaaaaaaaas ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX, moveY+110); //NEXUS
  }
  
  //Zaran
  if(p > 4200 && p< 5100)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Zaran", 385, 60);
    
    textFont(info);
    text("Population : 2,098 ", 310, 100);
    text("Description : Full of Fire lovers", 310, 130);
    text("No sustainable land. ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX+55, moveY+55); //ZARAN

  }
  
  
  
  //NOW RIGHT SIDE
  
  //ZARAN
  if(p > -1350 && p < -500)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Zaran", 385, 60);
    
    textFont(info);
    text("Population : 2,098 ", 310, 100);
    text("Description : Full of Fire lovers", 310, 130);
    text("No sustainable land. ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX+55, moveY+55); //ZARAN
  }
  
  //LUTHREX
  if(p > -4200 && p< -3300)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Luthrex", 375, 60);
    
    textFont(info);
    text("Population : Around 1 Billion ", 310, 100);
    text("Description : Cloud species", 310, 130);
    text("live here ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX-55, moveY+55); //LUTHREX

  }
  
  //NEXUS
  if(p > -2800 && p < -1900)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Nexus", 385, 60);
    
    textFont(info);
    text("Population : 5 Queens ", 310, 100);
    text("Description : Yaas Queen", 310, 130);
    text("Yaaaaaaaaas ", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX, moveY+110); //NEXUS
  }
  
  //WHEN EARHT IS FULL CYCLE
  //EARTH
  if(p > -5100 && p < -4700)
  {
    fill(255);
    textFont(infoMain);
    text("Planet Earth", 385, 60);
    
    textFont(info);
    text("Population : 108 Billion", 310, 100);
    text("Description : Filled with", 310, 130);
    text("60% water or somethin", 310, 150);
    
    stroke(255);
    line(width-85, height-215, moveX, moveY);// EARTH
  }
  
}

void details()
{
  //fill(random(0,200), random(0,200), random(0,200) );
  fill(0);
  strokeWeight(2);
  stroke(255);
  
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
  fill(225,255,0); //Gold
  ellipse(50, 305, lCircSize, lCircSize);

  //FUEL LEVEL
  textFont(info);
  fill(0);
  text(fuel+"%", 30, 310);
  fuel -= 1;
  
  if(fuel < 0)
  {
    fuel += 1;
  }
  
  if(fuel == 0)
  {
    //Cant move if no fuel
    simState = 5 ;
  }
  
  fill(255);
  text("Fuel Level", 100, 310);
  
  fill(128,48,198); //Purple
  ellipse(50, 375, lCircSize, lCircSize);
  
  //OXYGEN LEVEL
  fill(0);
  text(oxy+"%", 30, 380);
  oxy -= 1;
  
  if(oxy < 0)
  {
    oxy += 1;
  }
  
  if(oxy == 0)
  {
    simState = 4;
    
  }

  fill(255);
  text("Oxygen Level", 100, 380);
  
  fill(41, 224, 85); //Green
  ellipse(50, 445, lCircSize, lCircSize);
  
  //SPEED LEVEL
  fill(0);
  text(speed+"", 45, 450);
  
  fill(255);
  text("Speed Level", 100, 450);
  
   
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
      if(speed == 1)
      {
        p += 10;
      }
      
      if(speed == 2)
      {
        p += 50;
      }
      
      if(speed == 3)
      {
        p += 150;
      }
      
      arrowChangeLeft = 255;
      arrowChangeRight = 35;
      arrowChangeUp = 35;
      arrowChangeDown = 35;
      
      
    }
    
    if(keyCode == RIGHT)
    {
      if(speed == 1)
      {
        p -= 10;
      }
      
      if(speed == 2)
      {
        p -= 50;
      }
      
      if(speed == 3)
      {
        p -= 150;
      }
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

void radarDetails()
{
  stroke(255);
  
  fill(128,48,198); //Purple
  strokeWeight(1);
  ellipse(width-120, height-215, 10, 10);
  
  ellipse(width-40, height-215, 10, 10);
  ellipse(width-85, height-240, 10, 10);
  ellipse(width-85, height-180, 10, 10);
}

ArrayList<PlanetPos> planets = new ArrayList<PlanetPos>();

void lowOxy()
{
  //Fade to black if low on oxygen
  noStroke();
  fill(0, 10);
  rect(0, 0,width, height);
}

void buttonControls()
{
  //Resets area
  fill(0);
  stroke(0);
  rect(785, 290, 70, 25);
  
  fill(0,0,255);

  //FIRST LUTHREX AND ZARAN
  if(mouseY > 375 && mouseY < 395)
  {
    //PRINTF LUTHREX
    if(mouseX > 770 && mouseX < 790)
    {
      text("Luthrex", 785, 315);
    }
    
    //PRINTF ZARAN
    if(mouseX > 850 && mouseX < 870)
    {
      text("Zaran", 790, 315);
    }
  }
      
  
  // THEN EARTH AND NEXUS
  if(mouseX > 805 && mouseX < 825)
  {
    //PRINT EARTH
    if(mouseY > 350 && mouseY <370)
    {
      text("Earth", 790, 315);
    }
    
    //PRINT NEXUS
    if(mouseY > 410 && mouseY < 430)
    { 
      text("Nexus", 790, 315);
    }
      
  }
}
    
void loadCoordinates()
{
  table = loadTable("planetPos.csv","header");
    
  for(TableRow row : table.rows() )
  {
    PlanetPos planet = new PlanetPos(row);
    planets.add(planet);
  }
}
  
void showCoordinates()
{ 
      yList = 490; //makes first line stay in place
      
      for(PlanetPos planet:planets)
      {
        
        fill(255,255,0);
        text((planet.name), xList+20, yList);

        text(("X:"+planet.xPos+","), xList+120, yList);
        
        text(("Y:"+planet.yPos+","), xList+210, yList);
        
        if(yList < 550)
        {
          yList += 20;
        }
        else
        {
          yList =790; //Found a loop hole where this now goes off page
        }

      }
      


}
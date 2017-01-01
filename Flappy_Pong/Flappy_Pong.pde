/* Program that explains the working mechanics of a game
  using an example of flappy bird and pong mixed together
*/

/*********** VARIABLES *********/
/* We control which screen is active by settings/updating
  gamescreen variable. We display the correct screen according to
  thw value of this variable
*/

int gameScreen = 0;

//Ball Variables
float ballX, ballY;
int ballSize = 20;
int ballColour = color(0);

//Gravity Variables
float gravity = 1;
float ballSpeedVert = 0;
float ballSpeedHorizon = 10;

//Friction Variables
float airFriction = 0.001;
float friction = 0.1;

//Racket Variables
color racketColour = color(0);
float racketWidth = 100;
float racketHeight = 10;
int racketBounceRate = 20;

void setup()
{
  size(500,500);
  ballX = width/4;
  ballY = height/5;
  
}

void draw()
{
  //Display contents of current screen
  switch(gameScreen)
  {
    case(0):
    {
      initScreen();
      break;
    }
    
    case(1):
    {
      gameScreen();
      break;
    }
    
    case(2):
    {
      gameOverScreen();
      break;
    }
    
    
  }//end switch
  
}// end draw
  
  
/************ SCREEN CONTENTS **************/

void initScreen()
{
  background(0);
  textAlign(CENTER);
  text("Click to Start", height/2, width/2);
  
}

void gameScreen()
{
  background(255);
  drawBall();
  applyGravity();
  keepInScreen();
  drawRacket();
  watchRacketBounce();
  applyHorizontalSpeed();
}

void gameOverScreen()
{
  
}

/******** INPUTS *****************/
public void mousePressed()
{
  //if we are on initial screen when clicked it will start the game
  
  if(gameScreen == 0)
  {
    startGame();
  }
  
}


/********** OTHER FUNCTIONS *********/

//This method sets the necessery variables to start the game
void startGame()
{
  gameScreen = 1;
}

void drawBall()
{
  fill(ballColour);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void applyGravity()
{
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  
  //Adding Friction
  ballSpeedVert -= (ballSpeedVert * airFriction);
}

void makeBounceBottom(float surface)
{
  ballY = surface - ( ballSize/2);
  ballSpeedVert *= -1;
  
  //Adding Friction
  ballSpeedVert -= (ballSpeedVert * airFriction);
}

void makeBounceTop(float surface)
{
  ballY = surface + ( ballSize/2);
  ballSpeedVert *= -1;
  
  //Adding Friction
  ballSpeedVert -= (ballSpeedVert * airFriction);
}

//Keep ball in screen
void keepInScreen()
{
  
  //Ball hits floor
  if( ballY + (ballSize/2) > height)
  {
    makeBounceBottom(height);
  }
  
  //Ball hits ceiling
  if( ballY - (ballSize/2) < 0)
  {
    makeBounceTop(0);
  }
  
  //HORIZON SECTION
  if(ballX - (ballSize/2) < 0)
  {
    makeBounceLeft(0);
  }
  
  if(ballX + (ballSize/2) > width)
  {
    makeBounceRight(width);
  }
}

void drawRacket()
{
  fill(racketColour);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}

void watchRacketBounce()
{
  float overhead = mouseY - pmouseY;
  
  if( ( ballX + (ballSize/2) > mouseX - (racketWidth/2) ) && (ballX - (ballSize/2) < mouseX + (racketWidth/2) ) )
  {
    if(dist (ballX, ballY, ballX, mouseY) <= (ballSize/2)+abs(overhead) )
    {
      makeBounceBottom(mouseY);
      
      //Racket moving upwards
      if(overhead < 0)
      {
        ballY += overhead;
        ballSpeedVert += overhead;
      }
    }
  }
  
  //For conrtoling the ball on racket
  if( (ballX + (ballSize/2) > mouseX - (racketWidth/2) ) && (ballX - (ballSize/2) < mouseX + (racketWidth/2) ) )
  {
    if(dist(ballX, ballY, ballX, mouseY) <= (ballSize/2) +abs(overhead) )
    {
      ballSpeedHorizon = (ballX - mouseX) / 5;
    }
  }
  
}

void applyHorizontalSpeed()
{
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airFriction);
}

void makeBounceLeft(float surface)
{
  ballX = surface + (ballSize/2);
  ballSpeedHorizon += -1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

void makeBounceRight(float surface)
{
  ballX = surface - (ballSize/2);
  ballSpeedHorizon += -1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
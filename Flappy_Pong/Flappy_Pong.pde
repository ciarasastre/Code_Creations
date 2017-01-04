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
int score = 0;

//Gravity Variables
float gravity = 1;
float ballSpeedVert = 0;
float ballSpeedHorizon = 0;

//Friction Variables
float airFriction = 0.001;
float friction = 0.1;

//Racket Variables
color racketColour = color(0);
float racketWidth = 100;
float racketHeight = 10;
int racketBounceRate = 20;

//Wall Variables
int wallSpeed = 5;
int wallInterval = 1000;
float lastAddTime = 0;
int minGapHeight = 200;
int maxGapHeight = 300;
int wallWidth = 80;
color wallColours = color(0);

//This arraylist stores data of the gaps between the walls actual walls are drawn accordingly
//[gapWallX, gapWallY, gapWallWidth, gapWallHeight]
ArrayList<int[]> walls = new ArrayList<int[]>();

//Health Variables
int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;

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
  wallAdder();
  wallHandler();
  drawHealthBar();
  printScore();
}

void gameOverScreen()
{
  background(0);
  textAlign(CENTER);
  textSize(30);
  text("Final Score:", height/2, width/2 - 100);
  text(score, height/2, width/2 - 50);
  text("Game Over", height/2, width/2 + 20);
  textSize(15);
  fill(255);
  text("Click to Restart", height/2, width/2 + 40);
}

/******** INPUTS *****************/
public void mousePressed()
{
  //if we are on initial screen when clicked it will start the game
  
  if(gameScreen == 0)
  {
    startGame();
  }
  
  if(gameScreen == 2)
  {
    restart();
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

void wallAdder()
{
  if(millis() - lastAddTime > wallInterval)
  {
    int randHeight = round(random(minGapHeight, maxGapHeight) );
    int randY = round(random(0, height-randHeight) );
    
    //{gapWallX, gapWallY, gapWallWidth, gapWallHeight}
    
    int[] randWall = {width, randY, wallWidth, randHeight, 0};
    walls.add(randWall);
    lastAddTime = millis();
    
    //Added another value at the end of the array
    //int[] randWall = {width, randY, wallWidth, randHeight, 0};
  }
}

void wallHandler()
{
  for(int i=0; i< walls.size(); i++)
  {
    wallRemover(i);
    wallMover(i);
    wallDrawer(i);
  }
  
  for(int i =0; i<walls.size(); i++)
  {
    watchWallCollision(i);
  }
}

void wallDrawer(int index)
{
  int[] wall = walls.get(index);
  
  //get gap wall settings
  int gapWallX = wall[0];
  int gapWallY = wall[1];
  int gapWallWidth = wall[2];
  int gapWallHeight = wall[3];
  
  //Draw actual walls
  rectMode(CORNER);
  fill(wallColours);
  rect(gapWallX, 0, gapWallWidth, gapWallY);
  rect(gapWallX, gapWallY + gapWallHeight, gapWallWidth, height - (gapWallY + gapWallHeight) );
 
}

void wallMover(int index)
{
  int[] wall = walls.get(index);
  wall[0] -= wallSpeed;
}

void wallRemover(int index)
{
  int[] wall = walls.get(index);
  if( wall[0] + wall[2] <= 0)
  {
    walls.remove(index);
  }
}

/* watchWallCollision() method gets called for each wall on each loop.
  We grab the coordinates of the gap wall, 
  calculate the coordinates of the actual walls 
  (top and bottom) and we check if the coordinates of the ball collides with the walls.
*/
void watchWallCollision(int index)
{
  int[] wall = walls.get(index);
  
  //get gap wall settings
  int gapWallX = wall[0];
  int gapWallY = wall[1];
  int gapWallWidth = wall[2];
  int gapWallHeight = wall[3];
  int wallScored = wall[4];
  
  int wallTopX = gapWallX;
  int wallTopY = 0;
  int wallTopWidth = gapWallWidth;
  int wallTopHeight = gapWallY;
  
  int wallBottomX = gapWallX;
  int wallBottomY = gapWallY + gapWallHeight;
  int wallBottomWidth = gapWallWidth;
  int wallBottomHeight = height - (gapWallY+gapWallHeight);
  
  if(ballX > gapWallX + (gapWallWidth/2) && wallScored == 0)
  {
    wallScored = 1;
    wall[4] = 1;
    score();
  }
  
  if(
  (ballX+(ballSize/2)>wallTopX) &&
    (ballX-(ballSize/2)<wallTopX+wallTopWidth) &&
    (ballY+(ballSize/2)>wallTopY) &&
    (ballY-(ballSize/2)<wallTopY+wallTopHeight)
    ) {
    // collides with upper wall
    decreaseHealth();
    
  }
  
  if (
    (ballX+(ballSize/2)>wallBottomX) &&
    (ballX-(ballSize/2)<wallBottomX+wallBottomWidth) &&
    (ballY+(ballSize/2)>wallBottomY) &&
    (ballY-(ballSize/2)<wallBottomY+wallBottomHeight)
    ) {
    // collides with lower wall
    decreaseHealth();
  }
}
  
void drawHealthBar()
{
  noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(ballX - (healthBarWidth/2), ballY - 30, healthBarWidth, 5);
  
  if(health > 60)
  {
    fill(46, 204, 113);
  }
  else if(health > 30)
  {
    fill(230, 126, 34);
  }
  else
  {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(ballX - (healthBarWidth/2), ballY - 30, healthBarWidth*(health/maxHealth), 5);
}

void decreaseHealth()
{
  health -= healthDecrease;
  if(health <= 0 )
  {
    gameScreen = 2;
  }
}

void score()
{
  score++;
}

void printScore()
{
  textAlign(CENTER);
  fill(0);
  textSize(30);
  text(score, height/2, 50);
}

void restart()
{
  score = 0;
  health = maxHealth;
  ballX = width/4;
  ballY = height/5;
  lastAddTime = 0;
  walls.clear();
  gameScreen = 0;
}
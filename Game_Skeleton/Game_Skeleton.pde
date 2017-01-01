/* Program that is a skeleton of a start of a game
*/

/*********** VARIABLES *********/
/* We control which screen is active by settings/updating
  gamescreen variable. We display the correct screen according to
  thw value of this variable
*/

int gameScreen = 0;


void setup()
{
  size(500,500);
  
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
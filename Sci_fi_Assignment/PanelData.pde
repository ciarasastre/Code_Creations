class PanelData
{
  //Declare datatypes here
  
  float rectSize;
  float rectX;
  float rectY;
  
   PImage img;
  PImage galaxy;
  PShape globe;
  
  PanelData()
  {
    //Contructors here
    rectSize = 30;
  }
  
  
  void display()
  {
    background(0);  
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
    
    //TIME FOR RECTS
    rect(40, 250, 20,10); //small top rect connecter
    rect(30, 270, rectSize+10, rectSize); // main ect
    
    rect(40, 300, 20,10); //small top rect connecter
    rect(30, 320, rectSize+10, rectSize); // main ect
    
    rect(40, 350, 20,10); //small top rect connecter
    rect(30, 370, rectSize+10, rectSize); // main ect
    
    rect(40, 410, 20,10); //final small rect connecter
    
    //RIGHT SIDE
    line(width/2+200,60, width/2+250, 60); //left top side
    line(width/2+250, 60, width/2+280, 80); //Dwn a bit
    line(width/2+280, 80, 870, 80); 
    
    line(870, 80, 870, 200); //Down
    line(870, 200, 820, 230); //connecter
    line(820, 230, 820, 250); //connecting to rects
    
    triangle(820, 250, 780, 280, 860, 280);
    rect(780, 290, 80, 80);
    
  }
  
  void smallOuterLine()
  {
    fill(255);
    stroke(255);
    strokeWeight(10);
    
    //TOP PANEL SMALL LINE
    line(width/2-150,10, width/2+150,10); //top main line
    line(width/2-150,10, width/2-200, 40); //left side
    line(width/2+150,10, width/2+200, 40); //right side
    
    //Going from left + right side to beg
    line(width/2-200, 40, 0, 0); //L
    line(width/2+200, 40, width, 0); // R
    
    //BOTTOM PANEL SMALL LINE
    line(width/2-130,590, width/2+130,590); //bot main line
    line(width/2-130,590, width/2-150, 570); // left side
    line(width/2+130,590, width/2+150, 570); //right side
    
    //Going from left + right side to beg
    line(width/2-150, 570, 0, height); //L
    line(width/2+150, 570, width, height); //R
    
    
  }
  
  void topPost()
  {
    fill(255,0,0);
    stroke(255, 0, 0);
    line(width/2-150, 30, width/2 +150, 30); //Top Line
    
    line(width/2-150, 30, width/2-200, 100); //L
    line(width/2+150, 30, width/2+200, 100); //R
    
    line(width/2-200, 100, width/2-150, 170); //L
    line(width/2+200, 100, width/2+150, 170); //R
    
    line(width/2-150, 170, width/2 +150, 170); // Bot Line
    
    
  }
  
  void details()
  {
    //First create the mini circles on the left
    fill(255,0,0);
    noStroke();
    ellipse(50, 290, 30,30);
    
    ellipse(50, 340, 30,30);
    
    ellipse(50, 385, 30,30);
    
    //Then the inside circle on the right
    ellipse(width-80, 330, 80,80);
    
    //now enter in grids from the left and right
  }
  
void arrows()
{
  fill(255);
  rect(410, 500, 80, 60); //Down
  rect(410, 420, 80, 60); // Up
  
  rect(340, 450, 60, 80); // Left
  rect(500, 450, 60, 80); // Right
  
}

void planet()
{
  background(0);
    noStroke();
    fill(255);
    
    // Load an image
    img = loadImage("earth.jpg");
    galaxy = loadImage("galaxy.jpg");
    
    globe = createShape(SPHERE, 150);
    
    // Automatically texture the shape with the image
    globe.setTexture(img);
    
     background(0);
  
    hint(DISABLE_DEPTH_MASK);
    image(galaxy, 0, 0, width, height);
    hint(ENABLE_DEPTH_MASK);
    
    pushMatrix();
    translate(width/2, height/2, -300);  
    
    //pushMatrix();
    rotateY(PI * frameCount / 500);
    shape(globe);
    //popMatrix();
  
    
    popMatrix();
    /*Now to create the Planet
    pushMatrix();
    translate(p, height*0.35, -500); // X, Y,Z Z controls how far away it is height*0.35
    noFill();
    stroke(0, 255, 0);
    sphere(180); //Controls size of sphere
    popMatrix();
    p += .1;*/
  
  }
}//end PanelData class
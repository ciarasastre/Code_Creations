class PlanetData
{
  PImage planet1;
  PImage planet2;
  PImage planet3;
  PImage planet4;
  PImage planet5;
  PImage planet6;
  
  PImage stars;
  PShape globe;
  PShape globe2;
  PShape globe3;
  PShape globe4;
  PShape globe5;
  PShape globe6;
  
  float size;

  PlanetData()
  {
    size = 150;
  }
  
  void display()
  {
    background(0);
    noStroke();
    fill(255);
    
    // Load an image
    planet1 = loadImage("earth.jpg");
    planet2 = loadImage("greyplan.jpg");
    planet3 = loadImage("cloud.jpg");
    planet4 = loadImage("jupplan.jpg");
    planet5 = loadImage("galaxy.jpg");
    planet6 = loadImage("plut.jpg");
    
    stars = loadImage("stars.jpg");
    
    globe = createShape(SPHERE, size);
    globe2 = createShape(SPHERE, size);
    globe3 = createShape(SPHERE, size);
    globe4 = createShape(SPHERE, size);
    globe5 = createShape(SPHERE, size);
    globe6 = createShape(SPHERE, size);
    
    // Automatically texture the shape with the image
    globe.setTexture(planet1);
    globe2.setTexture(planet2);
    globe3.setTexture(planet3);
    globe4.setTexture(planet4);
    globe5.setTexture(planet5);
    globe6.setTexture(planet6);
  
    hint(DISABLE_DEPTH_MASK); //This makes sure the planet is drawn on top
    image(stars, 0, 0, width, height);
    hint(ENABLE_DEPTH_MASK);
    
    pushMatrix(); 
    translate(p, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
    rotateY(PI * frameCount / 500); //Rotates itself
    shape(globe); //Controls size
    popMatrix();

    //Right side planets
    if(p < 0)
    {
      pushMatrix(); 
      translate(p+1400, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe2); //Controls size
      popMatrix(); 
      
      //mini planet
      pushMatrix(); 
      translate(p+2100, height*0.15, z-1000); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe5); //Controls size
      popMatrix(); 
      
      pushMatrix(); 
      translate(p+2800, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe4); //Controls size
      popMatrix(); 
      
      //second mini planet
      pushMatrix(); 
      translate(p+4400, height*0.55, z-2000); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe6); //Controls size
      popMatrix(); 

      pushMatrix(); 
      translate(p+4200, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe3); //Controls size
      popMatrix();
      
      pushMatrix(); 
      translate(p+5600, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe); //Controls size
      popMatrix();
      
      println("%f", p);
      
      if(p == -5150)
      {
        p = 450;
      }
        
    }
    
    
    //Left side planets
    if(p > 0)
    {
      pushMatrix(); 
      translate(p-1400, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe3); //Controls size
      popMatrix(); 
      
      pushMatrix(); 
      translate(p-2800, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe4); //Controls size
      popMatrix();
      
      //second mini planet
      pushMatrix(); 
      translate(p-4400, height*0.55, z-2000); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe5); //Controls size
      popMatrix(); 

      pushMatrix(); 
      translate(p-4200, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe2); //Controls size
      popMatrix();
      
      //mini planet
      pushMatrix(); 
      translate(p-2100, height*0.15, z-1000); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe6); //Controls size
      popMatrix(); 
      
      pushMatrix(); 
      translate(p-5600, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe); //Controls size
      popMatrix();
      
      if(p == 6000)
      {
        p = 450;
      }
    }
     
  }//end void display
  
}//end class
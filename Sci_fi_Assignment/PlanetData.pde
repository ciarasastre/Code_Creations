class PlanetData
{
  PImage planet1;
  PImage planet2;
  PImage planet3;
  
  PImage stars;
  PShape globe;
  PShape globe2;
  PShape globe3;
  
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
    
    stars = loadImage("stars.jpg");
    
    globe = createShape(SPHERE, size);
    globe2 = createShape(SPHERE, size);
    globe3 = createShape(SPHERE, size);
    
    // Automatically texture the shape with the image
    globe.setTexture(planet1);
    globe2.setTexture(planet2);
    globe3.setTexture(planet3);
  
    hint(DISABLE_DEPTH_MASK); //This makes sure the planet is drawn on top
    image(stars, 0, 0, width, height);
    hint(ENABLE_DEPTH_MASK);
    
    pushMatrix(); 
    translate(p, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
    rotateY(PI * frameCount / 500); //Rotates itself
    shape(globe); //Controls size
    popMatrix();
    
    //This section controls the next planet
    //Right side planet
    if(p < 0)
    {
      pushMatrix(); 
      translate(p+1400, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe2); //Controls size
      popMatrix();
    }
    
    
    //Left side planet
    if(p > 0)
    {
      pushMatrix(); 
      translate(p-1400, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
      rotateY(PI * frameCount / 500); //Rotates itself
      shape(globe3); //Controls size
      popMatrix(); 
      
      println("%f", p);
      
      if(p > 1400)
      {
        pushMatrix(); 
        translate(p-2800, height*0.35, z); // X, Y,Z Z controls how far away it is height*0.35
        rotateY(PI * frameCount / 500); //Rotates itself
        shape(globe3); //Controls size
        popMatrix(); 
        
        if(p == 3000)
        {
          p=0;
        }
        
      }
      
        
    }
  
  }
}
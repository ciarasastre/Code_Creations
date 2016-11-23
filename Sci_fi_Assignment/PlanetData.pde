class PlanetData
{
  PImage planet1;
  PImage galaxy;
  PShape globe;
  
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
    galaxy = loadImage("galaxy.jpg");
    
    globe = createShape(SPHERE, size);
    
    // Automatically texture the shape with the image
    globe.setTexture(planet1);
  
    hint(DISABLE_DEPTH_MASK); //This makes sure the planet is drawn on top
    image(galaxy, 0, 0, width, height);
    hint(ENABLE_DEPTH_MASK);
    
    pushMatrix(); 
    translate(p, height*0.35, -500); // X, Y,Z Z controls how far away it is height*0.35
    rotateY(PI * frameCount / 500); //Rotates itself
    shape(globe); //Controls size
    popMatrix();
  
  }
}
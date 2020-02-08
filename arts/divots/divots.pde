PShader shade;

void setup(){
  size(1000, 1000, P2D);
  shade = loadShader("shaders/frag.glsl", "shaders/vert.glsl");
  background(255);
  frameRate(1);
}

void draw(){
  //shade.set("loc", new PVector(random(width), random(height)));
  shade.set("loc", new PVector(width/2, height/2));
  shader(shade);
  
  noStroke();
  rect(0, 0, width, height);
  
}
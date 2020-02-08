PShader lines;

void setup(){
  size(1000, 1000, P3D);
  lines = loadShader("shaders/frag.glsl", "shaders/vert.glsl");
}

void draw(){
  background(0);
  shader(lines);
  
  //resetMatrix();
  
  translate(width/2, height/2, -100);
  rotateZ(radians(frameCount));
  rotateY(radians(frameCount*2));
  fill(255);
  noStroke();
  translate(250, 0, 0);
  box(500, 100, 100);
  
  sphere(100);
 
  
  
}
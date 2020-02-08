PShader lines;

void setup(){
  size(1000, 1000, P3D);
  lines = loadShader("shaders/frag.glsl", "shaders/vert.glsl");
}

void draw(){
  background(255);
  shader(lines, LINES);
  
  //resetMatrix();
  
  translate(width/2, height/2, -100);
  rotateZ(radians(frameCount));
  rotateY(radians(frameCount*2));
  noFill();
  stroke(0);
  strokeWeight(3);
  box(500);
  
}
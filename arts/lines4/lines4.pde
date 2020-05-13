PShader lines;
PVector[] start = new PVector[100];
PVector[] end = new PVector[100];
int count = 10;

void setup() {
  size(1000, 1000, P3D);
  lines = loadShader("frag.glsl", "vert.glsl");

  for (int i = 0; i < count; i++) {
    if (i ==0)
      start[i] = new PVector(random(width), random(height));
    else
      start[i] = end[i-1];
    end[i] = new PVector(random(width), random(height));
  }

  background(0);
}

void draw() {
  background(0);
  //lines.set("k", 0.5);
 

  shader(lines, LINES);
  //fill(255);
  noFill();
  stroke(255);
  
  translate(500, 500, 100);
  rotateX(radians(frameCount));
  //translate(500, 500, 100);
  rotateZ(radians(frameCount/2.0));
  
  box(100);
}

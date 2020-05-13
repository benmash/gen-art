PShader blur;
PImage bg;

int n = 4;
PVector[] nodes = new PVector[n];

void setup() {
  size(1000, 1000, P2D);
  blur = loadShader("frag.glsl");
  bg = loadImage("bg2.png");
  //bg = loadImage("etched.png"); 

  for (int i = 0; i < n; i++) {
    nodes[i] = new PVector(random(width), random(height));
  }
}

void draw() {
  for (int i = 0; i < n; i++) {
    //nodes[i].add(PVector.random2D().mult(5));
    nodes[i] = new PVector(random(width), random(height));
  }

  blur.set("screen", bg);
  for (int i = 0; i < n; i++) {
    blur.set("nodes["+i+"]", nodes[i]);
  }
  blur.set("n", n);

  shader(blur);
  noStroke();
  rect(0, 0, width, height);

  if (keyPressed)
    save(millis()+"out.png");
}

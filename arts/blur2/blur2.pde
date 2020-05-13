PShader blur;
PImage bg;

int n = 10;
PVector[] nodes = new PVector[n];

void setup() {
  size(1000, 1000, P2D);
  blur = loadShader("blur.glsl");
  bg = loadImage("bg2.png");
  for (int i = 0; i < n; i++) {
    nodes[i] = new PVector(random(width), random(height));
  }
}

void draw() {
  blur.set("screen", bg);

  blur.set("n", n);
  for (int i = 0; i < n; i++) {
    blur.set("nodes["+i+"]", nodes[i]);
  }

  shader(blur);

  noStroke();
  rect(0, 0, width, height);
}

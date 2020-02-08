PShader colorShader;
PImage lastScreen;
PImage random;


int lx, ly;

void setup() {
  size(1000, 1000, P2D);
  colorMode(RGB, 1.0);

  frameRate(60);
  background(0);
  
  //PImage start = loadImage("etched.png");
  //image(start, 0, 0, width, height);
  fill(1);

  random = createImage(50, 50, RGB);
  random.loadPixels();
  for (int i = 0; i < random.pixels.length; i++) {
    random.pixels[i] = color(random(1), random(1), random(1));
    //random.pixels[i] = color(random(1));
  }
  random.updatePixels();

  //ellipse(500, 500, 100, 100);
  lastScreen = get();
  colorShader = loadShader("frag.glsl", "vert.glsl");
  lx = mouseX;
  ly = mouseY;
}


void draw() {
  //colorMode(RGB, 1.0);
  //random.loadPixels();
  //for(int i = 0; i < random.pixels.length; i++){
  //  random.pixels[i] = color(random(1), random(1), random(1));
  //}
  //random.updatePixels();

  resetShader();
  image(random, 0, 0, width, height);


  colorShader.set("screen", lastScreen);
  colorShader.set("random", random);
  //colorShader.set("random", new PVector(random(0, 1), random(0, 1)));
  noStroke();
  shader(colorShader);
  //beginShape(QUADS);

  //vertex(0, 0);
  //vertex(width, 0);
  //vertex(width, height);
  //vertex(0, height);
  //endShape();
  rect(0, 0, width, height);
  //if (frameCount > 5)
  //noLoop();
  resetShader();
  colorMode(HSB, 1.0);
  //fill(lerpColor(#B916F5, #E89B36, random(1)), random(1));
  fill(1);
  //float size = random(50);
  //ellipse(random(width), random(height), size, size);

  if (mousePressed) {
    //fill(1);
    ellipse(mouseX, mouseY, 100, 100);

    //strokeWeight(25);
    //line(mouseX, mouseY, lx, ly);
  }

  lastScreen = get();
  lx = mouseX;
  ly = mouseY;
}
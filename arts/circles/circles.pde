PGraphics g;

void setup() {
  size(1000, 1000);
  colorMode(HSB, 1.0);
  //noSmooth();
  g = createGraphics(10000, 10000);
  
  g.beginDraw();
  g.colorMode(HSB, 1.0);
  g.background(0);
  g.endDraw();
  frameRate(1000);
}

void draw() {

  if (keyPressed && key == 's') {
    println("Saving");
    g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
  
  g.beginDraw();
  g.colorMode(HSB, 1.0);

  float x = random(0, g.width);
  float y = random(0, g.height);

  float dist = dist(x, y, g.width/2, g.height/2);

  color c = color(1);

  if (dist < 2500) {
    c = color(1-dist/12500);
  } else {
    c = color(255.0/360, 1, dist/20000);
  }

  g.stroke(c);
  g.fill(c);


  float r = min(abs(dist-2500), (random(0, 1000)));
  //println(r);
  g.ellipse(x, y, r, r);
  //point(x, y);
  
  g.endDraw();
  
  image(g, 0, 0, width, height);
}
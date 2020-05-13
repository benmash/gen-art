int n = 100000;
PVector[] p = new PVector[n];
PVector[] v = new PVector[n];
float scale = 0.0001;

PGraphics g;

void setup() {
  size(1000, 1000);
  g = createGraphics(10000, 10000);
  g.noSmooth();
  g.beginDraw();
  g.background(0);
  g.endDraw();
  frameRate(60);

  for (int i = 0; i < n; i++) {
    p[i] = new PVector(random(g.width), random(g.height));
    v[i] = new PVector();
  }
  //noLoop();
}

void draw() {
  println(frameCount);
  //background(0);

  if (keyPressed && key == 's') {
    println("saveing");
    g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }

  g.beginDraw();
  for (int i = 0; i < n; i++) {
    if (!(p[i].x > 0 && p[i].x < g.width && p[i].y > 0 && p[i].y < g.height)) {
      p[i].set(random(g.width), random(g.height));
      v[i].set(0, 0);
    }


    v[i].add(noise(p[i].x*scale, p[i].y*scale, 0)-0.5, noise(p[i].x*scale, p[i].y*scale, 1)-0.5);
    v[i].limit(5);
    p[i].add(v[i]);
    g.stroke(255);
    g.point(p[i].x, p[i].y);
  }
  g.endDraw();
 

  if (frameCount%100==0)
    image(g, 0, 0, width, height);
}

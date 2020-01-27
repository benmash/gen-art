PGraphics g;


void setup() {

  size(1000, 1000);
  g = createGraphics(10000, 10000);
  g.noSmooth();
  g.beginDraw();
  g.background(255);
  g.endDraw();
}


void draw() {
  g.beginDraw();

  int f = frameCount*25;
  println(f);

  PVector a = new PVector(min(f, 10000), max(f-10000, 0));
  PVector c = new PVector(max(f-10000, 0), min(f, 10000));

  PVector b = PVector.lerp(a, c, 0.5).add(frameCount, frameCount);





  float t = 0;
  float step = 10/a.dist(c);

  while (t <= 1) {
    PVector d = PVector.lerp(a, b, t);
    PVector e = PVector.lerp(b, c, t);

    PVector p = PVector.lerp(d, e, t);

    g.stroke(0);
    g.point(p.x, p.y);

    t += step;
  }

  g.endDraw();

  image(g, 0, 0, width, height);

  if (f > 20000) {
    println("saving");

    g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
}
PVector p0;
PVector p1;
PVector p2;
float t = 0;
PVector v = new PVector();

void setup() {
  //size(600, 600);
  fullScreen();
  frameRate(60);
  noSmooth();
  background(255);
  p0 = new PVector(width*0.25, height*0.75);
  p1 = new PVector(width*0.5, height*0.5);
  p2 = new PVector(width*0.75, height*0.75);
}

void draw() {
  noStroke();
  fill(255, 2.5);
  //filter(BLUR);
  blendMode(ADD);
  rect(0, 0, width, height);
  blendMode(BLEND);

  p1.add(random(-10, 10), random(-10, 10));
  p1.x = constrain(p1.x, 0, width);
  p1.y = constrain(p1.y, 0, height);
  //background(255);

  v.add(PVector.sub(p2, p0).limit(5));
  v.sub(PVector.sub(p0, p1).limit(5));

  p0.add(v);
  p0.x = constrain(p0.x, 0, width);
  p0.y = constrain(p0.y, 0, height);

  p2.sub(v);
  p2.x = constrain(p2.x, 0, width);
  p2.y = constrain(p2.y, 0, height);

  //stroke(random(0, 255), random(0, 255), random(0, 255));
  stroke(0);

  PVector pl = p0;
  for (float t = 0; t <= 1; t+=0.01) {
    //stroke(random(0, 100), random(0, 100), random(0, 100));
    stroke(0);
    PVector p01 = PVector.lerp(p0, p1, t);
    PVector p12 = PVector.lerp(p1, p2, t);
    PVector p = PVector.lerp(p01, p12, t);
    line(p.x, p.y, pl.x, pl.y);
    pl = p;
  }

  //line(p0.x, p0.y, p1.x, p1.y);
  //line(p1.x, p1.y, p2.x, p2.y);
  //ellipse(p01.x, p01.y, 5, 5);
  //ellipse(p12.x, p12.y, 5, 5);
}
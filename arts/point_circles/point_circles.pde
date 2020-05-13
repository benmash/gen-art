PVector[] points = new PVector[100];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
  }

  background(0);
}

void draw() {
  //background(0);
  stroke(255);
  PVector c = points[(int)random(points.length)];
  
  PVector o = points[(int)random(points.length)];
  
  o.sub(c).limit(100).add(c);
  
  
  //point(c.x, c.y);
  //point(o.x, o.y);
  line(c.x, c.y, o.x, o.y);
  
  
}

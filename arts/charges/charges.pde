ArrayList<Point> points = new ArrayList<Point>();
float k = 1;
color[] colors = {#FF0000, #00FF00, #0000FF};

void setup() {
  size(1000, 1000);
  background(0);
  //colorMode(ADD);

  for (int i = 0; i < 1000; i++) {
    points.add(new Point());
  }
}

void draw() {
  

  for (Point p : points) {
    p.push();
  }

  for (Point p : points) {
    p.move();
  }

  for (Point p : points) {
    stroke(colors[frameCount%3], 10);
    noFill();
    ellipse(p.pos.x, p.pos.y, 5, 5);
  }
}



class Point {
  PVector pos, p;
  float m, q;
  color c;

  public Point() {

    pos = new PVector(random(0, 1000), random(0, 1000));
    p = new PVector(0, 0);

    m = random(1, 10);
    q = random(-5, 5);
    c = colors[(int)random(3)];
  }

  public void push() {
    for (Point o : points) {

      PVector f = PVector.sub(pos, o.pos);
      float r = f.magSq();

      if (r > 0) {
        f.setMag((k * q * o.q)/r);

        p.add(f);
      }
    }
  }

  public void move() {
    pos.add(PVector.div(p, m));
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
}
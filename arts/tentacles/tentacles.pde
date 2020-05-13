ArrayList<ArrayList<PVector>> worms = new ArrayList<ArrayList<PVector>>();
ArrayList<Float> angles = new ArrayList<Float>();

void setup() {
  for (int i = 0; i < 15; i++) {
    worms.add(new ArrayList<PVector>());
    angles.add(random(0, 360));
  }
  for (ArrayList<PVector> points : worms) {

    for (int j = 0; j < 10; j++) {
      PVector p = PVector.random2D().mult(400).add(500, 500);
      points.add(p.copy());
    }
  }
  size(1000, 1000);
  background(0);
}

void draw() {
  //println(frameCount);
  //if (frameCount<200)
  background(0);

  stroke(255);
  noFill();
  ellipse(500, 500, 1000, 1000);
  for (int ar = 0; ar < worms.size(); ar++) {
    float angle = angles.get(ar);
    ArrayList<PVector> points = worms.get(ar);

    //angle += random(-10, 10);
    /*int loops = 0;
     while (loops++ < 100 && !collide(PVector.add(points.get(0), PVector.fromAngle(radians(angle)).mult(25))))
     angle += random(-10, 10);*/

    int left = 14;
    while (left++ < 100 && collide(PVector.add(points.get(0), PVector.fromAngle(radians(angle+(left%2==0?30:90))).mult(left)), points.get(0)));



    int right = 14;
    while (right++ < 100 && collide(PVector.add(points.get(0), PVector.fromAngle(radians(angle-(right%2==0?30:90))).mult(right)), points.get(0)));


    if (left > right)
      angle += random(15);
    else if (left < right)
      angle -= random(15);
    else
      angle += random(-5, 5)*2;

    //if (collide(PVector.add(points.get(0), PVector.fromAngle(radians(angle))), points.get(0)))
    points.get(0).add(PVector.fromAngle(radians(angle)));

    ellipse(points.get(0).x, points.get(0).y, 25, 25);

    for (int i = 1; i < points.size(); i++) {
      if (points.get(i).dist(points.get(i-1)) > 25) {
        PVector v = PVector.sub(points.get(i), points.get(i-1)).limit(25);
        points.get(i).set(PVector.add(points.get(i-1), v));
      } 
      ellipse(points.get(i).x, points.get(i).y, 25, 25);
    }

    angles.set(ar, angle);
  }
}

boolean collide(PVector p, PVector exclude) {
  //stroke(color(255, 0, 0));
  //point(p.x, p.y);
  //stroke(255);
  for (ArrayList<PVector> points : worms) 
    for (PVector v : points) {
      if (!p.equals(exclude) && p.dist(v) < 13)
        return false;
    }

  return p.dist(new PVector(500, 500)) < 500;
}

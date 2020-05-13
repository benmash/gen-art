int num = 10;
PVector[] points = new PVector[num];
int[] pivot = new int[num];
float[] r = new float[num];
float[] theta = new float[num];
float[] v = new float[num];


void setup() {
  size(1000, 1000);

  for (int i = 0; i < num; i++) {
    points[i] = new PVector(random(200, 800), random(200, 800));
    pivot[i] = (int)random(i);
    pivot[i] = (random(1)>0.9) ? i : pivot[i];
    //pivot[i] = max(0, i-1);
    theta[i] = atan2(points[pivot[i]].y-points[i].y, points[pivot[i]].x-points[i].x);
    r[i] = points[i].dist(points[pivot[i]]);
    //r[i] = 50;
    if (pivot[i] == i)
      r[i] = 0;
    v[i] = random(-2, 2)/2;
    //v[i] = i/50.0;
  }
  background(0);
}

void draw() {
  background(0);
  stroke(255);
  noFill();

  for (int i = 0; i < num; i++) {

    theta[i] += radians(v[i]);
    PVector offset = PVector.fromAngle(theta[i]).mult(r[i]);
    points[i] = PVector.add(points[pivot[i]], offset);
    //point(points[i].x, points[i].y);
    line(points[i].x, points[i].y, points[pivot[i]].x, points[pivot[i]].y);
    //ellipse(points[i].x, points[i].y, r[i], r[i]);
    ellipse(points[pivot[i]].x, points[pivot[i]].y, r[i], r[i]);
  }
}

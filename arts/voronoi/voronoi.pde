PVector[] nodes = new PVector[10];
ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(1000, 1000, P3D);
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new PVector(random(-5, 5), random(-5, 5), random(-5, 5));
  }
}

void draw() {
  background(0);

  PVector p = new PVector(random(-5, 5), random(-5, 5), random(-5, 5));

  int first = 0, second = 0, third = 0;
  for (int i = 0; i < nodes.length; i++) {
    if (p.dist(nodes[i]) < p.dist(nodes[first])) {
      first = i;
    }
  }
  for (int i = 0; i < nodes.length; i++) {
    if (p.dist(nodes[i]) < p.dist(nodes[first]) && i != first) {
      second = i;
    }
  }
  for (int i = 0; i < nodes.length; i++) {
    if (p.dist(nodes[i]) < p.dist(nodes[first]) && i != first && i != second) {
      third = i;
    }
  }
  
  p.set(PVector.add(nodes[first], PVector.add(nodes[second], nodes[third])).div(3));
  points.add(p);
  
  stroke(255);
  
  translate(500, 500);
  for(PVector point: points){
    translate(point.x*100, point.y*100, point.z*100);
    strokeWeight(1);
    point(0, 0);
    translate(-point.x*100, -point.y*100, -point.z*100);
  }
  
  for (int i = 0; i < nodes.length; i++) {
    PVector point = nodes[i];
    translate(point.x*100, point.y*100, point.z*100);
    strokeWeight(5);
    point(0, 0);
    translate(-point.x*100, -point.y*100, -point.z*100);
  }
}

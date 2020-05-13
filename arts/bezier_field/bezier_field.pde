PVector[] pos = new PVector[100];
PVector[] v = new PVector[pos.length];

PVector a, b, c;
float t = 0;
int cycle = 0;

void setup() {
  size(1000, 1000);
  smooth(8);
  for (int i = 0; i < pos.length; i++) {
    pos[i] = new PVector(random(width), random(height));
    v[i] = new PVector();
  }

  a = new PVector(random(width), random(height));
  b = new PVector(random(width), random(height));
  c = new PVector(random(width), random(height));

  background(0);
}


void draw() {
  stroke(255, 1);
  strokeWeight(1);
  noFill();
  //a.add(PVector.random2D());

  for (int i = 0; i < pos.length; i++) {
    float dx = bezierTangent(pos[i].x, a.x, b.x, c.x, t*0.01);
    float dy = bezierTangent(pos[i].y, a.y, b.y, c.y, t*0.01);
    bezier(pos[i].x, pos[i].y, a.x, a.y, b.x, b.y, c.x, c.y);
    v[i].add(dx*0.05, dy*0.05).limit(5);
    pos[i].add(v[i]);
    point(pos[i].x, pos[i].y);
  }

  t++;
  if (t > 100) {
    cycle++;
    save("stills/"+cycle+".png");
    t = 0;
    a = new PVector(random(width), random(height));
    b = new PVector(random(width), random(height));
    c = new PVector(random(width), random(height));
    background(0);
    for (int i = 0; i < pos.length; i++) {
      pos[i] = new PVector(random(width), random(height));
      v[i] = new PVector();
    }
  }
  println(cycle +": "+ t);
  saveFrame("vid/frame#####.tif");
  if (cycle == 10) {
    exit();
  }
}

PVector[] p = new PVector[32];
PVector[] next = new PVector[p.length];
float t = 0;

void setup() {
  size(1000, 1000);
  for (int i = 0; i < p.length-1; i++) {
    p[i] = new PVector(random(50, 950), random(50, 950));
    next[i] = new PVector(random(50, 950), random(50, 950));
    //next[i] = new PVector(p[i].x+random(-100, 100), p[i].y+random(-100, 100));
  }

  p[p.length-1] = p[0].copy();
  p[p.length-2] = p[1].copy();

  //next[p.length-1] = next[0].copy();
  //next[p.length-2] = next[1].copy();
  //next[p.length-3] = next[2].copy();
  //next[p.length-4] = next[3].copy();

  background(0);
}


void draw() {
  background(0);
  t += 0.001;
  for (int i = 0; i < p.length-1; i++) {
    p[i] = PVector.lerp(p[i], next[i], t);
  }

  if (t >= 0.1) {
    t = 0;
    for (int i = 0; i < p.length-1; i++) {

      next[i] = new PVector(random(50, 950), random(50, 950));
      //next[i] = new PVector(p[i].x+random(-100, 100), p[i].y+random(-100, 100));
    }
    //next[p.length-1] = next[0].copy();
    //next[p.length-2] = next[1].copy();
    //next[p.length-3] = next[2].copy();
    //next[p.length-4] = next[3].copy();
  }

  stroke(255);
  noFill();
  for (int i = 0; i < p.length-3; i+=2) {
    PVector a = new PVector((p[i].x + p[i+1].x)/2, (p[i].y + p[i+1].y)/2);
    PVector b = new PVector(p[i+1].x, p[i+1].y);
    PVector c = new PVector(p[i+2].x, p[i+2].y);
    PVector d = new PVector((p[i+2].x + p[i+3].x)/2, (p[i+2].y + p[i+3].y)/2);

    //if(i == p.length-4){
    //  d = new PVector((p[0].x + p[1].x)/2, (p[0].y + p[1].y)/2);
    //  c = new PVector(p[1].x, p[1].y);
    //}


    bezier(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
  }

  PVector a = new PVector((p[0].x + p[1].x)/2, (p[0].y + p[1].y)/2);
  PVector b = new PVector(p[0].x, p[0].y);
  PVector c = new PVector(p[p.length-1].x, p[p.length-1].y);
  PVector d = new PVector((p[p.length-2].x + p[p.length-1].x)/2, (p[p.length-2].y + p[p.length-1].y)/2);
  bezier(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
}

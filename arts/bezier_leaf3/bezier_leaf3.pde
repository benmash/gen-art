PVector[] p = new PVector[32];
float[] last = new float[p.length];
float[] a = new float[p.length];
float[] next = new float[a.length];
//PVector[] next = new PVector[p.length];
float t = 0;

void setup() {
  size(1000, 1000);
  smooth(8);
  for (int i = 0; i < a.length; i++) {
    //p[i] = new PVector(random(50, 950), random(50, 950));
    a[i] = radians(0);
    last[i] = a[i];
    next[i] = radians(i*100%360);
    //next[i] = new PVector(random(50, 950), random(50, 950));
    //next[i] = new PVector(p[i].x+random(-100, 100), p[i].y+random(-100, 100));
  }


  //next[p.length-1] = next[0].copy();
  //next[p.length-2] = next[1].copy();
  //next[p.length-3] = next[2].copy();
  //next[p.length-4] = next[3].copy();

  background(0);
}


void draw() {
  background(0);


  stroke(255);
  noFill();
  //t+=0.005-(0.0025*(1-t))-(0.0045*t);
  t += 0.005- (0.004*t);

  for (int i = 0; i < p.length; i++) {
    float angle = curvePoint(last[i], a[i], next[i], next[i], t);
    p[i] = PVector.fromAngle(angle).mult(400).add(500, 500);
    strokeWeight(2);
    point(p[i].x, p[i].y);
  }

  if (t >= 1) {
    t = 0;
    int circles = 360 * ((int)random(3) + 1); 
    for (int i = 0; i < a.length; i++) {
      last[i] = a[i];
      a[i] = next[i];
      //next[i] = radians(random(360));
      next[i] = radians((i*frameCount)%circles);
    }
  }

  for (int i = 0; i < p.length-3; i+=2) {
    PVector a = new PVector((p[i].x + p[i+1].x)/2, (p[i].y + p[i+1].y)/2);
    PVector b = new PVector(p[i+1].x, p[i+1].y);
    PVector c = new PVector(p[i+2].x, p[i+2].y);
    PVector d = new PVector((p[i+2].x + p[i+3].x)/2, (p[i+2].y + p[i+3].y)/2);

    //if(i == p.length-4){
    //  d = new PVector((p[0].x + p[1].x)/2, (p[0].y + p[1].y)/2);
    //  c = new PVector(p[1].x, p[1].y);
    //}

    strokeWeight(1);
    bezier(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
  }
  /*
  PVector a = new PVector((p[0].x + p[1].x)/2, (p[0].y + p[1].y)/2);
   PVector b = new PVector(p[0].x, p[0].y);
   PVector c = new PVector(p[p.length-1].x, p[p.length-1].y);
   PVector d = new PVector((p[p.length-2].x + p[p.length-1].x)/2, (p[p.length-2].y + p[p.length-1].y)/2);
   bezier(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
   */
  saveFrame("frames/########.png");
  println(frameCount);
  if (frameCount > 10000 && t == 0)
    exit();
}

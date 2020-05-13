ArrayList<PVector[]> lines = new ArrayList<PVector[]>();
ArrayList<PVector> points = new ArrayList<PVector>();
int next = 1, last = 0;
float t = 0;
PrintWriter out;

void setup() {
  //out = createWriter("output_"+random(10000000)+".obj");
  size(1000, 1000, P3D);
  //noSmooth();
  for (int i = 0; i < 10; i++) {
    PVector[] ps = {new PVector(random(-100, 100), random(-100, 100), random(-100, 100)), new PVector(random(-100, 100), random(-100, 100), random(-100, 100))};
    //ps[0].setMag(100);
    //ps[1].sub(ps[0]).limit(10).add(ps[0]).setMag(100);
    //ps[1].setMag(100);

    lines.add(ps);
  } 
  background(0);
}

void draw() {
  background(0);
  PVector cam = new PVector(250*cos(frameCount*0.01), 0, 250*sin(frameCount*0.01));
  camera(cam.x, cam.y, cam.z, 0, 0, 0, 0, 1, 0);
  stroke(255);

  PVector l = lines.get(last)[1];
  PVector ll = PVector.lerp(lines.get(last)[0], l, 0.5);
  PVector n = lines.get(next)[0];
  PVector nn = PVector.lerp(lines.get(next)[1], n, 0.5);

  float x = bezierPoint(ll.x, l.x, n.x, nn.x, t);
  float y = bezierPoint(ll.y, l.y, n.y, nn.y, t);
  float z = bezierPoint(ll.z, l.z, n.z, nn.z, t);

  //out.println("v " + x + " " + y + " " + z);

  points.add(new PVector(x, y, z));
  //point(x, y, z);
  t += 0.01;  

  if (t >= 1) {
    t = 0;
    last = next;
    while (next == last)
      next = (int)random(lines.size());
  }

  for (PVector[] ps : lines) {
    //line(ps[0].x, ps[0].y, ps[0].z, ps[1].x, ps[1].y, ps[1].z);
  }

  for (int i = 0; i<points.size(); i++) {
    PVector p = points.get(i);
    //PVector lp = points.get(i-1);
    //stroke(constrain(300-cam.dist(p), 0, 255)*2);
    //strokeWeight(5);

    //line(p.x, p.y, p.z, lp.x, lp.y, lp.z);

    point(p.x, p.y, p.z);
  }

  saveFrame("frames/#####.png");
  if (frameCount > (60*60) && t == 0)
    exit();
  /*
  if (keyPressed && key == 's') {
   out.print("l ");
   for (int i = 0; i < points.size(); i++) {
   out.print((i+1) + " ");
   }
   out.flush();
   out.close();
   exit();
   }
   */
}

PVector[] points = new PVector[1000];
ArrayList<PVector[]> tris = new ArrayList<PVector[]>();

void setup() {
  size(1000, 1000, P3D);

  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
  }
  background(0);
}

void draw() {
  background(0);
  camera(100*sin(frameCount*0.01), 0, 100*cos(frameCount*0.01), 0, 0, 0, 0, 1, 0);

  //int ci = (int)random(points.length);
  //int ai= -1, bi= -1;
  //float dist = 10000000;
  //for (int i = 0; i < points.length; i++) {
  //  if (i != ci && points[i].dist(points[ci]) < dist) {
  //    dist = points[i].dist(points[ci]);
  //    ai = i;
  //  }
  //}
  //dist = 10000000;
  //for (int i = 0; i < points.length; i++) {
  //  if (i != ci && i != ai && points[i].dist(points[ci]) < dist && points[ai].dist(points[i]) > 0.5) {
  //    dist = points[i].dist(points[ci]);
  //    bi = i;
  //  }
  //}

  PVector a = points[frameCount];
  PVector b = points[frameCount+1];
  PVector c = points[frameCount+2];


  PVector ab = PVector.sub(b, a);
  PVector ac = PVector.sub(c, a);

  b.set(PVector.add(a, ab.setMag(1)));

  PVector n = ab.cross(ac);

  PVector k = ab.copy().mult(-1).normalize();

  PVector t = k.cross(n).add(PVector.mult(k, k.dot(n)));
  PVector p = PVector.lerp(a, b, 0.5).add(t.setMag(1*sqrt(0.75)));
  c.set(p);
  

  stroke(255);

  PVector[] newTri = {a.copy(), b.copy(), c.copy()};
  tris.add(newTri);

  for (PVector[] tri : tris) {
    line(tri[0].x, tri[0].y, tri[0].z, tri[1].x, tri[1].y, tri[1].z);
    line(tri[1].x, tri[1].y, tri[1].z, tri[2].x, tri[2].y, tri[2].z);
    line(tri[2].x, tri[2].y, tri[2].z, tri[0].x, tri[0].y, tri[0].z);
  }

  if (keyPressed || frameCount + 3 >= points.length) {
    PrintWriter out = createWriter(millis() + ".obj");
    String lines = "";
    int i = 0;
    for (PVector[] tri : tris) {
      for (int j = 0; j < 3; j++) {
        out.println("v " + tri[j].x + " " + tri[j].y + " " + tri[j].z);
        i++;
      }
      lines += "f " + (i-2) + " " + (i-1) + " " + i + "\n";
    }
    out.println(lines);
    out.flush();
    out.close();
    exit();
    
  }

  //line(p.x, p.y, p.z, p.x+t.x, p.y+t.y, p.z+t.z);
}

//k x v + k(k dot v)

ArrayList<PVector[]> faces = new ArrayList<PVector[]>();
ArrayList<PVector[]> extrude = new ArrayList<PVector[]>();
PrintWriter out;
int vert = 0;

void setup() {
  //frameRate(1);
  size(1000, 1000, P3D);
  //PVector[] face = {new PVector(1, 0), new PVector(-1, 0), new PVector(0, sqrt(3))};
  int points = 10;
  float r = 1;
  PVector[] face = new PVector[points];
  for (int a = 0; a < points; a++) {
    float angle = (a/(float)points)*360;
    face[a] = PVector.fromAngle(radians(angle)).mult(r);
  }

  faces.add(face);
  extrude.add(face);

  background(255);
  out = createWriter(random(0, 10000)+".obj");
  output(face);
  
  PVector p1 = new PVector(1, 0, 0);
  PVector p2 = new PVector(2, 0, 100);
  println(closestPoint(new PVector(-10, 10, 0), p1, p2));
}

void draw() {
  //PVector[] f = extrude.remove((int)random(extrude.size()));
  PVector[] f = extrude.remove(0);
  //faces.remove(f);
  PVector ab = PVector.sub(f[1], f[0]);
  PVector ac = PVector.sub(f[2], f[0]);
  PVector n = ab.cross(ac).normalize();
  
  //tilt
  PVector[] tilt = new PVector[f.length];
  int pivot = (int)random(tilt.length);
  float angle = random(radians(45));
  
  PVector ta = f[pivot].copy();
  PVector tb = f[(pivot+1)%tilt.length].copy();
  
  for(int i = 0; i < f.length; i++){
    //float d = lineDist(f[i], ta, tb);
    
    PVector closest = closestPoint(f[i], ta, tb);
    float d = closest.dist(f[i]);
    //println(d-closest.dist(f[i]));
    //println(d-closest.dist(f[i]));
    tilt[i] = f[i].copy().add(PVector.mult(n, d*sin(angle)));
    tilt[i].sub(PVector.sub(tilt[i], closest).setMag(d*(1-cos(angle))));
    float d2 = lineDist(tilt[i], ta, tb);
    //println(d-d2);
  }
  
  f = tilt;
  

  
  //extrude
  ab = PVector.sub(f[1], f[0]);
  ac = PVector.sub(f[2], f[0]);
  float h = random(3, 10);
  //float h = 5;
  n = ab.cross(ac).setMag(h);
  PVector[] f2 = new PVector[f.length];

  PVector t = new PVector();
  
  PVector[] ex = new PVector[f.length];
  PVector exn = n.copy().setMag(random(h-3));

  for (int i = 0; i < f.length; i++) {
    f2[i] = f[i].copy().add(n);
    ex[i] = f[i].copy().add(exn);
    t.add(f[i]);
  }
  
  extrude.add(ex);

  t.div(f.length).add(n.setMag(h + sqrt(3)));
  //t.div(f.length).add(n.setMag(h + sqrt(sqrt(3))));
  //t.div(f.length).add(n.setMag(h * 1.1));

  //faces.add(f2);



  for (int i = 0; i < f.length; i++) {
    PVector[] fs = {f[i], f[(i+1)%f.length], f2[(i+1)%f.length], f2[i]};
    faces.add(fs);
    output(fs);

    PVector[] fs2 = {f2[i], f2[(i+1)%f.length], t};
    faces.add(fs2);
    output(fs2);
  }


  background(255);
  camera(50*cos(frameCount*0.01), 100, 50*sin(frameCount*0.01), 0, 0, 0, 0, 1, 0);
  stroke(0);
  fill(255);

  for (PVector[] face : faces) {
    beginShape();
    for (int i = 0; i < face.length; i++)
      vertex(face[i].x, face[i].y, face[i].z);
    endShape(CLOSE);
  }

  if (keyPressed) {
    out.flush();
    out.close();
    exit();
  }
}

void output(PVector[] f) {
  String face = "f";
  for (int i = 0; i < f.length; i++) {
    vert++;
    out.println("v " + f[i].x + " " + f[i].y + " " + f[i].z);
    face += " " + vert;
  }
  out.println(face);
}

float lineDist(PVector p, PVector a, PVector b) {
  
  return PVector.sub(b, a).cross(PVector.sub(a, p)).mag() / PVector.sub(b, a).mag();
}

PVector closestPoint(PVector p, PVector a, PVector b){
  PVector ab = PVector.sub(b, a);
  PVector ap = PVector.sub(p, a);
  float t = ap.dot(ab)/ab.mag();
  println(t);
  //l = constrain(l, 0, a.dist(b));
  return PVector.lerp(a, b, t);
}

//float radius(PVector[] face){


//}

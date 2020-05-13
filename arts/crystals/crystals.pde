ArrayList<PVector[]> faces = new ArrayList<PVector[]>();
ArrayList<PVector[]> extrude = new ArrayList<PVector[]>();
PrintWriter out;
int vert = 0;

void setup() {
  size(1000, 1000, P3D);
  //PVector[] face = {new PVector(1, 0), new PVector(-1, 0), new PVector(0, sqrt(3))};
  int points = 10;
  float r = 1;
  PVector[] face = new PVector[points];
  for(int a = 0; a < points; a++){
    float angle = (a/(float)points)*360;
    face[a] = PVector.fromAngle(radians(angle)).mult(r);
  }
  
  faces.add(face);
  extrude.add(face);
  
  background(255);
  out = createWriter(random(0, 10000)+".obj");
  output(face);
}

void draw() {
  //PVector[] f = extrude.remove((int)random(extrude.size()));
  PVector[] f = extrude.remove(0);
  faces.remove(f);
  PVector ab = PVector.sub(f[1], f[0]);
  PVector ac = PVector.sub(f[2], f[0]);
  //float h = random(1, 2);
  float h = 5;
  PVector n = ab.cross(ac).setMag(h);
  PVector[] f2 = new PVector[f.length];
  
  PVector t = new PVector();
  
  for (int i = 0; i < f.length; i++){
    f2[i] = f[i].copy().add(n);
    t.add(f[i]);
  }
  
  t.div(f.length).add(n.setMag(h + sqrt(3)));
  //t.div(f.length).add(n.setMag(h + sqrt(sqrt(3))));
  //t.div(f.length).add(n.setMag(h * 1.1));
    
  //faces.add(f2);
  
  
  
  for(int i = 0; i < f.length; i++){
    PVector[] fs = {f[i], f[(i+1)%f.length], f2[(i+1)%f.length], f2[i]};
    faces.add(fs);
    output(fs);
    
    PVector[] fs2 = {f2[i], f2[(i+1)%f.length], t};
    faces.add(fs2);
    extrude.add(fs2);
    output(fs2);
  }


  background(255);
  camera(100*cos(frameCount*0.01), 100, 100*sin(frameCount*0.01), 0, 0, 0, 0, 1, 0);
  stroke(0);
  fill(255);

  for (PVector[] face : faces) {
    beginShape();
    for (int i = 0; i < face.length; i++)
      vertex(face[i].x, face[i].y, face[i].z);
    endShape(CLOSE);
  }
  
  if(keyPressed){
    out.flush();
    out.close();
    exit();
  }
}

void output(PVector[] f){
  String face = "f";
  for(int i = 0; i < f.length; i++){
    vert++;
    out.println("v " + f[i].x + " " + f[i].y + " " + f[i].z);
    face += " " + vert;
  }
  out.println(face);
}

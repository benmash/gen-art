PrintWriter out;

void setup() {
  size(600, 600, P3D);
  out = createWriter("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".obj");
}

void draw() {

  PVector[][] v = new PVector[2][4];
  for (int i = 0; i < 4; i++) {
    v[0][i] = PVector.random3D().mult(5);
    v[1][i] = PVector.random3D().mult(5);
  }


  PVector a, b, c, d, e, p, p2;
  float t = 0;
  int n = 2;
  while (t <= 1) {
    a = PVector.lerp(v[0][0], v[0][1], t);
    b = PVector.lerp(v[0][1], v[0][2], t);
    c = PVector.lerp(v[0][2], v[0][3], t);

    d = PVector.lerp(a, b, t);
    e = PVector.lerp(b, c, t);

    p = PVector.lerp(d, e, t);

    a = PVector.lerp(v[1][0], v[1][1], t);
    b = PVector.lerp(v[1][1], v[1][2], t);
    c = PVector.lerp(v[1][2], v[1][3], t);

    d = PVector.lerp(a, b, t);
    e = PVector.lerp(b, c, t);

    p2 = PVector.lerp(d, e, t);

    out.println("v " + p.x + " " + p.y + " " + p.z + " 1.0");
    out.println("v " + p2.x + " " + p2.y + " " + p2.z + " 1.0");
    if (n > 3) {
      out.println("f " + n + " " + (n-3) + " " + (n-1));
      out.println("f " + n + " " + (n-3) + " " + (n-2));
    }

    t += 0.001;
    n+=2;
  }

  out.flush();
  out.close();
  exit();
}
ArrayList<PVector[]> lines = new ArrayList<PVector[]>();

void setup() {
  size(1000, 1000, P3D);


  for (int i = 0; i < 3; i++) {
    PVector[] ps = {new PVector(random(-100, 100), random(-100, 100), random(-100, 100)), new PVector(random(-100, 100), random(-100, 100), random(-100, 100))};
    lines.add(ps);
  }

  background(0);

  PrintWriter out = createWriter("output_"+random(10000000)+".obj");
  String c = "";
  int i = 1;

  for (int a = 0; a < lines.size(); a++) {
    for (int b = 0; b < lines.size(); b++) {
      if (a != b) {
        PVector l = lines.get(a)[1];
        PVector ll = PVector.lerp(lines.get(a)[0], l, 0.5);
        PVector n = lines.get(b)[0];
        PVector nn = PVector.lerp(lines.get(b)[1], n, 0.5);

        float t = 0;
        while (t <= 20) {
          float x = bezierPoint(ll.x, l.x, n.x, nn.x, t/20.0);
          float y = bezierPoint(ll.y, l.y, n.y, nn.y, t/20.0);
          float z = bezierPoint(ll.z, l.z, n.z, nn.z, t/20.0);
          out.println("v " + x + " " + y + " " + z);
          if (t < 20) {
            c += "l " + i + " " + (i+1) + "\n";
          } else {
            println("yes");
          }
          i++;
          t+=1;
        }
      }
    }
  }
  out.println(c);
  out.flush();
  out.close();
  exit();
}

void draw() {
}

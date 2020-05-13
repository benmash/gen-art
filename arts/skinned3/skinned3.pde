ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(1000, 1000, P3D);
  for (int i = 0; i < 10; i++) {
    PVector p = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    p.limit(10);
    points.add(p);
  }

  PrintWriter out = createWriter(random(1000)+".obj");
  int count = 0;
  while (count < 10000) {
    println(count);
    PVector p = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    p.limit(10);

    float dist = 100000;
    for (PVector c : points) {
      if (p.dist(c) < dist)
        dist = p.dist(c);
    }
    
    if(random(dist) < 0.01){
      count++;
      out.println("v " + p.x + " " + p.y + " " + p.z);
    }
  }
  
  out.flush();
  out.close();
  exit();
}

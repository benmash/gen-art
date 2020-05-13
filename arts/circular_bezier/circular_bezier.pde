int points = 100;
float step = 0.0025;
PVector[][] p = new PVector[points][points];
float a[] = new float[points];

void setup() {
  size(1000, 1000);
  background(0);
  for (int i = 0; i < p.length; i++) {
    a[i] = radians(random(360));
    p[0][i] = PVector.fromAngle(a[i]).mult(400).add(width/2, height/2);
  }
}


void draw() {
  //background(0);

  for (int i = 0; i < p.length; i++) {
    a[i] += (noise(a[i]*0.01, (i+1)*frameCount*0.005)-0.5) * 0.1;
    p[0][i] = PVector.fromAngle(a[i]).mult(400).add(width/2, height/2);
  }

  float t = 0;
  while (t <= 1) {
    for (int n = points-1; n > 0; n--) {

      int level = points-n;
      int l = level-1;

      for (int i = 0; i < n; i++) {
        p[level][i] = PVector.lerp(p[l][i], p[l][i+1], t);
      }
    }

    g.stroke(255, 127);
    g.point(p[points-1][0].x, p[points-1][0].y);

    t+=step;
  }

  for (int i = 0; i < points; i++) {
    fill(255, 127);
    //if (random(1) > 0.9)
      ellipse(p[0][i].x, p[0][i].y, 5, 5);
  }

  if (keyPressed) {
    save(millis()+"out.png");
    exit();
  }
}

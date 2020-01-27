int points = 10;
float step = 0.005;
float radius;
PVector[][] p = new PVector[points][points];
PVector[] v = new PVector[points];

void setup() {
  //size(600, 600);
  fullScreen();
  frameRate(60);
  background(255);
  
  radius = width/2;
  
  p[0][0] = new PVector(0, 0);
  p[0][p.length-1] = new PVector(width, height);
  for (int i = 1; i < p.length-1; i++) {
    p[0][i] = new PVector(random(0, width), random(0, height));
  }

  for (int i = 0; i < points; i++) {
    v[i] = new PVector(random(-10, 10), random(-10, 10));
  }
}

void draw() {
  fill(255, 10);
  //rect(0, 0, width, height);
  background(255);

  for (int i = 0; i < points; i++) {
    p[0][i].add(v[i]); 

    //p[0][i].x = constrain(p[0][i].x, 0, width);
    //p[0][i].y = constrain(p[0][i].y, 0, height);

    //v[i].add(random(-1, 1), random(-1, 1));

    if (p[0][i].dist(new PVector(width/2, height/2)) > radius) {
      v[i].add(PVector.sub(new PVector(width/2, height/2), p[0][i]).limit(1));
    }

    v[i].limit(10);
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

    stroke(0);
    strokeWeight(10);
    point(p[points-1][0].x, p[points-1][0].y);

    t+=step;
  }
  
  fill(0);
  stroke(0);
  for(int i = 0; i < points; i++){
    ellipse(p[0][i].x, p[0][i].y, 10, 10);
  }
  
  
}
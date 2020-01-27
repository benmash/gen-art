int points = 10;
float step = 0.0001;
int frames = 12000;
float radius;
PVector[][] p = new PVector[points][points];
PVector[] v = new PVector[points];
PGraphics g;

void setup() {

  size(600, 600);
  g = createGraphics(20000, 20000);
  //fullScreen();
  frameRate(60);
  noLoop();
  g.beginDraw();
  g.colorMode(HSB, 1.0);
  g.background(1);

  radius = g.width;

  //p[0][0] = new PVector(0, 0);
  //p[0][p.length-1] = new PVector(g.width, g.height);
  for (int i = 0; i < p.length; i++) {
    p[0][i] = new PVector(random(0, g.width), random(0, g.height));
  }

  for (int i = 0; i < points; i++) {
    v[i] = new PVector(random(-10, 10), random(-10, 10));
  }
}

void draw() {

  //float[] q = {random(0, 1), random(0, 1), random(0, 1), random(0, 1), random(0, 1), random(0, 1),}; 
  //g.background(1);


  for (int f = 0; f < frames; f++) {
    println(f);

    //fill(255, 10);
    //rect(0, 0, g.width, g.height);

    for (int i = 0; i < points; i++) {
      p[0][i].add(v[i]); 

      //p[0][i].x = constrain(p[0][i].x, 0, g.width);
      //p[0][i].y = constrain(p[0][i].y, 0, g.height);

      //v[i].add(random(-1, 1), random(-1, 1));

      if (p[0][i].dist(new PVector(g.width/2, g.height/2)) > radius) {
        v[i].add(PVector.sub(new PVector(g.width/2, g.height/2), p[0][i]).limit(1));
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

      //g.stroke(map(t, 0, 1, 1.0/3, 5.0/6), 1.0, 0.5);
      g.stroke(map(t, 0, 1, 0.47, 0.86), 1.0, t);
      //g.stroke(map(t,0,1,q[0],q[1]), map(t,0,1,q[2],q[3]), map(t,0,1,q[4],q[5]));
      g.point(p[points-1][0].x, p[points-1][0].y);

      t+=step;
    }
  }
  println("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
  g.endDraw();
  g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
  exit();
}
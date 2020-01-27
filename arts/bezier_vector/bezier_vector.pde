import processing.svg.*;

int points = 10;
float step = 0.001;
int frames = 600;
float radius;
PVector[][] p = new PVector[points][points];
PVector[] v = new PVector[points];

void settings() {
  //size(1000, 1000, SVG, "out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".svg");
  size(1000, 1000);
}

void setup() {
  //size(100, 100, PDF, "out.pdf");
  //size(1000, 1000, PDF, "out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".pdf");
  println("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".pdf");
  //g = createGraphics(10000, 10000);
  //fullScreen();
  frameRate(60);
  noLoop();
  beginRecord(SVG, "out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".svg");
  colorMode(HSB, 1.0);
  background(1);
  

  radius = width;

  //p[0][0] = new PVector(0, 0);
  //p[0][p.length-1] = new PVector(width, height);
  for (int i = 0; i < p.length; i++) {
    p[0][i] = new PVector(random(0, width), random(0, height));
  }

  for (int i = 0; i < points; i++) {
    v[i] = new PVector(random(-10, 10), random(-10, 10));
  }
}

void draw() {

  //float[] q = {random(0, 1), random(0, 1), random(0, 1), random(0, 1), random(0, 1), random(0, 1),}; 
  //background(1);


  for (int f = 0; f < frames; f++) {
    println(f);

    //fill(255, 10);
    //rect(0, 0, width, height);

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
      
      noStroke();
      //stroke(map(t, 0, 1, 0.05, 0.3), 1.0, 1-t);
      fill(map(t, 0, 1, 0.05, 0.3), 1.0, 1-t);
      //stroke(map(t,0,1,q[0],q[1]), map(t,0,1,q[2],q[3]), map(t,0,1,q[4],q[5]));
      ellipse(p[points-1][0].x, p[points-1][0].y, 1, 1);

      t+=step;
    }
  }
  //println("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
  //save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".svg");
  endRecord();
  println("finished.");
  exit();
}
PVector[] v = new PVector[4];
PVector vel[] = new PVector[4];
float[] size = {15, 10, 10, 15};
PGraphics wheel;


void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB, 1.0);
  noSmooth();

  for (int i = 0; i < v.length; i++) {
    v[i] = PVector.random2D().mult(random(0, 200)).add(300, 300);
    vel[i] = new PVector();
  }

  wheel = createGraphics(400, 400);
  ////wheel.noSmooth();
  //wheel.smooth();
  //wheel.beginDraw();
  //wheel.colorMode(HSB, 1.0);

  //float angle = 0;
  //PVector center = new PVector(wheel.width/2, wheel.height/2);

  //while (angle <= TAU) {

  //  PVector a = PVector.fromAngle(angle).mult(wheel.width/2).add(center);

  //  float r = 0;

  //  while (r <= wheel.width) {

  //    PVector p = PVector.lerp(center, a, r/wheel.width);

  //    wheel.stroke(angle/TAU, r/wheel.width, 1);
  //    wheel.point(p.x, p.y);

  //    r += 1;
  //  }

  //  angle += 1.0/wheel.width;
  //}

  //wheel.endDraw();
}


void draw() {
  int closest = 0;
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);

  //for (int i = 0; i < v.length; i++) {
  //  if (mouse.dist(v[i]) < mouse.dist(v[closest]))
  //    closest = i;
  //}

  //if (mouse.dist(v[closest]) > max(25, size[closest])) {
  //  closest = -1;
  //} else if (mousePressed) {
  //  v[closest].set(mouse);
  //}


  for (int i = 0; i < v.length; i++) {

    vel[i].add(random(-0.1, 0.1), random(-0.1, 0.1));
    //vel[i].limit(0.5);
    //vel[i].add(PVector.sub(center, v[i]).limit(0.01));
    v[i].add(vel[i]);

    /* if (v[i].dist(center) > 200 && (i == 0 || i == 3)) {
     v[i].sub(300, 300);
     v[i].limit(200);
     v[i].add(300, 300);
     }*/
  }
  
  v[3].set(v[0]);

  //draw
  //background(1);

  //image(wheel, 100, 100);

  PVector a, b, c, d, e, p;
  float t = 0;
  while (t <= 1) {
    a = PVector.lerp(v[0], v[1], t);
    b = PVector.lerp(v[1], v[2], t);
    c = PVector.lerp(v[2], v[3], t);

    d = PVector.lerp(a, b, t);
    e = PVector.lerp(b, c, t);

    p = PVector.lerp(d, e, t);

    float angle = atan2(p.y-center.y, p.x-center.x);

    if (angle < 0)
      angle += TAU;



    //stroke(0);
    //point(p.x, p.y);


    stroke(angle/TAU, p.dist(center)/(0.5*wheel.width), 1);
    float x = map(t, 0, 1, 0, width);
    point(x, frameCount-1);

    t += 0.0001;
  }

/*
  for (int i = 0; i < v.length; i++) {

    stroke(0);

    if (closest == i)
      stroke(0.2);

    strokeWeight(2);

    if (i == 0 || i == 3) {
      float angle = atan2(v[i].y-center.y, v[i].x-center.x);

      if (angle < 0)
        angle += TAU;

      fill(angle/TAU, v[i].dist(center)/(0.5*wheel.width), 1);
    } else {
      fill(0);
    }

    ellipse(v[i].x, v[i].y, size[i], size[i]);
  }
*/

  if (frameCount > height) {
    save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
}
float[] p = {random(1), random(1), random(1), random(1), random(1), random(1)};
float[] q = {random(1), random(1), random(1), random(1), random(1), random(1)};

void setup() {
  size(1000, 1000);
  background(0);
  colorMode(RGB, 1.0);
  frameRate(1000);
}

void draw() {
  PVector end = new PVector(random(width), random(height));
  /*if (frameCount < 2000)
   end.set(frameCount*0.5, 0);
   else if (frameCount < 4000)
   end.set(width, frameCount*0.5-1000);
   */

 // if (mousePressed)
    end.set(mouseX, mouseY);
  //float t = end.mag()/sqrt(width*height);
  float t = noise(end.x*0.01, end.y*0.01);
  //float t = 0.5;
  float r = bezierPoint(q[0], p[0], p[1], q[1], t);
  float g = bezierPoint(q[2], p[2], p[3], q[3], t);
  float b = bezierPoint(q[4], p[4], p[5], q[5], t);

  stroke(r, g, b);
  strokeWeight(50);
  point(end.x, end.y);
  //line(0, height, end.x, end.y);

  if (keyPressed) {
    save("2/"+millis()+".png");
    exit();
  }
}

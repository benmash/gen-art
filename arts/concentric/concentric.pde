void setup() {
  size(1000, 1000);
  smooth(8);
  background(0);
}

void draw() {
  background(0);
  PVector p = new PVector(width/2, height/2);
  float scale = 0.0075;
  float w = width*0.90;
  //stroke(255);
  noStroke();
  //noFill();
  float size = 150 + (250*noise(frameCount*0.025));
  float num = 20;
  for (float h = 0; h < num; h++) {
    float i = w-(h*(w-size)/num);
    fill(((h+5)/(num-5))*255.0);
    if (h == num-1)
      fill(0);
    ellipse(p.x, p.y, i, i);
    p.add(new PVector(0.5-noise(p.x*0.01, p.y*0.01, (i+frameCount)*scale), 0.5-noise(p.x*0.01, p.y*0.01, 2*(i+frameCount)*scale)).mult(i*0.1));
    p.add(new PVector(0.5-noise(p.x*0.01, p.y*0.01, (i+frameCount)*scale), 0.5-noise(p.x*0.01, p.y*0.01, 2*(i+frameCount)*scale)).add((mouseX-500)/500.0, (mouseY-500)/500.0).mult(i*0.1));
    //p.add(new PVector(0.5-noise((frameCount)*scale), 0.5-noise(2*(frameCount)*scale)).mult(i*0.02));
  }
}

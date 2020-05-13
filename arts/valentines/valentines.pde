float t = 0;

void setup() {
  size(1000, 1000, P2D);
  background(0);
  frameRate(1000);
}

void draw() {
  //noStroke();
  //fill(0, 10);
  //rect(0, 0, width, height);
  float d = frameCount*0.1;

  t = 0; 
  while (t < 10) {
    float x = (50-d)*(16 * pow(sin(t), 3));
    float y = -(50-d)*(13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t));

    x *= random(1, 10-d);
    y *= random(1, 10-d);

    stroke(#F7004F);

    point(x + 500, y + 500);
     t+=0.001;
  }
 
}

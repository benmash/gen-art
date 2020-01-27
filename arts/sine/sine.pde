void setup() {
  size(1000, 1000);

  background(255);
  colorMode(HSB, 1.0);
  //blendMode(SUBTRACT);
}


void draw() {
  int f = frameCount % 22;

  float t = 0;
  float step = 0.001;

  float p = random(0, 3600);
  
  float c = random(100.0/360 

  while (t <= 1) {

    float h = sin(radians(p*t));

    float x = t * width;
    float y = (f-1)*50 + 20*h;

    stroke(c, 0.25, 1);
    point(x, y);

    t += step;
  }
}
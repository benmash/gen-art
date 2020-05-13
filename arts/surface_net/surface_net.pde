ArrayList<PVector[]> faces = new ArrayList<PVector[]>();
float scale = 10;
int size = 10;

void setup() {
  size(1000, 1000, P3D);
  background(0);
}

void draw() {
  int i = frameCount-1;

  float x = ((i%size))*scale;
  float y = ((i/size)%size)*scale;
  float z = ((i/(size*size))%size)*scale;

  //background(0);
  //camera(200, -200, 200, 0, 0, 0, 0, 1, 0);
  //camera(200*cos(frameCount*0.01), -100, 200*sin(frameCount*0.01), 0, 0, 0, 0, 1, 0);
  fill(255);
  stroke(0);


  translate(x, y, z);
  box(scale);
}

float sdf(PVector p) {
  return p.mag()-50;
}

float sdf(float x, float y, float z) {
  return sdf(new PVector(x, y, z));
}

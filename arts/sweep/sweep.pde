int num = 10;

PVector[][] bezier = new PVector[num][num];
PVector[] start = new PVector[num];
PVector[] path = new PVector[num];

void setup() {
  size(1000, 1000);
  background(255);
  noSmooth();

  for (int i = 0; i < num; i++) {
    //start[i] = new PVector(0, i * (height/(num-1)));
    
    start[i] = new PVector(width/2, height/2);
    path[i] = PVector.add(start[i], PVector.random2D().mult(random(width/2)));
    
    //path[i] = PVector.add(start[i], new PVector(1000, random(-1000, 1000)));
    //path[i] = PVector.add(start[i], new PVector(random(width), constrain(random(-1000, 1000), 0, height)));

   bezier[0][i] = start[i].copy();
}
}


void draw() {
  //background(255);
  double t = 0;
  double step = 0.005;
  double hStep = 0.1;
  
  for(int i = 0; i < num; i++){
    //bezier[0][i] = PVector.lerp(start[i], path[i], (float)(frameCount * hStep));
    bezier[0][i].add(PVector.fromAngle(radians(i*36)).mult(random(i)));
  }

  while (t <= 1) {

    for (int n = num-1; n > 0; n--) {

        int level = num-n;
        int l = level-1;

        for (int i = 0; i < n; i++) {
          bezier[level][i] = PVector.lerp(bezier[l][i], bezier[l][i+1], (float)t);
        }
      }
    
    PVector p = bezier[num-1][0].copy();
    
    stroke(0);
    point(p.x, p.y);
    

    t+= step;
  }
  
}
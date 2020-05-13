PVector[] nodes = new PVector[25];
PVector[] vel = new PVector[25];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new PVector(random(width), random(height));
    vel[i] = new PVector();
  }
  background(0);
}

void draw() {
  stroke(255);
  float scale = 0.05;
  float speed = 5;


  for (int i = 0; i < nodes.length; i++) {

    vel[i].add(speed*(noise(nodes[i].x*scale, nodes[i].y*scale, 0)-0.5), speed*(noise(nodes[i].y*scale, nodes[i].y*scale, 0.5)-0.5));
    PVector last = nodes[i].copy();
    nodes[i].add(vel[i]);
    line(nodes[i].x, nodes[i].y, last.x, last.y);
    
  }
  
  if(keyPressed){
    save(millis()+"out.png");
  }
}

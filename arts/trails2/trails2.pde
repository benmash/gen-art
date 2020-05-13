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
  noFill();
  float scale = 0.005;
  float speed = 1;


  for (int i = 0; i < nodes.length; i++) {

    vel[i].add(speed*(noise(nodes[i].x*scale, nodes[i].y*scale, 0)-0.5), speed*(noise(nodes[i].y*scale, nodes[i].y*scale, 0.5)-0.5));
    PVector a = nodes[i].copy();
    nodes[i].add(vel[i]);
    
    vel[i].add(speed*(noise(nodes[i].x*scale, nodes[i].y*scale, 0)-0.5), speed*(noise(nodes[i].y*scale, nodes[i].y*scale, 0.5)-0.5));
    PVector b = nodes[i].copy();
    nodes[i].add(vel[i]);
    
    vel[i].add(speed*(noise(nodes[i].x*scale, nodes[i].y*scale, 0)-0.5), speed*(noise(nodes[i].y*scale, nodes[i].y*scale, 0.5)-0.5));
    PVector c = nodes[i].copy();
    nodes[i].add(vel[i]);
    
    bezier(a.x, a.y, b.x*1.1, b.y*1.1, c.x*0.9, c.y*0.9, nodes[i].x, nodes[i].y);
  }
  
  if(keyPressed){
    save(millis()+"out.png");
    exit();
  }
}

PVector[] points = new PVector[4];

void setup(){
  size(1000, 1000);
  for(int i = 0; i < points.length; i++){
    points[i] = new PVector(random(100, 900), random(100, 900));
  }
  
  background(0);
}


void draw(){
  background(0);
  for(int i = 0; i < points.length; i++){
    //points[i].add(random(-1, 1), random(-1, 1));
  }
  
  stroke(255);
  for(float t = 0; t <= frameCount*0.01; t += frameCount*0.0001){
    float x = bezierPoint(points[0].x, points[1].x, points[2].x, points[3].x, t);
    float y = bezierPoint(points[0].y, points[1].y, points[2].y, points[3].y, t);
    line(500, 500, x, y);
    
  }
}

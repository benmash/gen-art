PVector[] v = new PVector[4];
PGraphics wheel;

void setup(){
  size(600, 600);
  background(255);
  
  wheel = createGraphics(400, 400);
  
  wheel.beginDraw();
  wheel.colorMode(HSB, 1.0);
  
  float angle = 0;
  PVector center = new PVector(wheel.width/2, wheel.height/2);
  
  while(angle <= TAU){
    
    PVector a = PVector.fromAngle(angle).mult(wheel.width/2).add(center);
    
    float r = 0;
    
    while(r <= wheel.width){
      
      PVector p = PVector.lerp(center, a, r/wheel.width);
      
      wheel.stroke(angle/TAU, r/wheel.width, 1);
      wheel.point(p.x, p.y);
      
      r += 1;
    }
    
    angle += 1.0/wheel.width;
  }
  
  wheel.endDraw();
  
  
}


void draw(){
  image(wheel, );

}
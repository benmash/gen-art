PGraphics disp;

void setup(){
  size(1000, 1000, P2D);
  disp = createGraphics(1000, 1000);
  background(0);
}


void draw(){
  //background(0);
  stroke(255);
  noFill();

  drip(random(width), random(height), random(100));
  

}

void drip(float x, float y, float t){
  bezier(x-50-t/4.0, y, x-25-t/8.0, y, x-25-t/8.0, y+t, x, y+t);
  bezier(x+50+t/4.0, y, x+25+t/8.0, y, x+25+t/8.0, y+t, x, y+t);
}

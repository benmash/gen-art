void setup() {
  size(1000, 1000);
  frameRate(1000);
  colorMode(HSB, 1.0);
  background(0);
}

void draw(){
  int f = (frameCount-1)%100;
  
  int x = (f % 10)*100 + 50;
  int y = (f / 10) * 100 + 50;
  
  stroke((frameCount/100)*0.05, 1, 1);
  PVector v = PVector.random2D().mult(50);
  line(x, y, x+v.x, y+v.y);

}

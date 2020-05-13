void setup() {
  size(1000, 1000);
  background(0);
}

void draw(){
  int f = (frameCount-1)%100;
  
  int x = (f % 10)*100 + 50;
  int y = (f / 10) * 100 + 50;
  
  stroke(255);
  point(x, y);

}

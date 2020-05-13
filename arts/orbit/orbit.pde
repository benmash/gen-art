PShader shader;
PImage last;
 color[] c = {#E5E5C3, #091234, #CDCE94};
void setup(){
  size(1000, 1000, P2D);
  shader = loadShader("frag.glsl");
  colorMode(RGB, 1.0);
  
  background(1);
  noStroke();
  
 
  
  for(int i = 0; i < 1000; i++){
    fill(c[(int)random(3)]);
    
    float r = random(200);
    
    ellipse(random(width), random(height), r, r);
  }
  
  last = get();

}

void draw(){
  
  for(int i = 0; i < 3; i++){
    shader.set("colors["+i+"]", new PVector(red(c[i]), green(c[i]), blue(c[i])));
  }
  shader.set("frame", last);
  //shader.set("t", millis());
  shader(shader);
  
  noStroke();
  rect(0, 0, width, height);

  last = get();
  
  if (keyPressed && key == 's') {
    println("saveing");
    save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
}

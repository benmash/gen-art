PShader march;

void setup(){
  size(1000, 1000, P2D);
  march = loadShader("frag.glsl", "vert.glsl");
}

void draw(){
  background(255);
  
  shader(march);
  noStroke();
  rect(0, 0, width, height);

}
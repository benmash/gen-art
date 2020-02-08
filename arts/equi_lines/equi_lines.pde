PVector[] points = new PVector[500];
float[] size = new float[points.length];
int num = 0;

PShader lines;

PGraphics g;

void setup() {
  size(1000, 1000, P2D);
  g = createGraphics(10000, 10000, P2D);
  lines = loadShader("frag.glsl", "vert.glsl");

  for (int i = 0; i < points.length; i++) {
    points[i] = PVector.random2D().mult(random(g.width/2.5)).add(g.width/2, g.height/2);
    size[i] = random(-1000, 1000);
    num++;
  }
  g.beginDraw();
  g.background(0);
  g.endDraw();
}

void draw() {
  println(frameCount);
  g.beginDraw();
  //background(0);

  color c = lerpColor(#13B3F0, #FF7CD3, frameCount/750.0);
  colorMode(RGB, 1.0);

  lines.set("nump", num);
  lines.set("color", new PVector(red(c), green(c), blue(c))); 
  for (int i = 0; i < num; i++) {
    //points[i].add((noise(0.01*points[i].x, 0.01*points[i].y, 0)-0.5)*4, (noise(0.01*points[i].x, 0.01*points[i].y, 1)-0.5)*4);
    points[i].sub(g.width/2, g.height/2).mult(1.002).add(g.width/2, g.height/2);
    lines.set("p["+i+"]", points[i]);
    lines.set("size["+i+"]", size[i]);
  }


  g.shader(lines);

  g.noStroke();
  g.rect(0, 0, g.width, g.height);
  g.endDraw();
  
  image(g, 0, 0, width, height);
  
  if ((keyPressed && key == 's') || frameCount > 1000) {
    println("saveing");
    g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
}

void mouseClicked() {
  if (num < 100) {
    points[num] = new PVector(mouseX, height-mouseY);
    size[num] = 50;
    num++;
  }
}
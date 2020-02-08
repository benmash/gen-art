PShader shader;
ArrayList<PVector> cubes = new ArrayList<PVector>();
PGraphics g;

void setup() {
  size(1000, 1000, P2D);
  colorMode(RGB, 1.0);
  frameRate(60);
  background(0);

  g = createGraphics(10000, 10000, P3D);

  g.beginDraw();
  g.background(0);
  g.endDraw();

  shader = loadShader("shaders/frag.glsl", "shaders/vert.glsl");
}

void draw() {
  g.beginDraw();

  if (frameCount % 10 == 0)
    //cubes.add(new PVector(random(-100, 100), random(-100, 100)));
    cubes.add(PVector.random2D().mult(1000));

  shader.set("random", random(0.25));
  g.shader(shader);

  //background(0);
  g.camera(0, 0, 10000, 0, 0, 0, 0, 1, 0);

  g.noStroke();

  g.colorMode(RGB, 1.0);

  for (PVector p : cubes) {
    if (random(1)> 0.5)
      g. fill(0);
    else
      g.fill(1);

    p.add(0, 0, 50);
    g.translate(p.x, p.y, p.z);
    g.box(100);
    g.translate(-p.x, -p.y, -p.z);
  }

  g.endDraw();

  image(g, 0, 0, width, height);

  if (keyPressed && key == 's') {
    println("save");
    g.save("output/out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
}
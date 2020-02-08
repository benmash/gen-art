PShader shader;
PVector[] points = new PVector[100];
PVector[] v = new PVector[100];
//PVector[] movers = new PVector[0];
PImage image = createImage(points.length, 1, RGB);

void setup() {
  size(1000, 1000, P2D);
  background(0);
  shader = loadShader("frag.glsl", "vert.glsl");
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));

    v[i] = PVector.random2D().limit(0.5);
  }
  //for (int i = 0; i < movers.length; i++) {
  //  movers[i] = new PVector(random(width), random(height));
  //}
}

void draw() {
  resetShader();
  //background(0);
  fill(0, 0.5);
  //rect(0, 0, width, height);
  
  
  for (int i = 0; i < 100; i++) {
    //v[i].add(random(-0.01, 0.01), random(-0.01, 0.01));
    points[i].add(v[i]);
    if (points[i].x > width || points[i].x < 0 || points[i].y > height || points[i].y < 0) {
      v[i].rotate(radians(180));
    }
    shader.set("points["+i+"]", points[i]);
  }

  shader(shader);

  noStroke();
  fill(0);
  rect(0, 0, width, height);

  

/*
  for (int i = 0; i < movers.length; i++) {
    color max = color(0);
    float dir = 0;

    for (float angle = 0; angle < TAU; angle += TAU/8) {
      PVector loc = PVector.fromAngle(angle).add(movers[i]);
      if (brightness(get((int)loc.x, (int)loc.y)) > brightness(max)) {
        max = get((int)loc.x, (int)loc.y);
        dir = angle;
      }
    }

    movers[i].add(PVector.fromAngle(dir).mult(2));

    fill(0);
    stroke(1);
    ellipse(movers[i].x, movers[i].y, 10, 10);
  }
  */
}
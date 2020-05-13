PShader disp;
PImage noise;

void setup() {
  size(1000, 1000, P3D);
  frameRate(60);
  colorMode(RGB, 1.0);
  disp = loadShader("frag.glsl", "vert.glsl");
  noise = createImage(200, 1, RGB);
  noise.loadPixels();
  for (int x = 0; x < noise.width; x++) {
    noise.pixels[x] = color(noise(x*0.001, 1), noise(x*0.01, 2), noise(x*0.01, 3));
  }
  noise.updatePixels();
}

void draw() {
  background(0);
  translate(500, 500);
  rotateZ(radians(-20));
  rotateY(radians(-60));
  //rotateY(radians(frameCount));
  //stroke(1);
  noStroke();
  //disp.set("noise", noise);
  //shader(disp);
  pointLight(1, 1, 1, 1100, -100, 100);
  //pointLight(0.5, 0.5, 0.5, 0, 0, 0);

  beginShape(QUAD_STRIP);

  int step = 1;
  for (float z = -300; z <= 300; z+=step) {
    for (int a = 0; a < 360; a += 1) {
      PVector p = PVector.fromAngle(radians(a)).mult(150+10*noise((z+frameCount)*0.01));
      PVector p2 = PVector.fromAngle(radians(a)).mult(150+10*noise((z+step+frameCount)*0.01));

      float ns = 0.01;
      float t = frameCount * 0.01;
      z+=200;
      p.add(100*(noise(p.x*ns+t, p.y*ns+t, z*ns)-0.5), 100*(noise(p.x*ns+t, p.y*ns+t, z*ns)-0.5));
      p2.add(100*(noise(p2.x*ns+t, p2.y*ns+t, (z+step)*ns)-0.5), 100*(noise(p2.x*ns+t, p2.y*ns+t, (z+step)*ns)-0.5));
      z-=200;

      vertex(p.x, p.y, z);
      vertex(p2.x, p2.y, z+step);
    }
  }
  endShape(CLOSE);

  if (frameCount < 600) {
    saveFrame("out/frame####.png");
    println(frameCount);
  } else {
    exit();
  }
}

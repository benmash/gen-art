PImage bump, normal;
float noiseScale = 0.01;

void setup() {
  size(1000, 1000, P2D);
  bump = createImage(1000, 1000, RGB);
  normal = createImage(1000, 1000, RGB);
  colorMode(RGB, 1.0);

  bump.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float r = noise(x*0.001, y*0.02, 0);
      //r += 0.25*noise(x*0.1, y*0.1, 1);
      //float g = noise(x*noiseScale, y*noiseScale, 1);
      //float b = noise(x*noiseScale, y*noiseScale, 2);

      bump.pixels[y*width+x] = color(map(r, 0.5, 1, 0, 1));
    }
  }

  bump.updatePixels();

  normal.loadPixels();
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {

      float dy = 5*(brightness(bump.pixels[(y-1)*width+x]) - brightness(bump.pixels[(y+1)*width+x]))/2;
      float dx = 5*(brightness(bump.pixels[y*width+(x-1)]) - brightness(bump.pixels[y*width+(x+1)]))/2;

      dy = map(dy, -1, 1, 0, 1);
      dx = map(dx, -1, 1, 0, 1);

      normal.pixels[y*width+x] = color(dx, dy, 1);
    }
  }

  normal.updatePixels();
}

void draw() {
  if (frameCount < 100)
    image(bump, 0, 0);
  else
    image(normal, 0, 0);
}
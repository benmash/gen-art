PVector[][] points = new PVector[100][100];

void setup() {
  for (int x = 0; x < points.length; x++) {
    for (int y = 0; y < points[0].length; y++) {
      points[x][y] = new PVector(x*10, y*10);
    }
  }

  size(1000, 1000);
  background(0);
}

void draw() {
  background(0);
  stroke(255);
  for (int x = 0; x < points.length; x++) {
    for (int y = 0; y < points[0].length; y++) {
      PVector p = points[x][y];
      float s = 0.01;
      points[x][y].add(noise(p.x*s, p.y*s, 0)-0.5, noise(p.x*s, p.y*s, 1)-0.5);
    }
  }

  for (int x = 0; x < points.length-1; x++) {
    for (int y = 0; y < points[0].length-1; y++) {
      line(points[x][y].x, points[x][y].y, points[x+1][y].x, points[x+1][y].y);
      line(points[x][y].x, points[x][y].y, points[x][y+1].x, points[x][y+1].y);
    }
  }
}

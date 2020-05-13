PVector[][] points = new PVector[100][100];

void setup() {
  
  size(1000, 1000);
  blendMode(ADD);
  for (int x = 0; x < points.length; x++) {
    for (int y = 0; y < points[0].length; y++) {
       points[x][y] = new PVector(x*(width/points.length), y*(width/points.length)).add(random(-10, 10), random(-10, 10));

    }
  }

  
  background(0);
}

void draw() {
  //background(0);
  stroke(255, 2);
  for (int x = 0; x < points.length; x++) {
    for (int y = 0; y < points[0].length; y++) {
      PVector p = points[x][y];
      float s = 0.01;
      points[x][y].add(noise(p.x*s, p.y*s, 0)-0.5, noise(p.x*s, p.y*s, 1)-0.5);
    }
  }

  for (int x = 1; x < points.length-2; x++) {
    for (int y = 1; y < points[0].length-2; y++) {
      //fill(0);
      noFill();
      curve(points[x-1][y].x, points[x-1][y].y, points[x][y].x, points[x][y].y, points[x+1][y].x, points[x+1][y].y, points[x+2][y].x, points[x+2][y].y);
      curve(points[x][y-1].x, points[x][y-1].y, points[x][y].x, points[x][y].y, points[x][y+1].x, points[x][y+1].y, points[x][y+2].x, points[x][y+2].y);
    }
  }
  
  if(keyPressed){
    println("save");
    save("out"+millis()+".png");
    println("save done");
    exit();
  }
}

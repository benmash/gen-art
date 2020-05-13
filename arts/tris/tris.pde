PVector[] points = new PVector[100];

void setup() {
  //fullScreen();
  size(1000, 1000);
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width*.2, width*.8), random(height*.2, height*.8));
  }
  background(0);
}

void draw() {
  int c = (int)random(points.length);
  int a= -1, b= -1;
  float dist = 10000000;
  for (int i = 0; i < points.length; i++) {
    if (i != c && points[i].dist(points[c]) < dist) {
      dist = points[i].dist(points[c]);
      a = i;
    }
  }
  dist = 10000000;
  for (int i = 0; i < points.length; i++) {
    if (i != c && i != a && points[i].dist(points[c]) < dist && points[a].dist(points[i]) > 20) {
      dist = points[i].dist(points[c]);
      b = i;
    }
  }



  PVector l = PVector.sub(points[a], points[b]);
  float len = l.mag();
  PVector p = new PVector(-l.y, l.x).setMag((len/2.0)*sqrt(3));
  l.div(2);
  PVector d = PVector.add(points[b], l).add(p);

  points[c] = PVector.lerp(points[c], d, 1);

  //if (frameCount % 10 == 0)
    //filter(BLUR);
    //background(0);


  stroke(255);
  //noFill();
  fill(0);

  PVector center = PVector.lerp(points[a], points[b], 0.5);
  center.lerp(points[c], 0.5);
  
  ellipse(center.x, center.y, len/2, len/2);

  //triangle(points[a].x, points[a].y, points[b].x, points[b].y, points[c].x, points[c].y);
  //line(points[a].x, points[a].y, points[b].x, points[b].y);
  //line(points[b].x, points[b].y, points[c].x, points[c].y);
  //line(points[a].x, points[a].y, points[c].x, points[c].y);
  

  stroke(255);

  for (int i = 0; i < points.length; i++) {
    //ellipse(points[i].x, points[i].y, 10, 10);
    /*for(int j = 0; j < points.length; j++){
      if(points[i].dist(points[j]) < 50)
        line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
    */
  }
  if(keyPressed){
    save(millis()+".png");
  }
}

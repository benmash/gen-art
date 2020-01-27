void setup() {
  size(600, 600);
  frameRate(60);
  colorMode(RGB, 1.0);
  background(0);
}

void draw() {
  
  if (keyPressed && key == 's') {
    println("saveing");
    save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }
  //background(0);

  println(frameCount);

  float t = 0;
  float step = 0.001;

  while (t <= 1) {

    PVector v = PVector.random3D().mult(300);




    //color c = color(map(v.x, -100, 100, 0, 1), map(v.y, -100, 100, 0, 1), map(v.z, -100, 100, 0, 1));
    //PVector light = PVector.fromAngle(radians(frameCount)).add(0, 0, 0);
    PVector light = new PVector(-1, 1, 0);
    color c = color(-PVector.dot(v, light)/(v.mag()*light.mag()));

    v.add(width/2, height/2);

    stroke(c);
    fill(c);

    if (v.z>0)
      if (brightness(c) < 0.25)
        ellipse(v.x, v.y, 12, 12);
      else
        ellipse(v.x, v.y, 10, 10);
    //point(v.x, v.y);

    t += step;
  }
}
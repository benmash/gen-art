ArrayList<PVector> points = new ArrayList<PVector>();
PVector cam = new PVector();
PShape ball, ball2;

void setup() {
  
  size(1000, 1000, P3D);
  background(0);
  
  ball = loadShape("bubble.obj");
  ball.scale(50);
  println(ball.getChildCount());
  
  ball2 = createShape();
  ball2.beginShape(TRIANGLES);
  
  for(int i = 0; i < ball.getChildCount(); i++){
    /*for(int v = 0; v < ball.getChild(i).getVertexCount(); v++){
      println(v);
      PVector p = ball.getChild(i).getVertex(v);
      ball2.vertex(p.x, p.y, p.z);
    }*/
    
    ball.getChild(i).scale(random(0.5, 1.5));
  }
  
  ball2.endShape();
  
  ball2.scale(10);
  
  
  
  //for(int i = 0; i < 100; i++){
  //  points.add(new PVector(cos(i*2*PI/10.0)*sin(radians((i/10)*18))*5, i/10-5, sin(i*2*PI/10.0)*sin(radians((i/10)*18))*5).mult(10)); 
  //}
}

void draw(){
  for(int i = 0; i < ball.getChildCount(); i++){
    
    ball.getChild(i).scale(random(1, 1.05));
    
    if(random(1) > 0.95)
      ball.getChild(i).resetMatrix();
    
  }
  
  background(0);

  cam.y += radians(1);
  camera(cos(cam.y)*250, noise(frameCount*0.005)*100-50, sin(cam.y)*250, 0, 0, 0, 0, 1, 0);
  
  
  ball.setStroke(color(255));
  ball.setFill(color(255));
  //beginShape(TRIANGLE_STRIP);
  
  float s = 0.01;
  for(PVector p : points){
    
    //vertex(p.x, p.y, p.z);
  }
  
  /*for(int i = 0; i < ball.getVertexCount(); i++){
    PVector p = ball.getVertex(i);
    p.mult(random(-1.5, 1.5)*100);
    ball.setVertex(i, p);
  }*/
  //ball.scale(0.0001);
  fill(0);
  sphere(45);
  shape(ball);
  
  //endShape();
  
  
  
}

PVector[] v = new PVector[100];
float scale = 0.1;
PrintWriter out;

void setup(){
  out = createWriter(millis()+"out.obj");
  size(1000, 1000, P3D);
  background(0);
  for(int i = 0; i < v.length; i++){
    float angle = radians(360*(i/(float)v.length));
    v[i] = PVector.fromAngle(angle).mult(50);
  }
}

void draw(){
  noStroke();
  fill(255);
  translate(500, 500, 500);
  for(int i = 0; i < v.length; i++){
    out.println("v "+v[i].x+" "+v[i].y+" "+v[i].z);
    
    translate(v[i].x, v[i].y);
    box(1);
    translate(-v[i].x, -v[i].y);
    
    v[i].add(noise(v[i].x*scale, v[i].y*scale, v[i].z*scale*2)-0.5, noise(v[i].x*scale, v[i].y*scale, v[i].z*scale)-0.5, -scale);
  }
  
  if(keyPressed){
    out.flush();
    out.close();
    exit();
  }

}

import processing.pdf.*;

float scale = 0.0005;
float density = 5;
float hScale = 100;

void settings() {
  size(10000, 10000, PDF, "out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".pdf");
}

void setup() {


  background(0);
}

void draw() {
  
  float y = frameCount*density;
  
  if(y % 100 == 0){
    println(y);
  }

  float lastY = y;

  if (y > width*1.1) {
    //save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }

  for (float x = 0; x <= width; x += density) {
    y = frameCount*density;

    float h = hScale*pow(noise(x*scale, y*scale), 2);

    y -= h;

    stroke(lerpColor(#515155, #7A7A83, (h*h)/3000));

    if (h>55-random(5)) 
      stroke(255);


    //if (h < 50 + random(10))
    //stroke(lerpColor(#3B2104, #523413, (y-lastY)*5));
    //stroke(lerpColor( #08A223, #272729, (h*h)/2500));


    if (h < 25)
      stroke(lerpColor(#000D4B, #034D83, (h*h)/625));

    line(x-density, lastY, x, y);

    lastY = y;
  }
}
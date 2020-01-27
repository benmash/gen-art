import processing.pdf.*;

float shape = 0.1;

PVector[][] p = {
  {new PVector(0, 1), new PVector(shape, shape), new PVector(1, 0)}, 
  {new PVector(1, 0), new PVector(shape, -shape), new PVector(0, -1)}, 
  {new PVector(0, -1), new PVector(-shape, -shape), new PVector(-1, 0)}, 
  {new PVector(-1, 0), new PVector(-shape, shape), new PVector(0, 1)}};

//float[][][] mag = new float[4][10][10];
//float[][][] v = new float[4][10][10];

int num = 1;

int concentric = 10;

float space = 0.9;

PVector[][][][] bend = new PVector[concentric][4][num][num];

float step = 0.01;

boolean unique = true;

PGraphics g; 

//int[] colors = {#FFFF00, #00FFFF, #FF00FF};
int[] colors = {#FF0000, #00FF00, #0000FF};


void setup() {
  size(1000, 1000);
  g = createGraphics(10000, 10000);
  g.noSmooth();
  g.beginDraw();
  g.background(0);
  //g.blendMode(ADD);
  g.endDraw();

  //noLoop();
  frameRate(60);
  for (int c = 0; c < concentric; c++) {
    for (int n = 0; n < 4; n++) {
      for (int i = 0; i < num; i++) {
        for (int j = 0; j < num; j++) {
          //mag[n][i][j] = random(0, 1);
          //v[n][i][j] = random(0, 0.1);
          bend[c][n][i][j] = p[n][1].copy();
        }
      }
    }
  }
}

void draw() {
  println(frameCount);
  g.beginDraw();

  //step += random(-0.001, 0.001);

  if (step <= 0) {
    step = 0.00005;
  }

  if (keyPressed && key == 's') {
    println("saveing");
    g.endDraw();
    g.save("out_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    exit();
  }

  //if (frameCount > 600) {
  //  println("saving");
  //  exit();
  //}

  //background(255);

  g.stroke(255);
  float t = 0;
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      int x = i*(g.width/num) + (g.width/(2*num));
      int y = j*(g.height/num) + (g.height/(2*num));

      for (int c = 0; c < concentric; c++) {
        for (int n = 0; n < 4; n++) {
          //p[n][1].setMag(mag[n][i][j]);
          //mag[n][i][j] = abs(mag[n][i][j]);
          //mag[n][i][j] += v[n][i][j];
          p[n][1].set(bend[c][n][i][j]);

          //bend[n][i][j].mult(random(0.99, 1.01));
          bend[c][n][i][j].add(PVector.random2D().limit(0.01));
          //bend[n][i][j].setMag(bend[n][i][j].mag() + random(-0.01, 0.01));
        }
      }

      while (t<=1) {
        for (int c = 0; c < concentric; c++) {
          for (int n = 0; n < 4; n++) {

            if (unique)
              p[n][1].set(bend[c][n][i][j]);


            for (int rgb = 0; rgb <3; rgb++) {

              p[n][1].mult(0.99);

              PVector a = PVector.lerp(p[n][0], p[n][1], t).mult((g.width/num)*(space/pow(2, c+1)));
              PVector b = PVector.lerp(p[n][1], p[n][2], t).mult((g.height/num)*(space/pow(2, c+1)));

              a.add(x, y);
              b.add(x, y);

              PVector pf = PVector.lerp(a, b, t);
              
              color o = get((int)pf.x, (int)pf.y);
              int red = (int)max(red(o), red(colors[rgb]));
              int green = (int)max(green(o), green(colors[rgb]));
              int blue = (int)max(blue(o), blue(colors[rgb]));
              
              g.stroke(red, green, blue);
              g.point(pf.x, pf.y);
            }
          }
        }
        t += step;
      }

      t = 0;
    }
  }

  g.endDraw();
  image(g, 0, 0, width, height);
}
float noiseScale = 0.01;

ArrayList<City> cities = new ArrayList<City>();

void setup() {
  size(1000, 1000);
  background(255);
  cities.add(new City());
  cities.add(new City());
  cities.add(new City());
  cities.add(new City());
  frameRate(1000);
  noSmooth();
}

void draw() {
  //println(cities.size());
  for (int i = 0; i < cities.size(); i++) {
    cities.get(i).tick();
  }
}


class City {
  float size, foodRate, food, wealth;
  PVector pos;
  City parent = null;

  public City() {
    pos = new PVector(random(width), random(height));

    size = 5;
    food = 5;
    wealth = 5;
    foodRate = noise(pos.x * noiseScale, pos.y * noiseScale);
  }

  public City(City c) {
    this();
    pos = c.pos.copy();
    parent = c;

    PVector dir = new PVector();

    pos.add(dir);

    for (City o : cities) {
      if (!o.pos.equals(parent.pos)) {
        PVector r = PVector.sub(pos, o.pos);
        r.mult((o.size)/r.magSq());
        dir.add(r);
      } else {
        println("parent");
      }
    }

    if (dir.mag() == 0)
      dir = PVector.random2D().mult(50);

    if (dir.mag() < 25)
      dir.setMag(25);

    pos.add(dir.limit(100).add(PVector.random2D().mult(5)));
  }

  public void tick() {
    food += foodRate;
    wealth += size;

    if (wealth > 1000 && food > 100) {
      size++;
      wealth-=1000;
      food-=100;
    }

    if (wealth > 5000 && random(wealth-5000)> 50) {
      wealth-=5000;
      cities.add(new City(this));
    }

    stroke(0);

    if (parent != null) {
      line(pos.x, pos.y, parent.pos.x, parent.pos.y);
    }

    ellipse(pos.x, pos.y, size, size);
  }
}
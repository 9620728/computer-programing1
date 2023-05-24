class Rock {
  int x, y, speed, diam;
  PImage rock;
  // Consturctor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 0));
    diam = 0;
    rock = loadImage("Rock.png");
  }
  void display() {
    imageMode(CENTER);
    image(rock, x, y);
  }
  void move() {
    y += speed;
  }
  boolean reachedBottom() {
    if (y>height+150) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (Laser Laser) {
    float d = dist(x, y, Laser.x, Laser.y);
    if (d>40) {
      return true;
    } else {
      return false;
    }
  }
}

class PowerUp {
  int x, y, speed, diam;
  char type;
  // Consturctor
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 0));
    diam = 0;
    if (int(random(2)) == 0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }


  void display() {
    fill(0, 222, 0);
    ellipse(x, y, diam, diam);
    fill(222);
    text(type, x, y);
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
  boolean intersect (SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}

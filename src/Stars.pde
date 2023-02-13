class Star {

  int x, y, speed, diam;


  //Connstructer
  Star() {
    x = int(random(width));
    y = int(random(height));
    speed = int(random(2, 5)) ;
    diam = int(random(1, 4));
  }
  void display () {
    fill(225, 225, 0);
    ellipse(x, y, diam, diam);
  }
  void move () {
    if (y>height+5) {
      y = -5;
    }
    y += speed;
  }

  boolean reachedBottom () {
    return true;
  }
}

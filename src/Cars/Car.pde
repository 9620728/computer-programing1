
class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean random;

  Car() {
    c = color(random(139));
    xpos = random(width);
    ypos = random(height);
    xspeed = random(5);
  }
  void display () {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-7, ypos-7, 6, 3);
    rect(xpos-7, ypos+7, 6, 3);
    rect(xpos+7, ypos-7, 6, 3);
    rect(xpos+7, ypos+7, 6, 3);
    
  }
  void drive() {
    if (random == true) {
      xpos-=xspeed;
    } else {
      xpos+=xspeed;
    }
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
  }
}

class Laser {
  int x, y, w, h, speed;
  color c1;
  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 20;
    speed = 10;
    c1 = color(20, 200, 20);
  }
  void display () {
    noStroke();
    rect(x, y, w, h);
    fill(#FFFFFF);
  }
  void move () {
    y -= speed;
  }
  boolean reachedTop () {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}

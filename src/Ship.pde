class SpaceShip {
  int x, y, w, ammo, turretCount, health;
  PImage Ship;
  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 100;
    turretCount = 1;
    health = 5;
    Ship = loadImage("Ship.png");
  }
  void display(int tempX, int tempY) {
    x = tempX;
    y= tempY;
    imageMode(CENTER);
    Ship.resize(w, w);
    image(Ship, x, y);
  }
  boolean fire () {
    if (ammo>0) {
      ammo--;
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

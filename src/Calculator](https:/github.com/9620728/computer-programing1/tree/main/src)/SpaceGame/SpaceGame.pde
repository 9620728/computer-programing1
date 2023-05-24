// Alec Peng | Nov 28 2022 | Space Game
PImage ship;
boolean play;
//import processing.sound.*;
//SoundFile blaster;
int score, level, rockTime, rockCount, laserCount, health, rockRate;
SpaceShip s1;
ArrayList <Rock> rocks =new ArrayList <Rock> ();
ArrayList <PowerUp> powerups =new ArrayList <PowerUp> ();
ArrayList <Laser> lasers =new ArrayList <Laser> ();
Timer rockTimer, puTimer;
Star[] stars = new Star[100];


void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  puTimer = new Timer(5000);
  rockTime = 1000;
  rockCount = 0;
  laserCount = 0;
 // blaster = new SoundFile(this, "blaser.wav");
  rockTimer = new Timer(int(random(500, 2000)));
  rockTimer.start();
  noCursor();
  for (int i = 0; i<stars.length; i++) {
    stars[i]=new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play){
    startScreen();
  } else {
    if (frameCount % 1000 == 10) {
      level ++;
      rockRate-=10;
    }
  background(0);
  // this is for the stars
  for (int i = 0; i<stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }
  // making the rocks and ship hitting stuff
  for (int i = 0; i< rocks.size(); i++) {
    Rock r = rocks.get(i);
    if (s1.intersect(r)) {
      s1.health-=1;
      rocks.remove(r);
      score+=r.diam;
    }
    if (r.reachedBottom()) {
      rocks.remove(r);
    }
    r.display();
    r.move();
  }
  // rock timer
  noCursor();
  if (puTimer.isFinished()){
    powerups.add(new PowerUp());
    puTimer.start();
    println("Powerups:" + powerups.size());
  }
  for (int i = 0; i< powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    if (pu.intersect(s1)) {
      if(pu.type == 'H'){
        s1.health+=5;
      } else {
        s1.ammo+=30;
      }
      
    }
    if (pu.reachedBottom()) {
      powerups.remove(pu);
    }
    if(pu.intersect(s1)){
       powerups.remove(pu);
    }
    pu.display();
    pu.move();
  }
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
    println(rocks.size());
  }
  // lasers
  for (int i = 0; i < lasers.size(); i ++) {
    Laser l = lasers.get(i);
    for (int j = 0; j< rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (l.intersect(r)) {
        score+=10;
        lasers.remove(l);
        rocks.remove(r);
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }
  }
  }

  infoPanel();
  s1.display(mouseX, mouseY);
  if(s1.health<1) {
    gameOver();
  }
}

void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
  s1.fire();
  if (play) {
  //blaster.stop();
   //blaster.play();
}
}


void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(20);
  text("SPACEGAME" + " | Health:" +s1.health + " Level:" + level + " | Score:" + score + " | Ammo:" +s1.ammo, width/2, 40);
}
void startScreen() {
  background (0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin ...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play=true;
  }
}

void gameOver(){
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  noLoop();
}

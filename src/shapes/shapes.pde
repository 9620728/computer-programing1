// Alec Peng | Sept 7 2022 | Shapes

// Setup runs one time at start up
void setup() {
  size(650,500);
  background(355,73,35);
}

// Draw runs on a loop at 30fps
void draw() {
  background(128);
  line(0,100,width,100);
  line(0,200,width,200);
  line(0,300,width,300);
  line(0,400,width,400);
  line(100,0,100,height);
  line(200,0,200,height);
  line(300,0,300,height);
  line(400,0,400,height);
  line(500,0,500,height);
  line(600,0,600,height);
  fill(255,255,0);
  rect(20,20,120,120);
  rect(180,20,120,120,12);
  rect(340,20,120,120,120,10,20,25);
  rect(500,56,120,45);
  fill(255,0,0);
  circle(80,234,120);
  ellipse(240,240,120,40);
  ellipse(400,240,40,134);
  fill(0,0,255);
  triangle(500,300,560,180,620,300);
  triangle(20,420,55,340,120,440);
  fill(34,456,23);
  quad(190,450,190,330,300,330,300,380);
  quad(370,400,400,340,430,400,400,460);
  quad(500,450,550,400,500,350,620,400);
  fill(255);
  textAlign(CENTER);
  text("100",90,11);
  text("200",190,11);
  text("300",290,11);
  text("400",390,11);
  text("500",490,11);
  text("600",590,11);
  text("100",11,90);
  text("200",11,190);
  text("300",11,290);
  text("400",11,390);
  text("500",11,490);
  text("600",11,590);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,100,100);
  fill(random(345),0,0);
  ellipse(random(width),random(height),50,50);
 
}

// Alec Peng | Oct 3 2022 | Temp Converter

void setup() {
  size(400,400);
}


void draw() {
  background(129);
  line(0,100,width,100);
  for(int i=0; i<width; i+=20){
    line(i,95,i,105);
    textSize(10);
    textAlign(CENTER);
    text(i,i,85);
    ellipse(mouseX,100,5,5);
    text (mouseX,mouseX,115);
    text("Far;" + farToCel(mouseX),width/2,130);
    text("Cel;" + celToFar(mouseX),width/2,145);
}
}


float farToCel(float val) {
  // what is the equation for converting far to cell
  val = (val-32)*5.0/9.0;
  return val;
}

float celToFar(float val) {
  // what is the equation for conveerting far to cell
  return val;
}

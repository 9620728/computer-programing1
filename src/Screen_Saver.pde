// Alec Peng | Oct 10 2022 | 2022
float xpos,ypos,strokeW, pointCount;
float x,y;

void setup(){
  size(displayWidth,displayHeight);
  xpos = random(width);
  ypos = random(height);
}

void draw(){
  strokeW = random(1,10);
  pointCount = random(1,20);
  stroke(0);
  strokeWeight(strokeW);
  stroke(random(255),random(255),random(1));
  if (random(100)>70){
    strokeWeight(strokeW);
    moveLeft(xpos,ypos,pointCount);
  } else if (random(100)>65){
    strokeWeight(strokeW);
    moveUp(xpos,ypos,pointCount);
}   else if (random(100)>55){
    strokeWeight(strokeW);
    moveDown(xpos,ypos,pointCount);
} else{
  strokeWeight(strokeW);
  moveRight(xpos,ypos,pointCount);
}
if (xpos > width || xpos <0 || ypos > height || ypos < 0){
  xpos = random(width);
  ypos = random(height);
}
if(random(100)>70){
  moveLeft(xpos,ypos,pointCount);
}
}
void moveRight(float startX, float startY, float moveCount){
  for (float i=0; i<moveCount; i++){
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount){
  for (float i=0; i<moveCount; i++){
    point(startX-i, startY);
    xpos = startY - i;
    ypos = startX;
  }
}

void moveUp(float startX, float startY, float moveCount){
  for (float i=0; i<moveCount; i++){
    point(startX, startY - i);
    xpos = startX;
    ypos = startY - i;
  }
}

void moveDown(float startX, float startY, float moveCount){
  for (float i=0; i<moveCount; i++){
    point(startX, startY + i);
    xpos = startX;
    ypos = startY + i;
  }
}

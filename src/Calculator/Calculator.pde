// Alec Peng | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[9];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;
void setup() {
  size(340, 600);
  color(#FAFDFF);
  numButtons[0] = new Button(127, 480, 60, 60, '0');
  numButtons[1] = new Button(60, 270, 60, 60, '1');
  numButtons[2] = new Button(127, 270, 60, 60, '2');
  numButtons[3] = new Button(194, 270, 60, 60, '3');
  numButtons[4] = new Button(60, 340, 60, 60, '4');
  numButtons[5] = new Button(127, 340, 60, 60, '5');
  numButtons[6] = new Button(194, 340, 60, 60, '6');
  numButtons[7] = new Button(60, 410, 60, 60, '7');
  numButtons[8] = new Button(127, 410, 60, 60, '8');
  numButtons[9] = new Button(194, 410, 60, 60, '9');
  opButtons[0] = new Button(299, 270, 60, 60, '÷');
  opButtons[1] = new Button(299, 340, 60, 60, '×');
  opButtons[2] = new Button(299, 410, 60, 60, '+');
  opButtons[3] = new Button(299, 480, 60, 60, '-');
  opButtons[4] = new Button(60, 200, 60, 60, '%');
  opButtons[5] = new Button(127, 200, 60, 60, '^');
  opButtons[6] = new Button(125, 551, 190, 60, 'C');
  opButtons[7] = new Button(60, 480, 60, 60, '.');
  opButtons[8] = new Button(299, 551, 60, 60, '=');
}


void draw() {
  background(#FFFCFE);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void keyPressed() {
  println("key:" + key);
  println ("keyCode;" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode ==  51|| keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode ==  52|| keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode ==  53|| keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode ==  54|| keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode ==  55|| keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode ==  56|| keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode ==  57|| keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode ==  58|| keyCode == 106) {
    handleEvent("0", true);
  } else if (keyCode ==  59|| keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode ==  60|| keyCode == 108) {
    handleEvent(".", false);
  }else if (keyCode ==  61|| keyCode == 109) {
    handleEvent("/", false);
  }
}
void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 32) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;
    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}
void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C' ) {
      dVal = "0.0";
      op = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      left=true;
    } else if (opButtons[i].on && opButtons[i].val == '+' ) {
      op = '+';
      dVal = ("0.0");
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-' ) {
      op = '-';
      dVal = ("0.0");
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '×' ) {
      op = '×';
      dVal = ("0.0");
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=' ) {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '%' ) {
      op = '&';
      dVal = ("0.0");
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '^' ) {
      op = '^';
      dVal = ("0.0");
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷' ) {
      op = '÷';
      dVal = ("0.0");
      left = false;
    }
  }
  println("l;" + l + " r;" + r + " op:" + op +"left;" + left + " Result " + result);
}

void updateDisplay() {
  fill(0);
  rect(170, 90, 300, 95);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width-70, 100);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
}

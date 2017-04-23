/** 
 * TextBox Writer (v2.4)
 * by  Inarts (2013/Oct)
 * mod GoToLoop
 * https : // forum.processing.org/two/discussion/20882/very-basic-question-how-to-create-an-input-text-box#latest
 * forum.processing.org/two/discussion/423/
 * how-to-write-a-class-for-text-area-without-using-any-library
 *
 * studio.processingtogether.com/sp/pad/export/ro.9Zo$UbIWYZEDR/latest
 */

TextBox tbox;

final int stateNormal   = 0;
final int stateInputBox = 1;
int state=stateNormal; 

// the user name 
String result="/"; 

void setup() {
  size(1240, 480);

  rectMode(CORNER);
  textAlign(LEFT);
  strokeWeight(1.5);

  instantiateBox();
  tbox.isFocused = true;
}

void draw() {
  background(#778C85);

  if (state==stateNormal) {
    backgroundImage();
    text("Click mouse\nYour name: "+result, 19, 19);
  } else  if (state==stateInputBox) {
    backgroundImage();
    tbox.display();
  }
}//func

// ----------------------------------------------------

void backgroundImage() {

  // just a background (from the forum)

  int verticalNumberLines=20;
  int horizontalNumberLines=20;
  int space=5;

  for (int i=0; i<width; i+=width/verticalNumberLines)
  {
    for (int j=0; j<height; j+=space)
    {
      point(i, j);
    }
  }

  for (int j=0; j<height; j+=height/horizontalNumberLines)
  {
    for (int i=0; i<width; i+=space)
    {
      point(i, j);
    }
  }
}

void mouseClicked() {

  if (state==stateNormal) {
    // in normal mode: 
    // switch on input box
    state = stateInputBox;
  } else  if (state==stateInputBox) {
    // do nothing
  }
}

void keyTyped() {
  if (state==stateNormal) {
    // do nothing
  } else if (state==stateInputBox) {
    //
    tbox.tKeyTyped();
  }
}//func 

void keyPressed() {
  if (state==stateNormal) {
    //
  } else if (state==stateInputBox) {
    //
    tbox.tKeyPressed();
  }
}//func

void instantiateBox() {
  tbox = new TextBox(
    "Please enter your name: ", 
    width/2-width/3, height/4 + height/16, // x, y
    width/3, height/2 - height/4 - height/8, // w, h
    215, // lim
    0300 << 030, color(-1, 040), // textC, baseC
    color(-1, 0100), color(#FF00FF, 0200)); // bordC, slctC
}

// ===================================================

class TextBox {

  // demands rectMode(CORNER)

  final color textC, baseC, bordC, slctC;
  final short x, y, w, h, xw, yh, lim;

  boolean isFocused;
  String txt = "";
  String title; 

  TextBox(
    String tt, 
    int xx, int yy, 
    int ww, int hh, 
    int li, 
    color te, color ba, color bo, color se) {

    title=tt;

    x = (short) xx;
    y = (short) yy;
    w = (short) ww;
    h = (short) hh;

    lim = (short) li;

    xw = (short) (xx + ww);
    yh = (short) (yy + hh);

    textC = te;
    baseC = ba;
    bordC = bo;
    slctC = se;
  }

  void display() {
    stroke(isFocused? slctC : bordC);

    // outer 
    fill(baseC);
    rect(x-10, y-90, w+20, h+100);

    fill(0); 
    text(title, x, y-90+20);

    // main / inner
    fill(baseC);
    rect(x, y, w, h);


    fill(textC);
    text(txt + blinkChar(), x, y, w, h);
  }

  void tKeyTyped() {

    char k = key;

    if (k == ESC) {
      // println("esc 2");
      state=stateNormal; 
      key=0;
      return;
    } 

    if (k == CODED)  return;

    final int len = txt.length();

    if (k == BACKSPACE)  txt = txt.substring(0, max(0, len-1));
    else if (len >= lim)  return;
    else if (k == ENTER || k == RETURN) {
      // this ends the entering 
      println("RET ");
      state  = stateNormal; // close input box 
      result = txt;
    } else if (k == TAB & len < lim-3)  txt += "    ";
    else if (k == DELETE)  txt = "";
    else if (k >= ' ')     txt += str(k);
  }


  void tKeyPressed() {
    if (key == ESC) {
      println("esc 3");
      state=stateNormal;
      key=0;
    }

    if (key != CODED)  return;

    final int k = keyCode;

    final int len = txt.length();

    if (k == LEFT)  txt = txt.substring(0, max(0, len-1));
    else if (k == RIGHT & len < lim-3)  txt += "    ";
  }

  String blinkChar() {
    return isFocused && (frameCount>>2 & 1) == 0 ? "_" : "";
  }

  boolean checkFocus() {
    return isFocused = mouseX > x & mouseX < xw & mouseY > y & mouseY < yh;
  }
}
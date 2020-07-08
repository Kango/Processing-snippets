
// this tab contains graphical signs 

void signPause(int x, int y) {
  // gives a sign (||) for pause.
  noStroke();
  rect(x+7, y, 3, 10);
  rect(x+12, y, 3, 10);
} // func 

void trianglePointingRight(int x, int y) {
  // gives a triangle pointing right > (e.g. to place before a line of text).
  // x=left side, y = y-value of point on the rigth side (middle).
  // size is small. 
  final int width1=6;
  final int height1=8;
  noStroke();
  triangle ( x, y-height1/2, 
  x + width1, y, 
  x, y+height1/2 );
} // func 

void trianglePointingLeft(int x, int y) {
  // gives a triangle pointing left < (e.g. to use as previous song).
  // x=left side, y = y-value of point on the left side (middle).
  // size is small. 
  final int width1=6;
  final int height1=8; 

  noStroke();
  triangle ( x, y-height1/2, 
  x - width1, y, 
  x, y+height1/2 );
} // func 

void signFolderUp (int x, int y) {
  // gives a sign for folder up
  final int width1=6;
  final int height1=8;

  noStroke();
  x+=21;
  y+=14;
  triangle ( x-width1, y, 
  x, y-height1, 
  x+width1, y );
} 
//
void signHome(int x, int y) {
  // gives a sign for a house / home sign
  final int width1=6;
  final int height1=8;

  // fill( 2, 255, 0 );
  //strokeWeight(1);
  //stroke ( 2, 255, 0 );
  //noFill();
  x+=21;
  y+=11;
  triangle ( x-width1, y, 
  x, y-height1, 
  x+width1, y );
  rect(x-width1/2, y, width1, width1);
  rect(x-width1/4+1, y+height1/4+1, width1/4, width1/3);
  //strokeWeight(1);
}
//

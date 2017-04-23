

// 3D-arrow as a PShape 

PShape shapeArrow; 

// ------------------------------------------------------------

void setup() {
  size(600, 400, P3D);
  makeArrow();
}

void draw() {
  background(0);
  lights();

  translate(width/2, 200, 0);
  rotateY(map(mouseX, 0, width, 0, TWO_PI)); 
  rotateX(map(mouseY, 0, height, 0, TWO_PI)); 
  displayArrow();
}

// ----------------------------------------

void makeArrow() {

  // some color consts
  final color RED = color(255, 0, 0);
  final color GREEN = color(0, 255, 0);
  final color BLUE = color(0, 0, 255);

  final color LIGHTGRAY = color(111);

  // points in 2D
  final int[] x = {
    -50, 0, 50, 25, 25, -25, -25, -50
  };
  final int[] y = {
    0, -50, 0, 0, 50, 50, 0, 0
  };

  // how thick is the arrow (1/2)
  final int halfOfTheThickness = 12; 

  shapeArrow=createShape(GROUP); 

  // all no Stroke
  // noStroke();

  // 1 -----------------------------------------
  // arrow Form - ceiling 
  PShape helperChildShape = createShape(); 
  helperChildShape.beginShape();
  helperChildShape.fill(RED); // RED
  helperChildShape.noStroke(); 
  for (int i = 0; i<8; i++) {
    helperChildShape.vertex(x[i], y[i], -halfOfTheThickness);
  }
  helperChildShape.endShape(CLOSE);
  //
  shapeArrow.addChild(helperChildShape); 

  // 2 -----------------------------------------
  // arrow Form - floor
  helperChildShape =  createShape();   
  helperChildShape.beginShape();
  helperChildShape.fill(GREEN); // 
  helperChildShape.noStroke(); 
  for (int i = 0; i<8; i++) {
    helperChildShape.vertex(x[i], y[i], halfOfTheThickness);
  }
  helperChildShape.endShape(CLOSE);

  shapeArrow.addChild(helperChildShape); 
  //

  // 3 -----------------------------------------
  // walls of the arrow
  helperChildShape = createShape(); 
  helperChildShape.beginShape(QUAD_STRIP);
  helperChildShape.fill(BLUE); //  
  helperChildShape.noStroke(); 
  for (int i = 0; i<x.length; i++) {
    helperChildShape.vertex(x[i], y[i], -halfOfTheThickness);
    helperChildShape.vertex(x[i], y[i], halfOfTheThickness);
  }
  helperChildShape.endShape(CLOSE);

  shapeArrow.addChild(helperChildShape);
}//func
// --------------------------------------------------------------

void displayArrow() {
  shape( shapeArrow, 0, 0 );
} // func
//
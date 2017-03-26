

boolean isRotating = true; 
int counterForRotation=0; 

// -------------------------------------------------------------
// Core Functions  

void setup() { 
  size(550, 550);
} // func

void draw() {
  background(0);

  if (isRotating) {
    counterForRotation++;
  }//if 

  translate(width/2, height/2);   // Move coordinate system to center of sketch
  rotate(counterForRotation * 0.001 * TWO_PI);    // rotate

  figure();
} // func 

// -------------------------------------------------------------
// Inputs 

void mousePressed() {
  isRotating = !isRotating; // ! means "not"
} // func

// -------------------------------------------------------------
// Minor Functions 

void figure() {
  fill(150); 
  rect(-50, -50, 100, 100); //TEST
} // func
//
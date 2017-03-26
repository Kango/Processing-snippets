

void setup() {
  size(640, 360, P3D);
}

void draw() {
  background(0);
  lights();
  depth(260);
}

void depth(float z1) {

  pushMatrix();

  // A vector that points to the mouse location
  PVector mouse = new PVector(mouseX, mouseY, 0);
  stroke(255);
  drawLine(220, 220, -220, 
    mouse.x, mouse.y, mouse.z, 
    22, 
    color(255, 0, 0));

  popMatrix();
}
// 

// -----------------------------------------------

void drawLine(float x1, float y1, float z1, 
  float x2, float y2, float z2, 
  float weight, 
  color strokeColour)
  // was called drawLine; programmed by James Carruthers
  // see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9
{
  PVector p1 = new PVector(x1, y1, z1);
  PVector p2 = new PVector(x2, y2, z2);
  PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
  float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
  float phi = acos(v1.z/rho);
  float the = atan2(v1.y, v1.x);
  v1.mult(0.5);

  pushMatrix();
  translate(x1, y1, z1);
  translate(v1.x, v1.y, v1.z);
  rotateZ(the);
  rotateY(phi);
  noStroke();
  fill(strokeColour);
  // box(weight,weight,p1.dist(p2)*1.2);
  box(weight, weight, p1.dist(p2)*1.0);
  popMatrix();
}

//

class Ellipse {

  // this is one ellipse 

  boolean visible; 
  PVector pos;

  // constr 
  Ellipse (float EllipseWidth_) {
    //  w=EllipseWidth_;
  } // constr

  void display() {
    if (!visible)
      return; 

    if (pos==null) 
      return;

    pushMatrix();
    fill(255, 2, 2); 
    noStroke(); 
    translate(pos.x+200, pos.y-200);  // pos.z
    ellipse(0, 0, 2, 2);
    popMatrix();
  }
} // class 

//
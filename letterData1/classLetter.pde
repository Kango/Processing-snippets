

class Letter {

  // one letter consists of many Ellipses

  Ellipse [] MyEllipsees = new Ellipse [MaxEllipses]; // array

  final int EllipseWidth=3; 

  Letter() {
    // Init
    for (int i = 0; i < MaxEllipses; i = i+1) {
      MyEllipsees[i] = new Ellipse(EllipseWidth); 
      MyEllipsees[i].visible=false;
    }  // for
  }//constr

  void display() {
    for (int i = 0; i < MaxEllipses; i++) {
      MyEllipsees[i].display();
    }
  }//class
  //
} // end of class
// 
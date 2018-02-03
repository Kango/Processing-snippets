
void wordDefinition() {

  // making all letters

  int factorBetweenEllipsees = 3;
  int factorBetweenLetters = 30;

  Word1.toUpperCase();  

  // go through the letters of the sentence / word
  for (int i = 0; i < Word1.length(); i++ ) {

    Letter newLetter = new Letter();  

    buffer = new String[bufferSize];
    bufferWritePosition=0;
    letterSpacing=0; 

    keyPaintHelper(Word1.charAt(i));

    int EllipseCount=0; 

    for (int j = 0; j < bufferWritePosition; j++) {
      for (int k = 0; k < buffer[j].length(); k++) {

        if (buffer[j].charAt(k) == '*') {
          // has a * 
          PVector newPVector = new PVector( 
            ((i*factorBetweenLetters)+j*factorBetweenEllipsees) + factorBetweenLetters-100+letterSpacing, 
            300-(k*factorBetweenEllipsees)+100 );

          newLetter.MyEllipsees[EllipseCount].pos=newPVector.copy(); 
          newLetter.MyEllipsees[EllipseCount].visible=true;
          EllipseCount++;
        } // if
      } // for
      //     } // for
    } // for

    // ---------------------------------------------

    if (Word1.charAt(i)==' ') {
      // Space: All invisible 
      for (int i3 = 0; i3 < MaxEllipses; i3++) {
        newLetter.MyEllipsees[i3].visible=false;
      } // for
    } // if 

    listOfLetters.add(newLetter); 
    //
  } // for 
  //
}  // function
//
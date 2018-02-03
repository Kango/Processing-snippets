
// shows a sentence / word
// code from the forum not by me

// https : // forum.processing.org/two/discussion/26229/typeface-which-changes-with-a-kitchen-scale-issues#latest

//  sentence to display
String Word1 = "Hello World! abcdefghijklmnopqrstuvwxyz"; 

// variables =============================================

ArrayList<Letter> listOfLetters = new ArrayList(); 
int letterSpacing = 0;   

int bufferSize = 1256;

int bufferWritePosition = 0;

String[] buffer = new String[bufferSize];

final int MaxEllipses = 599; 

// functions =============================================

void setup () {
  size (1400, 600, P2D);
  background(0);

  wordDefinition();
} // setup 

void draw () {
  background(0);
  ShowWord();
} // draw

// ----------------------------------------------------------

void ShowWord() {
  for (Letter letter : listOfLetters) {
    letter.display();
  }//for
} // ShowWord
//


// Buttons 

void defineButtons() {

  // define buttons
  buttonPause = new Button (  width/2-10, 65, 
  20, 20, 
  false, color (255, 0, 0), 
  true, color (255), 
  "", 
  "Pause / Play", 
  0);
  buttonPause.hasImage=true;
  buttonPause.imageType=buttonPause.imgPause;
  buttonPause.colorImgFill=color (255, 0, 0);

  //
  buttonProgressFrame = new Button ( 10, 40, 
  width-20, 20, 
  false, color (0), 
  true, color (255), 
  "", 
  "Click to set play position", 
  1); 
  //
  buttonProgressData = new Button ( 12, 42, 
  0, 17, 
  true, color (255, 1, 1), 
  false, color (255), 
  "", 
  "", 
  -1);
  //
  buttonPrevious = new Button (  width/2-70, 65, 
  20, 20, 
  false, color (255, 0, 0), 
  true, color (255), 
  "", 
  "Previous song", 
  2);
  buttonPrevious.hasImage=true;
  buttonPrevious.imageType=buttonPrevious.imgTriangleLeft;
  buttonPrevious.colorImgFill=color (255, 0, 0);

  buttonNext = new Button (  width/2+50, 65, 
  20, 20, 
  false, color (255, 0, 0), 
  true, color (255), 
  "", 
  "Next song", 
  3);
  buttonNext.hasImage=true;
  buttonNext.imageType= buttonNext.imgTriangleRight;
  buttonNext.colorImgFill=color (255, 0, 0);

  // open folder 
  buttonFolder = new Button ( width-50, 65, 
  40, 20, 
  false, color (0), 
  true, color (255), 
  "Open", 
  "Open folder", 
  4);
  //
  // list or meta
  buttonShowSongListOrOneSong = new Button ( 10, 65, 
  34, 20, 
  false, color (0), 
  true, color (255), 
  "List", 
  "Show song list", 
  5);
  // change button accordingly 
  changeButtonSongList();
  //
  buttonFolderUp= new Button ( width-50, 95, 
  40, 20, 
  false, color (0), 
  true, color (255), 
  "", 
  "Folder Up", 
  6);
  buttonFolderUp.hasImage  = true;
  buttonFolderUp.imageType = buttonFolderUp.imgFolderUp;
  buttonFolderUp.colorImgFill=color (0, 255, 0);
  //
  buttonHome = new Button ( width-98, 95, 
  40, 20, 
  false, color (0), 
  true, color (255), 
  "", 
  "Go to home folder", 
  7);
  buttonHome.hasImage  = true;
  buttonHome.imageType = buttonFolderUp.imgHome;
  buttonHome.hasColorImgFill=false;    // no fill 
  buttonHome.colorImgFill=color (255); // not in use
  buttonHome.hasColorImgStroke=true;   // stroke
  buttonHome.colorImgStroke=color (0, 255, 0); // green 
  //
  buttonPreviousFolder = new Button ( width-190, 95, 
  20, 20, 
  false, color (0), 
  true, color (255), 
  "", 
  "Previous Folder", 
  8);
  buttonPreviousFolder.hasImage=true;
  buttonPreviousFolder.imageType=buttonPrevious.imgTriangleLeft;
  buttonPreviousFolder.colorImgFill=color (0, 255, 0);

  buttonNextFolder = new Button ( width-165, 95, 
  20, 20, 
  false, color (0), 
  true, color (255), 
  "", 
  "Next Folder", 
  9);
  buttonNextFolder.hasImage=true;
  buttonNextFolder.imageType= buttonNext.imgTriangleRight;
  buttonNextFolder.colorImgFill=color (0, 255, 0);
} // func 

// ----------------------------------------------------------------------

void checkMouseOver() {
  // show mouse over text (tool tip text)
  if (millis() - timeSinceLastMouseMoved > 800) {
    
    switch (state) {
    case stateNormal: 
      checkMouseOverForStateNormal () ;
      break;
    case stateFileManager:  
      if (buttonFolder.over()) {
        buttonFolder.showMouseOver();
      } // if
      else if (buttonFolderUp.over()) {
        buttonFolderUp.showMouseOver();
      } // if
      else if (buttonHome.over()) {
        buttonHome.showMouseOver();
      } // if      
      break;
    case stateDrives:
      if (buttonHome.over()) {
        buttonHome.showMouseOver();
      } // if      
      break;
    default:
      println ("Missing state, error 106, tab Buttons");
      exit();
      break;
    } // switch
    
  } // if 
  //
} // func 

void checkMouseOverForStateNormal () {

  // which button
  if (buttonPause.over()) {
    buttonPause.showMouseOver() ;
  }
  else if (buttonProgressFrame.over()) {
    buttonProgressFrame.showMouseOver() ;
  }
  else if (buttonNext.over()) {
    buttonNext.textMouseOver2 = "";
    try {
      if (indexFile==namesFiles.length-1) {
        buttonNext.textMouseOver2 = showSongWithoutFolder2 (namesFiles [0]) 
          + " (from beginning)";
      }
      else 
        buttonNext.textMouseOver2 = showSongWithoutFolder2 (namesFiles [indexFile+1]) ;
    }
    catch (Exception e) {
      //
      buttonNext.textMouseOver2 = "";
    }
    finally {
      // buttonNext.textMouseOver2 = "";
    }
    buttonNext.showMouseOver() ;
  }
  else if (buttonPrevious.over()) {
    buttonPrevious.textMouseOver2 = "";
    try {
      if (indexFile==0) {
        buttonPrevious.textMouseOver2 = showSongWithoutFolder2 (namesFiles [indexFile]) 
          + " (playing)";
      }
      else 
        buttonPrevious.textMouseOver2 = showSongWithoutFolder2 (namesFiles [indexFile-1]) ;
    }
    catch (Exception e) {
      //
      buttonPrevious.textMouseOver2 = "";
    }
    finally {
      // 
    }
    buttonPrevious.showMouseOver() ;
  }
  else if (buttonFolder.over()) {
    buttonFolder.showMouseOver() ;
  } 
  else if (buttonShowSongListOrOneSong.over()) {
    buttonShowSongListOrOneSong.showMouseOver() ;
  }  
  else {
    //
  } // else
} // func 

void changeButtonSongList() {
  // this is for one special button
  // change button accordingly:
  // it can show the word Song or the word List 
  if (showSongList)
  {
    // showing the list, make button the opposite
    buttonShowSongListOrOneSong.text="Song";
    buttonShowSongListOrOneSong.textMouseOver="Show the data of current song";
    buttonShowSongListOrOneSong.w=40;
  }
  else
  {
    buttonShowSongListOrOneSong.text="List";
    buttonShowSongListOrOneSong.textMouseOver="Show the song list";
    buttonShowSongListOrOneSong.w=31;
  }
}

// =======================================================================

class Button {
  // represents a button 
  float x;    // position
  float y;
  float w=0;  // size
  float h=0;

  // color for button  
  boolean hasColorFill=true;   // if it has filling 
  color colorFill;             // what is its color?
  //
  boolean hasColorStroke=true; // if it has an outline 
  color  colorStroke;          // what is it?
  // color for images 
  boolean hasColorImgFill=true;   // if image has filling 
  color colorImgFill;             // what is its color?
  // not in use: 
  boolean hasColorImgStroke=true; // if it has an outline 
  color  colorImgStroke;          // what is it?

  // other 
  String text="";           // text to display
  String textMouseOver =""; // text for mouse over I.
  String textMouseOver2=""; // text for mouse over II.
  int commandNumber;        // each button has a command number that gets executed when clicked
  //
  // image button (for prev, next, play/pause)
  final int imgProvokeError  = -2;   // image types (consts)
  final int imgUndefined     = -1;   // image types (consts)
  final int imgTriangleLeft  = 0;
  final int imgTriangleRight = 1;
  final int imgPause         = 2;
  final int imgFolderUp      = 3;
  final int imgHome          = 4;  
  int imageType = imgProvokeError;  // current type (one of the previous)
  boolean hasImage = false;         // yes/no
  //

  // constructor
  Button (  
  float x_, float y_, 
  float w_, float h_, 
  boolean hasColorFill_, color cFill_, 
  boolean hasColorStroke_, color cStroke_, 
  String text_, 
  String textMouseOver_, 
  int commandNumber_) {
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    // color fill
    hasColorFill=hasColorFill_;
    colorFill=cFill_;
    // color stroke 
    hasColorStroke = hasColorStroke_;
    colorStroke = cStroke_;
    // 
    text=text_;
    textMouseOver=textMouseOver_;
    commandNumber=commandNumber_;
  } // constructor
  //
  void display () {
    if (hasColorFill)
      fill(colorFill);
    else 
      noFill();
    if (hasColorStroke)
      stroke(colorStroke);
    else 
      noStroke();
    rect(x, y, w, h);
    fill(255);
    if (hasImage) {
      showImage();
    }
    else 
    {
      text(text, x+6, y+15);
    }
  } // method 
  //
  void showImage() {
    if (hasColorImgFill)
      fill(colorImgFill);
    else 
      noFill();
    //
    if (hasColorImgStroke)
      stroke(colorImgStroke);
    else 
      noStroke();

    switch (imageType) {
    case imgUndefined:
      // do nothing
      break;
    case imgTriangleLeft:
      trianglePointingLeft(int(x)+13, int(y)+10);
      break;
    case imgTriangleRight:
      trianglePointingRight(int(x)+9, int(y)+10);
      break;
    case imgPause:
      // pause
      signPause(int(x), int(y)+5);
      break;
    case imgFolderUp:
      signFolderUp(int(x), int(y));
      break;
    case imgHome:
      signHome(int(x), int(y));
      break;  
    default:
      // error 
      println ("error 268: no such image type (tab Buttons) : " + imageType);
      exit();
      break;
    } // switch
  } // method 
  //
  boolean over() {
    return (mouseX>x && mouseX<x+w&& mouseY>y&&mouseY<y+h);
  } // method
  //
  void showMouseOver() {
    // yellow mouse over help text 
    if (!textMouseOver.equals("")) {
      float pos=x; // or  mouseX;
      // right screen border? 
      if (pos+textWidth(textMouseOver)+10>width) {
        pos=width-textWidth(textMouseOver)-12;
      }
      fill(255, 255, 44);
      noStroke();
      rect(pos, y+h+14, textWidth(textMouseOver)+5, 20);
      fill(0);
      text ( textMouseOver, pos+2, y+48 );
    }
    //
    if (!textMouseOver2.equals("")) {
      float pos=x; // or  mouseX;
      // right screen border? 
      if (pos+textWidth(textMouseOver2)+10>width) {
        pos=width-textWidth(textMouseOver2)-12;
      }
      fill(255, 255, 44);
      noStroke(); 
      rect(pos, y+h+14+17, textWidth(textMouseOver2)+5, 20);
      fill(0);
      text ( textMouseOver2, pos+2, y+48+17 );
    }
    //
  } // method  
  //
} // class 
//
// ---------------------------------

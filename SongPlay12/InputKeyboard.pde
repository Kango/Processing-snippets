

// Input Keyboard


void keyPressed () {
  // keyPressed uses the same command as the buttons
  switch (state) {
  case stateNormal: 
    analyzeKeyNormal();
    break;
  case stateFileManager:
    // state file manager 
    analyzeKeyForStateFileManager();
    break;
  case stateHelp:
    // in state help we want to return to prev state
    key=0; 
    if (formerState>=0)
      state=formerState;
    else 
    state=stateNormal;
    break;
  case stateDrives:
    analyzeKeyForStateDrives();
    break;   
  default:
    println ("Missing state, error 123, tab InputKeyboard");
    exit();
    break;
  } // switch
}  // func 

// -------------------------------------------

void analyzeKeyNormal() {
  // state normal - we listen to a song
  // which key
  if (key==CODED) {
    switch (keyCode) {
    case  java.awt.event.KeyEvent.VK_F1:
      // F1 (or use h for help)
      formerState=state;
      state=stateHelp;
      break;
    } // switch
  } // if 
  else 
  {
    switch (key) {
    case ' ':
      command( buttonPause.commandNumber );
      break;
    case 'n':
      command( buttonNext.commandNumber );
      break;
    case 'p':  
      command( buttonPrevious.commandNumber );
      break;
    case 'o':
      command( buttonFolder.commandNumber );
      break;
    case 'a':
      // 
      break;
    case 'i':
      // show image from MP3 when available
      tryToShowCoverImage();
      showMp3Image=true;
      break;
    case 'I':
      showMp3Image=false;
      break;  
    case 'k':
      String pathGlobalLocal=pathGlobal.getAbsolutePath();
      pathGlobalLocal=pathGlobalLocal.replace("//", "\\");
      println ("opening " + pathGlobalLocal);
      String[] params = { 
        "explorer", pathGlobalLocal
      };
      launch(params);
      break;
    case 'f':
      // toggle
      showFFT=!showFFT;
      break;
    case 'h':
      formerState=state;
      state=stateHelp;
      break;
    default:
      if (key>='0'&&key<='9') {
        int keyInt=int(key)-48-1;
        println ("Number "+keyInt);
        // if value ok
        if (keyInt>=0 && keyInt<namesFiles.length-1) {
          // use input as song number 
          indexFile=keyInt;
          getCurrentSong();
        } // if
      } // if 
      break;
    } // switch
  } // else
} // func 

// ------------------------------------------------------------

void analyzeKeyForStateFileManager() {
  // state file manager 
  if (key == CODED) {
    // coded key / special key
    analyzeKeyForStateFileManagerCoded();
  } // if  
  else 
  {
    // Normal key. 
    analyzeKeyForStateFileManagerNotCoded();
  } // else
} // func

void analyzeKeyForStateFileManagerCoded() {
  switch (keyCode) {
  case  java.awt.event.KeyEvent.VK_F1:
    formerState=state;
    state=stateHelp;
    break;
  case UP:
    from--;
    if (from<0)
      from = 0;
    break;
  case DOWN:
    from++;
    break;
  case java.awt.event.KeyEvent.VK_HOME:
    from = 0;
    break;
  case java.awt.event.KeyEvent.VK_END:
    from=namesFolders.length-14;
    break;
  case java.awt.event.KeyEvent.VK_PAGE_UP:
    // println("pg up");
    command( buttonFolderUp.commandNumber );
    break;
  case java.awt.event.KeyEvent.VK_PAGE_DOWN:
    println("pg down");
    break;
  } // swith
} // func 

void analyzeKeyForStateFileManagerNotCoded() {
  // not coded 
  switch (key) {
  case 'o':
    // open
    command( buttonFolder.commandNumber );
    break;
  case 'u':
    // up
    from--;
    if (from<0)
      from = 0;
    break;  
  case 'd':
    // down 
    from++;
    break;  
  case 'f':
    // first
    from=0;
    break;
  case 'l': 
    // last
    from=namesFolders.length-14;
    break;
  case 'h':
    formerState=state;
    state=stateHelp;
    break;
  default:
    // do nothing 
    break;
  } // switch
  //
} // func  
// 
void analyzeKeyForStateDrives() {
  // which key
  if (key==CODED) {
    switch (keyCode) {
    case  java.awt.event.KeyEvent.VK_F1:
      // F1 (or use h for help)
      formerState=state;
      state=stateHelp;
      break;
    default:
      // do nothing
      break;
    } // switch
  } // if 
  else 
  {
    switch (key) {
    case 'h':
      formerState=state;
      state=stateHelp;
      break;
    default:
      // do nothing
      break;
    } // switch
  } // else
} // func 
//


// command

void command( int commandNumber ) {
  // can execute the command number from the screen buttons
  switch (commandNumber) {
  case 0:
    // toggle pause 
    if (song.isPlaying()) {
      song.pause();
      paused=true;
      // buttonPause.text=">";
      buttonPause.imageType=buttonPause.imgTriangleRight;
    } else 
    {
      song.play();
      paused=false;
      // buttonPause.text="||";
      buttonPause.imageType=buttonPause.imgPause;
    }
    break;
  case 1:
    // progress bar: set cue 
    int newSongPosition = int ( map(mouseX, 
      buttonProgressFrame.x, buttonProgressFrame.x+buttonProgressFrame.w, 
      0, songLength ) ) ; 
    song.cue( newSongPosition );
    break;
  case 2:
    // prev 
    indexFile--;
    if (indexFile<0)
      indexFile=0;
    getCurrentSong() ;
    break;
  case 3:
    // next 
    indexFile++;
    // last song? 
    if (indexFile>=namesFiles.length)
      indexFile=0; // 1st song in folder  
    getCurrentSong() ;
    break;
  case 4:
    // folder
    state=stateFileManager;
    makeFolderList(true);
    break;
  case 5:
    // toggle 
    showSongList=!showSongList;
    // change button accordingly 
    changeButtonSongList();
    break;
  case -1:
    // undefined
    break; 
  case 6:
    // go one folder up (parent folder)
    folderUpFunction();
    break; 
  case 7:
    // go to home folder 
    goHomeFolder();
    makeFolderList(true);
    break;
  case 8:
    // prev folder
    usedPathsIndex--;
    if (usedPathsIndex<0)
      usedPathsIndex=0; 
    File temp = usedPaths.get(usedPathsIndex);
    if (temp!=pathGlobal)
      pathGlobal = temp;
    makeFolderList(false) ;
    break;
  case 9:
    // next folder 
    usedPathsIndex++;
    if (usedPathsIndex>=usedPaths.size())
      usedPathsIndex=usedPaths.size()-1; 
    temp = usedPaths.get(usedPathsIndex);
    if (temp!=pathGlobal)
      pathGlobal = temp;
    makeFolderList(false) ;
    break;
  default:
    // error 
    println("Error 101, tab command; unknown command: "
      + commandNumber) ;
    exit(); 
    break;
  } // switch
} // func  
//

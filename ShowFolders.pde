
// tab for the list of Folders

void makeFolderList(boolean storeIntoUsedPaths) {
  File dir = pathGlobal;  
  //
  if (dir!=null) {
    File[] namesFiles2 = dir.listFiles();
    namesFolders = new String [0];
    if (namesFiles2!=null) {
      // check all found files if they are folders/ok
      for (int i = 0; i < namesFiles2.length; i++) { 
        // show folders that are not hidden 
        if (namesFiles2[i].isDirectory() && !namesFiles2[i].isHidden()) {
          // build new array
          namesFolders = append (namesFolders, namesFiles2[i].getAbsolutePath() );
        } // if
      } // for
    } // if
    // make buttons for list
    makeButtonsForList (namesFolders);
    //
    if (storeIntoUsedPaths) {
      usedPaths.add(pathGlobal);
      usedPathsIndex++;
    }
  } // if 
  //
} // func 
//
void folderUpFunction() {
  // go up one folder (parent folder) 
  boolean succeded=true;
  File dir = pathGlobal;  
  if (dir.isDirectory())
  {
    File temp = dir.getParentFile(); 
    if (temp!=null) { 
      File dirParent = new File( dir.getParent() );
      // OK 
      pathGlobal = dir.getParentFile();
      println (pathGlobal);
      if (pathGlobal==null) {
        println ("pathGlobal is null");
        pathGlobal = dir;
      }
    } // if
    else 
    {
      makeDrivesList();
      state = stateDrives;
      succeded=false;
    }
  }
  else 
  {
    // no folder 
    pathGlobal = dir.getParentFile();
  } // else 

    if (succeded) {
    makeFolderList(true);
  }
}
//
void goHomeFolder() {
  pathGlobal = new File (pathGlobalHome);
  usedPaths.add(pathGlobal);
  usedPathsIndex++;
}
//

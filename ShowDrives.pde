
// tab drives 

void makeDrivesList() {
  // show drives / show roots
  File[] roots = File.listRoots();
  namesFolders=new String[roots.length];
  from=0;
  indexFolder=0;

  for (int i=0;i<roots.length;i++) {
    namesFolders[i] = roots[i].getAbsolutePath();
  }
  // make buttons for list
  makeButtonsForList (namesFolders);
  //
} // func 
//

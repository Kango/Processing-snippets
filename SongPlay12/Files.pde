
// File handling 

void getCurrentSong() {  
  // this loads song from the data folder
  // check if ok 
  if (namesFiles.length>0) {  
    if (fileIsOK (namesFiles[indexFile])) {
      // stop old song if playing one 
      if (song != null) {
        song.close();
        minim.stop();
      }
      state = stateNormal; 
      song = minim.loadFile( namesFiles[indexFile] ); 
      songLength=song.length();
      // load meta
      meta = song.getMetaData();
      // an FFT needs to know how
      // long the audio buffers it will be analyzing are
      // and also needs to know
      // the sample rate of the audio it is analyzing
      fft = new FFT(song.bufferSize(), song.sampleRate());
      //
      song.play();
    } // if 
    else 
    {
      println ("not ok "+ namesFiles[indexFile]);
    }
  } // if 
  else 
  {
    println ("no song found at all - not ok. ");
    state = stateFileManager;
  } // else
} // func 
//
void getFolder() {
  // get file list 
  if ( pathGlobal.getAbsolutePath().equals("") ) {
    println("pathGlobal is == empty");
    pathGlobal = new File (dataPath(""));
  }
  if ( !pathGlobal.exists() ) {
    folderDoesExist=false;
  }
  else {
    folderDoesExist=true;
  }
  //
  File dir = new File( pathGlobal.getAbsolutePath() ); 
  //println(dir);
  //
  File[] namesFiles2 = dir.listFiles();
  if (namesFiles2==null) {
    println("no file found - ###############++++++++");
    // pathGlobal = new File (dataPath(""));
    dir = new File( pathGlobal.getAbsolutePath() );  
    //println(dir);
    //
    namesFiles2 = dir.listFiles(); // dir.list();
  }
  namesFiles = new String [0];
  if (namesFiles2!=null) {
    // check all found files if they are ok 
    for (int i = 0; i < namesFiles2.length; i++) {
      // if ok 
      if (fileIsOK(namesFiles2[i].getAbsolutePath() )) {
        // build new array
        namesFiles = append (namesFiles, namesFiles2[i].getAbsolutePath() );
        state = stateNormal;
      } // if 
      else 
      {
        // println ("skipped "+namesFiles2[i]);
      } // else
    } // for
  } // if 
  //
  println("Found "+ namesFiles.length + " songs.");
  // println(namesFiles); 
  indexFile=0;
  //
  if (namesFiles.length==0) {
    println ("no song ############-----------");
    state = stateFileManager; 
    makeFolderList(true);
  }
  else
  {
    state = stateNormal;
    // make buttons for list
    makeButtonsForList(namesFiles);
    tryToShowCoverImage();
  }  // else  
  //
}  // func 
//
boolean fileIsOK (String name) {
  // AudioPlayer: playback of WAV, AIFF, AU, SND, and MP3 files.
  if (name==null) { 
    return false; // not ok
  }
  name=trim(name);
  if (name.equals("")) return false;  
  if (name.substring (  name.length()-4 ).equals (".MP3")  ) return true; 
  if (name.substring (  name.length()-4 ).equals (".mp3")  ) return true; 
  if (name.substring (  name.length()-4 ).equals (".WAV")  ) return true;
  if (name.substring (  name.length()-4 ).equals (".wav")  ) return true;
  if (name.substring (  name.length()-5 ).equals (".aiff") ) return true;
  if (name.substring (  name.length()-3 ).equals (".au")   ) return true;
  if (name.substring (  name.length()-4 ).equals (".SND")  ) return true;
  if (name.substring (  name.length()-4 ).equals (".snd")  ) return true;
  // when no extension matched:   
  return false; // not ok
} // func 
//

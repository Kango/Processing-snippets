
// this tab contains Tools

void showOtherScreenElements() {
  // when we listen to a song
  // 
  // first perform a forward fft on one of song's buffers
  // I'm using the mix buffer
  // but you can use any one you like
  if (showFFT) {
    if (!(fft==null)) {
      fft.forward(song.mix);

      stroke(255, 0, 0, 128);
      // draw the spectrum as a series of vertical lines
      // I multiple the value of getBand by 4
      // so that we can see the lines better
      for (int i = 0; i < fft.specSize(); i++)
      {
        line(i, height, i, height - fft.getBand(i)*4);
      } // for
    } // if
  } // if  
  //
  fill(255);
  try {
    // show played 
    String text1 ="Played " 
      + strFromMillis ( song.position() )  
      + " of " 
        + strFromMillis ( songLength )  
        + "."; 
    text ( text1, width - (textWidth(text1)), 30 );
    // show pause 
    if (!song.isPlaying()) {
      fill(255);
      text ("pause", width/2-17, 54);
    } // if
  } // try 
  catch (Exception e) {
    // e.printStackTrace();
    // do nothing
  }
  //
  buttonShowSongListOrOneSong.display();
  buttonPrevious.display();
  buttonNext.display();
  //
  statusMsg.statusMsgShow();
  //
} // func 

// ------------------------------------------------------------

void showListFunction( String headline, String[] localArray, int indexHighlight ) {
  // data for list
  final int ys = 122;  // y start-pos
  final int yi = 21;   // y line difference 
  //
  int y = ys;
  // headline 
  textSize(17);
  fill(255, 2, 2);
  text ( headline, 25, y);
  //   
  textSize(12);
  y+=31;
  //
  // perform checks on start / end of list (when scrolling)
  // from and to is the range to be displayed
  if (from+14 > localArray.length)
    from=localArray.length-14;
  if (from<0)
    from =0;
  int to=from+14;
  if (to > localArray.length)
    to=localArray.length;
  //   
  for (int i = from; i < to; i++) {
    // line background 
    if (i%2 == 1)
      fill(25);
    else
      fill(125); 
    noStroke();
    rect(-1, y-14, width+3, 21);
    // text 
    fill(255);
    text((localArray[i]), 15, y);
    // 
    // this is used for song: 
    if (indexHighlight>-1) {  // if defined  
      if (i==indexHighlight) {  // and current line 
        // current song
        fill(255, 0, 0);  // highlight it with a >
        noStroke();
        trianglePointingRight(5, y-5);
      } // if
    } // if

    y+=yi; // next line
  } // for
} // func 

void makeButtonsForList ( String[] localArray ) {
  // make buttons for list 
  buttonsList.clear();
  for (int i = 0; i < localArray.length; i++) {
    buttonsList.add (new Button( -1, 122+31+(i*21)-14, 
    width+10, 21, 
    false, color (0), 
    false, color (255), 
    "", 
    "", 
    i) ) ;
  } // for
} // func

// -------------------------------------------------------------

String strFromMillis ( int m ) {
  // returns a string that represents a given amount of millis "m" 
  // as hours:minutes:seconds 
  // (can't do days etc.)
  float sec;
  int min;
  //
  sec = m / 1000;
  min = floor(sec / 60);  
  sec = floor(sec % 60);
  // over one hour? 
  if (min>59) { 
    int hrs = floor(min / 60);
    min = floor (min % 60); 
    return  hrs+":"+nf(min, 2)+":"+nf(int(sec), 2);
  }
  else 
  {
    return min+":"+nf(int(sec), 2);
  }
} // 
// 
String showSongWithoutFolder() {
  // returns short name of current file 
  if ( meta == null ) {
    println("meta==null");
    return "?";
  } // if 
  else { 
    String pathGlobal2=new String(pathGlobal.getAbsolutePath());
    if (pathGlobal2.charAt(pathGlobal2.length()-1) == '.')
      pathGlobal2=pathGlobal2.substring(0, pathGlobal2.length()-2);
    return meta.fileName().substring(pathGlobal2.length() + 1);
  } // else
} // func 
//
String showSongWithoutFolder2( String songNameLong ) {
  // returns short name of given file songNameLong
  if (songNameLong.length() > pathGlobal.getAbsolutePath().length() + 1) {
    String pathGlobal2=pathGlobal.getAbsolutePath();
    if (pathGlobal2.charAt(pathGlobal2.length()-1) == '.')
      pathGlobal2=pathGlobal2.substring(0, pathGlobal2.length()-2);
    return songNameLong.substring(pathGlobal2.length() + 1);
  }
  else
    return "?";
}
//
void textTab (String s, float x, float y)
{
  // makes \t as tab for a table for one line
  // (only for 2 columns yet)
  // 
  // indent:   
  int indent = 90;
  // 
  s=trim ( s );
  String [] texts = split (s, "\t");
  s=null; 
  texts[0]=trim(texts[0]);
  text (texts[0], x, y);

  //
  // do we have a second part?
  if (texts.length>1 && texts[1]!=null) {
    // is the indent too small
    if (textWidth(texts[0]) > indent) {
      indent = int (textWidth(texts[0]) + 10);
    } // if 
    //
    texts[1]=trim(texts[1]);
    text (texts[1], x+indent, y);
  } // if
} // func 
//
void stop()
{
  song.close();
  minim.stop();
  //
  super.stop();
}
// 

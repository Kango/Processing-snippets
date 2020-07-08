

// show meta data of a song

void showMeta() {
  //  
  // data for meta information 
  final int xs = 10;   // x start-pos
  final int ys = 115;  // y start-pos
  final int yi = 16;   // y line difference 
  //
  int y = ys;
  int i = 0;
  if (!(meta==null)) {
    setLineBkg(i++, y);
    textTab("File Name: \t" + showSongWithoutFolder(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Length: \t" + strFromMillis(meta.length()), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Title: \t" + meta.title(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Author: \t" + meta.author(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Album: \t" + meta.album(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Date: \t" + meta.date(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Comment: \t" + meta.comment(), xs, y);
    setLineBkg(i++, y+=yi);
    try {
      // setLineBkg(i++, y+=yi);
      // textTab("Track:   \t  " + meta.track(), xs, y+=yi);
    } 
    catch (ArrayIndexOutOfBoundsException e) { // to do ??? 
      System.err.println("Caught ArrayIndexOutOfBoundsException:      "
        +  e.getMessage());
    } 
    finally {
      // do nothing
    }; 
    // setLineBkg(i++, y+=yi);
    textTab("Genre:\t" + meta.genre(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Copyright:  \t" + meta.copyright(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Disc: \t" + meta.disc(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Composer: \t" + meta.composer(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Orchestra: \t" + meta.orchestra(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Publisher: \t" + meta.publisher(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Encoded: \t" + meta.encoded(), xs, y);
  } // if 
  setLineBkg(i++, y+=yi);
  textTab("Folder:\t" +  pathGlobal, xs, y);
  setLineBkg(i++, y+=yi);
  textTab("In folder:\t"
    +"song " 
    + str(indexFile+1) 
    + " of " 
    + namesFiles.length 
    + ".", xs, y);
  setLineBkg(i++, y+=yi);
  //
} // 

void setLineBkg( int i, int y) {
  // only lines 
  noFill();
  stroke(255);
  //rect(-1, y-12, width+3, 17);
  line(-1, y-12, width+3, y-12);
  fill(255);
}

void setLineBkg2( int i, int y) {
  // rects as background for the text lines 
  // in two gray colors
  if (i%2 == 1)
    fill(25);
  else
    fill(125);
  noStroke();
  rect(-1, y-12, width+3, 17);
  fill(255);
}
// --------------------------------------------



// 
// best version, now with states and a small help (F1)  
// also with MP3 image when available.
//
// *****************************************************
// config:
// make your changes here 
// enter your music path here
//            pathGlobalDefault: set path or use "" to use data path of the sketch  
final String pathGlobalDefault = "C://Musik//";
final String pathGlobalHome    = "C://Musik//Adele//";

// show song list / show information of one song 
boolean showSongList = false;  // list or meta
boolean showFFT      = true;   // show fft yes/no  
// end of config 
// *****************************************************


//import 
import ddf.minim.*;
import ddf.minim.analysis.*;

import java.io.*;
import java.awt.image.BufferedImage;
//
//
import java.awt.BorderLayout;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

// this File "pathGlobal" gets it path from "pathGlobalDefault" :
File pathGlobal;
// to go back & forth in old / used paths
ArrayList<File> usedPaths = new ArrayList();
int usedPathsIndex;
//
// see
// http://code.compartmental.net/tools/minim/quickstart/
// http://code.compartmental.net/minim/javadoc/

//
// states 
final int stateNormal      =0;        // play song 
// this is the state for file manager / when no song is found in the 
// folder:
final int stateFileManager =1;        // dir exists but has no mp3
final int stateHelp        =3;        // show help
final int stateUndefined   =-1;       // state Undefined
final int stateDrives      =4;        // state Drives

int state = stateNormal;              // current state 
int formerState = stateUndefined;     // when we go to the help screen, 
// we want to return to the state we were before in
// (it's only one help screen for the whole program)
//
// song stuff
Minim minim;
AudioPlayer song;
AudioMetaData meta;  // meta data of a song 
int songLength = 0;
boolean paused = false; 
FFT fft;          // frequence display
PImage mp3Image;  // show cover image from MP3
boolean showMp3Image = true; 
//
// screen buttons 
Button buttonPause; 
Button buttonProgressFrame; 
Button buttonProgressData;
Button buttonPrevious;
Button buttonNext;
Button buttonFolder;
Button buttonShowSongListOrOneSong;
Button buttonFolderUp;
Button buttonHome;
Button buttonPreviousFolder;
Button buttonNextFolder;
ArrayList<Button> buttonsList = new ArrayList();

// store time since last mouse moved - for tool tip text
int timeSinceLastMouseMoved=0;
//
// songs and Co.
String[] namesFiles; // songs in folder 
int indexFile = 0;   // index of current song in namesFiles

// folders and drives 
String[] namesFolders;
int from;
int indexFolder;
boolean folderDoesExist=true;
String headline; 
//
// Other vars
// background images 
PImage img;
PImage imgForFileManager;
//
// status msg (a class)
ClassStatusMsg statusMsg = new ClassStatusMsg();  

// ------------------------------------------------------------

void setup() {
  size(500, 500);
  pathGlobal=new File (pathGlobalDefault);
  usedPaths.add(pathGlobal);
  usedPathsIndex=0;

  minim = new Minim(this);
  getFolder();
  // define buttons
  defineButtons();   
  getCurrentSong();
  // get background images 
  img = loadImage("bkg.jpg");
  imgForFileManager = loadImage("forfiles.jpg");
  // store time since last mouse moved
  timeSinceLastMouseMoved = millis();
}

void draw() {
  // mouse for tool tip text 
  if ((mouseX!=pmouseX) || (mouseY!=pmouseY)) {
    // mouse has been moved:
    // store time since last mouse moved
    timeSinceLastMouseMoved = millis();
  }

  // states 
  switch (state) {
  case stateNormal:
    normalProgram ();
    break; 
  case stateFileManager: 
    stateFileManagerFunction();
    break; 
  case stateHelp:
    showHelp();
    break;
  case stateDrives:
    stateDrivesFunction(); 
    break; 
  default:
    println ("Missing state, error 111, tab Main");
    exit();
    break;
  } // switch
  //
} // func draw()  
// 

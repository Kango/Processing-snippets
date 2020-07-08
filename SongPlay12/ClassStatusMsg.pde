
// status msg 

class ClassStatusMsg { 

// status msg (lower left corner / status line)
boolean displayStatusMsg = false; 
int displayStatusMsgTimer = 0;
String displayStatusMsgText = "";

void statusMsg(String msg) {
  // init Message
  // e.g. "Drive not ready. No media?"
  println (msg);
  displayStatusMsg=true; 
  displayStatusMsgTimer=millis();
  displayStatusMsgText=msg;
} // func 

void statusMsgShow() {
  // show message 
  if (displayStatusMsg) {
    fill(255);
    text(displayStatusMsgText, 10, height-20);
    if (millis()>displayStatusMsgTimer+3000)
      displayStatusMsg=false;
  } // if
}

} // class 

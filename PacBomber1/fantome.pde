
// 

void depcat(int fX, int fY, 
  int depX, int depY) {

  // new vector needed? 
  if (dX == 0 && dY==0) {
    // yes

    // nearly always 
    if (random(1000)>150) {
      // search With Restrictions 
      getNewVectorWithRestrictions (catX, catY, dX, dY) ;
    } else { 
      // search again Without Restrictions 
      getNewVectorWithoutRestrictions (catX, catY, dX, dY) ;
    }
  }

  // still nothing found?
  if (dX == 0 && dY==0) {
    // search again Without Restrictions 
    getNewVectorWithoutRestrictions (catX, catY, dX, dY) ;
    //
  } 

  // if valid vector
  if (dX!=0 || dY!=0) {
    // and move possible
    if (tab[fY+dY][fX+dX]!=0) {
      // move
      catX+=dX; 
      catY+=dY;
      olddx=dX;
      olddy=dY;
    } else {
      olddx=dX;
      olddy=dY;
      dX=0;
      dY=0;
    }
  }

  // just reset sometimes so cat turns
  if (random(1000)>884) {
    olddx=dX;
    olddy=dY;
    dX=0;
    dY=0;
  }
}

void getNewVectorWithRestrictions(int fX, int fY, 
  int depX, int depY) {

  // try new dir in a random order

  String[] list =  { "0123", "0132", 
    "0213", "0231", 
    "0312", "0321", 

    "1320", "1302", 
    "1230", "1203", 
    "1032", "1023", 

    "2310", "2301", 
    "2130", "2103", 
    "2031", "2013", 

    "3120", "3102", 
    "3210", "3201", 
    "3012", "3021"  }; 

  int indexForList = int(random(list.length)); 

  for (int i=0; i<4; i++) {

    switch (list[indexForList].charAt(i)) { 

    case '0': 
      if (tab[fY][fX+1]!=0    &&(olddx!=-1||olddy!=0)      &&(olddx!=1||olddy!=0)     ) {      
        dX=1;
        dY=0;
        return;
      }
      break; 

    case '1':
      if (tab[fY-1][fX]!=0   &&(olddx!=0||olddy!=1)     ) {
        dY=-1;
        dX=0;
        return;
      } 
      break ;  

    case '2':
      if (tab[fY][fX-1]!=0   &&(olddx!=1||olddy!=0)     ) {
        dX=-1;
        dY=0;
        return;
      } 
      break ; 

    case '3':
      if (tab[fY+1][fX]!=0     &&(olddx!=0||olddy!=-1)     ) {
        dY=+1;
        dX=0;
        return;
      }
      break ;
    }// switch
  }//for
}//func

void getNewVectorWithoutRestrictions(int fX, int fY, 
  int depX, int depY) {

  // try new dir in a random order

  String[] list =  { "0123", "0132", 
    "0213", "0231", 
    "0312", "0321", 

    "1320", "1302", 
    "1230", "1203", 
    "1032", "1023", 

    "2310", "2301", 
    "2130", "2103", 
    "2031", "2013", 

    "3120", "3102", 
    "3210", "3201", 
    "3012", "3021" }; 

  int indexForList = int(random(list.length)); 

  for (int i=0; i<list.length; i++) {

    switch (list[indexForList].charAt(i)) { 

    case '0': 
      if (tab[fY][fX+1]!=0   ) {      
        dX=1;
        dY=0;
        return;
      }
      break; 

    case '1':
      if (tab[fY-1][fX]!=0      ) {
        dY=-1;
        dX=0;
        return;
      } 
      break ;  

    case '2':
      if (tab[fY][fX-1]!=0      ) {
        dX=-1;
        dY=0;
        return;
      } 
      break ; 

    case '3':
      if (tab[fY+1][fX]!=0      ) {
        dY=+1;
        dX=0;
        return;
      }
      break ;
    }// switch
  }//for
}
// 
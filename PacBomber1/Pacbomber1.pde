
int nomBlocX = 23;
int nomBlocY = 21;

int dimBloc = 25;
PImage mur, murPlein, pasMur; 
PImage doge;
int dogeX=300, dogeY=375;
int depdogX = 0, depdogY=0;
PImage dogetab [] = new PImage[4];

int vit = 5;
int tab[][]=new int[nomBlocY][nomBlocX];

int posTabX = 11, posTabY = 15;
int gomme;
PImage cat;
int catX = 2, catY=19, dX=0, dY=0, olddx=-1000, olddy=-1000;

void setup() {
  size (575, 525);
  frameRate(5);
  decor();
}

void draw() {
  background(0);
  if (tab[posTabY][posTabX]==1) {
    tab[posTabY][posTabX]=2;
    gomme--;
  }
  depcat(catX, catY, dX, dY);

  for (int i=0; i<nomBlocX; i++) {
    for (int j=0; j<nomBlocY; j++) {
      if (tab[j][i]==0) {
        image(mur, i*dimBloc, j*dimBloc);
      }
      if (tab[j][i]==1) {
        fill(255);
        ellipse(i*dimBloc+dimBloc/2, j*dimBloc+dimBloc/2, 5, 5);
      }
    }
  }

  if (depdogX>0) {
    if (tab[posTabY][posTabX+1]==0) {
      depdogX=0;
      depdogY=0;
    } else {
      posTabX++;
    }
  }
  if (depdogX<0) {
    if (tab[posTabY][posTabX-1]==0) {
      depdogX=0;
      depdogY=0;
    } else {
      posTabX--;
    }
  }

  if (depdogY>0) {
    if (tab[posTabY+1][posTabX]==0) {
      depdogX=0;
      depdogY=0;
    } else {
      posTabY++;
    }
  }
  if (depdogY<0) {
    if (tab[posTabY-1][posTabX]==0) {
      depdogX=0;
      depdogY=0;
    } else {
      posTabY--;
    }
  }

  image(doge, posTabX*dimBloc, posTabY*dimBloc);
  image(cat, catX*dimBloc, catY*dimBloc);
}

void decor() {
  mur = loadImage("data/mur.png");
  cat = loadImage("data/cat1.png");

  mur.resize(dimBloc, dimBloc);
  cat.resize(dimBloc, dimBloc);

  for (int j=0; j<nomBlocY; j++) {
    for (int i=0; i<nomBlocX/2+1; i++) {
      tab[j][i]=decor[j][i];
      tab[j][nomBlocX-i-1]=decor[j][i];
      if ( tab[j][i]==1) gomme+=2;
    }
  }

  dogetab[0]=loadImage("data/face.png");
  dogetab[1]=loadImage("data/right.png");
  dogetab[2]=loadImage("data/back.png");
  dogetab[3]=loadImage("data/left.png");

  for (int i=0; i<4; i++) {
    dogetab[i].resize(dimBloc, dimBloc);
  }

  doge = dogetab[0];
}

void keyPressed() {
  if (keyCode == UP ) { 
    depdogX= 0;
    depdogY= - 1;
  }
  if (keyCode == DOWN ) { 
    depdogX= 0;
    depdogY= 1;
  }

  if (keyCode == LEFT  ) { 
    depdogY=0;
    depdogX=-1;
  }
  if (keyCode == RIGHT  ) { 
    depdogY=0;
    depdogX=1;
  }
}
class Colone {

  public int nb;
  boolean init=false;
  int pos;
  ArrayList<Card> tab;
  ArrayList<Boolean> visible;
  PImage coeur = loadImage("res/hearts.png");
  PImage trefle = loadImage("res/clover.png");
  PImage pique = loadImage("res/spades.png");
  PImage carreau = loadImage("res/diamond.png");
  
  Colone(int nb) {
    this.nb=nb;
    this.tab = new ArrayList<Card>();
  }

  void draw() {
    switch(nb) {
    case 1:
      pos=100;
      break;
    case 2:
      pos=160;
      break;
    case 3:
      pos=220;
      break;
    case 4:
      pos=280;
      break;
    case 5:
      pos=340;
      break;
    case 6:
      pos=400;
      break;
    case 7:
      pos=460;
      break;
      // rect(460, 100, 50, 500);
    }
  }
  void update() {
    if (init==false) {
      init();
      init = true;
    }
    for (int i = 0; i <tab.size(); i++) {
      if (visible.get(i) == false) {
        fill(0, 0, 255);
        rect(pos, 100 + i*25, 50, 25);
      } else {
        noFill();
        rect(pos, 100 + i*25, 50, 25);
        switch(tab.get(i).getCouleur()) {
        case "C":
          image(coeur, pos + 5, 105 + i*25);
          break;
        case "P":
          image(pique, pos + 5, 105 + i*25);
          break;
        case "K":
          image(carreau, pos+ 5, 105 + i*25);
          break;
        case "T":
          image(trefle, pos+ 5, 105 + i*25);
          break;
        }
        textSize(15);
        text(tab.get(i).getNombre(), pos+25, 118+i*25);
      }
    }
  }


  void init() {
    this.visible= new ArrayList<Boolean>();
    coeur.resize(0, 15);
    trefle.resize(0, 15);
    pique.resize(0, 15);
    carreau.resize(0, 15);
    for (int i = 0; i <tab.size(); i++) {
      if (i!=tab.size()-1) {
        fill(0, 0, 255);
        rect(pos, 100 + i*25, 50, 25);
        visible.add(false);
      } else {
        visible.add(true);
        noFill();
        rect(pos, 100 + i*25, 50, 25);
        switch(tab.get(i).getCouleur()) {
        case "C":
          image(coeur, pos + 5, 105 + i*25);
          break;
        case "P":
          image(pique, pos + 5, 105 + i*25);
          break;
        case "K":
          image(carreau, pos+ 5, 105 + i*25);
          break;
        case "T":
          image(trefle, pos+ 5, 105 + i*25);
          break;
        }
        textSize(15);
        text(tab.get(i).getNombre(), pos+25, 118+i*25);
      }
    }
  }
}

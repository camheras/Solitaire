Paquet p;

Colone c1;
Colone c2;
Colone c3;
Colone c4;
Colone c5;
Colone c6;
Colone c7;

ArrayList<Colone> colones = new ArrayList<Colone>();

int[] positions;
int currentPosition = 1;
int selectionPosition = 0;
boolean flopvide=false;

ArrayList<Card> pilePique;
ArrayList<Card> pileCoeur;
ArrayList<Card> pileCarreau;
ArrayList<Card> pileTrefle;

ArrayList<Card> plateau;
ArrayList<Card> reste;
int indiceFlop = 0;

int posXFlop = 50;
int posYFlop = 0;

Card carteSelectionne;
Card carteDestination;

void setup() {
  positions = new int[12];
  repartirPositions();
  p = new Paquet();
  p.genererCartes();
  p.melangerPaquet();
  p.contenuPaquet();
  plateau = new ArrayList<Card>();
  reste = new ArrayList<Card>();
  c1 = new Colone(1);
  c2 = new Colone(2);
  c3 = new Colone(3);
  c4 = new Colone(4);
  c5 = new Colone(5);
  c6 = new Colone(6);
  c7 = new Colone(7);
  repartirCartes();
}

void settings() {
  size(510, 500, P3D);
}

void draw() {
  background(255);
  colones.add(c1);
  colones.add(c2);
  colones.add(c3);
  colones.add(c4);
  colones.add(c5);
  colones.add(c6);
  colones.add(c7);

  construire();
  update();
}

void construire() {
  PImage coeur = loadImage("res/hearts.png");
  PImage trefle = loadImage("res/clover.png");
  PImage pique = loadImage("res/spades.png");
  PImage carreau = loadImage("res/diamond.png");
  noFill();
  c1.draw();
  c2.draw();
  c3.draw();
  c4.draw();  
  c5.draw();
  c6.draw();
  c7.draw();
  coeur.resize(0, 25);
  trefle.resize(0, 25);
  pique.resize(0, 25);
  carreau.resize(0, 25);
  //As
  rect(450, 0, 50, 50);
  rect(400, 0, 50, 50);
  rect(350, 0, 50, 50);
  rect(300, 0, 50, 50);
  noFill();
  textSize(16);
  // text("K K", 465, 30);
  image(trefle, 465, 55);
  // text("K K", 415, 30);
  image(carreau, 415, 55);
  //text("K K", 365, 30);
  image(pique, 365, 55);
  //text("K K", 315, 30);
  image(coeur, 315, 55);

  fill(255);

  //flop
  if (flopvide == false) {
    fill(0, 0, 255);
  } else {
    fill(255);
  }
  rect(0, 0, 50, 50);
  noFill();
  rect(50, 0, 50, 50);
  fill(0);
  textSize(16);
  //text("K K", 13, 30);
  //text("K K", 63, 30);
  line(100, 0, 100, 500);
}

void repartirCartes() {
  for (int i = 0; i<28; i++) {
    plateau.add(p.paquet.get(i));
  }
  for (int i = 28; i<p.paquet.size(); i++) {
    reste.add(p.paquet.get(i));
  }
  for (int i = 0; i<c1.nb; i++) {
    c1.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c1.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c2.nb; i++) {
    c2.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c2.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c3.nb; i++) {
    c3.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c3.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c4.nb; i++) {
    c4.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c4.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c5.nb; i++) {
    c5.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c5.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c6.nb; i++) {
    c6.tab.add(plateau.get(i));
  }
  for (int i = 0; i<c6.nb; i++) {
    plateau.remove(0);
  }
  for (int i = 0; i<c7.nb; i++) {
    c7.tab.add(plateau.get(i));
  }
  for (int i =0; i<c7.nb; i++) {
    plateau.remove(0);
  }

  System.out.println(c1.tab.toString());
  System.out.println( c2.tab.toString());
  System.out.println( c3.tab.toString());
  System.out.println(c4.tab.toString());
  System.out.println(c5.tab.toString());
  System.out.println( c6.tab.toString());
  System.out.println(c7.tab.toString());
}

void update() {
  PImage coeur = loadImage("res/hearts.png");
  PImage trefle = loadImage("res/clover.png");
  PImage pique = loadImage("res/spades.png");
  PImage carreau = loadImage("res/diamond.png");
  coeur.resize(0, 15);
  carreau.resize(0, 15);
  trefle.resize(0, 15);
  pique.resize(0, 15);

  c1.update();
  c2.update();
  c3.update();
  c4.update();
  c5.update();
  c6.update();
  c7.update();

  if (reste.size()!=0) {

    String couleur = reste.get(indiceFlop).getCouleur();
    String nombre = reste.get(indiceFlop).getNombre();

    text(nombre, 60, 30);

    switch(couleur) {
    case "P":
      image(pique, 78, 18);
      break;
    case "K":
      image(carreau, 78, 18);
      break;
    case "C":
      image(coeur, 78, 18);
      break;
    case "T":
      image(trefle, 78, 18);
      break;
    }
  }

  noFill();
  stroke(255, 0, 0);
  switch(currentPosition) {

  case 1:
    rect(50, 0, 50, 50);
    break;
  case 2:
    rect(c1.pos, 100 + (c1.tab.size()-1)*25, 50, 25);
    break;
  case 3:
    rect(c2.pos, 100 + (c2.tab.size()-1)*25, 50, 25);
    break;  
  case 4:
    rect(c3.pos, 100 + (c3.tab.size()-1)*25, 50, 25);
    break;
  case 5:  
    rect(c4.pos, 100 + (c4.tab.size()-1)*25, 50, 25);
    break;
  case 6:
    rect(c5.pos, 100 + (c5.tab.size()-1)*25, 50, 25);
    break;
  case 7:
    rect(c6.pos, 100 + (c6.tab.size()-1)*25, 50, 25);
    break;
  case 8:  
    rect(c7.pos, 100 + (c7.tab.size()-1)*25, 50, 25);
    break;
  case 9:
    rect(300, 0, 50, 50);
    break;
  case 10:
    rect(350, 0, 50, 50);
    break;
  case 11:
    rect(400, 0, 50, 50);
    break;
  case 12:
    rect(450, 0, 50, 50);
    break;
  }
  stroke(0);

  noFill();
  stroke(0, 255, 0);

  switch(selectionPosition) {

  case 1:
    rect(50, 0, 50, 50);
    break;
  case 2:
    rect(c1.pos, 100 + (c1.tab.size()-1)*25, 50, 25);
    break;
  case 3:
    rect(c2.pos, 100 + (c2.tab.size()-1)*25, 50, 25);
    break;  
  case 4:
    rect(c3.pos, 100 + (c3.tab.size()-1)*25, 50, 25);
    break;
  case 5:  
    rect(c4.pos, 100 + (c4.tab.size()-1)*25, 50, 25);
    break;
  case 6:
    rect(c5.pos, 100 + (c5.tab.size()-1)*25, 50, 25);
    break;
  case 7:
    rect(c6.pos, 100 + (c6.tab.size()-1)*25, 50, 25);
    break;
  case 8:  
    rect(c7.pos, 100 + (c7.tab.size()-1)*25, 50, 25);
    break;
  case 9:
    rect(300, 0, 50, 50);
    break;
  case 10:
    rect(350, 0, 50, 50);
    break;
  case 11:
    rect(400, 0, 50, 50);
    break;
  case 12:
    rect(450, 0, 50, 50);
    break;
  }
  stroke(0);
}


void keyTyped() {
  //print(int(key));
  if (int(key) == 110 || int(key) == 78) {
    passeFlop();
  }
  if (int(key) == 100) {
    //delTout();
    changeDroite();
  }
  if (int(key) == 113) {
    changeGauche();
  }
  if (int(key) == 32) {
    selectionne();
  }
  if( int(key) == 122){
  print("haut");
  }
  
}

void delTout() {
  //reste.clear();
}

void passeFlop() {
  if (reste.size()!=0) {
    if (indiceFlop!=reste.size()-1) {
      indiceFlop++;
    } else {
      indiceFlop = 0;
    }
  } else {
    flopvide = true;
  }
}

void changeGauche() {
  // selectionner la derniere carte de la colone de gauche
  //print(currentPosition);
  if (currentPosition>1) {
    currentPosition--;
  } else {
    print("max a gauche");
  }
}

Card selectionPosition(int position) {
  Card temp = null;
  switch(currentPosition) {
  case 1:
    temp = reste.get(indiceFlop);
    break;
  case 2:
    temp = c1.tab.get(c1.tab.size()-1);
    break;
  case 3:
    temp = c2.tab.get(c2.tab.size()-1);
    break;  
  case 4:
    temp = c3.tab.get(c3.tab.size()-1);
    break;
  case 5:  
    temp = c4.tab.get(c4.tab.size()-1);
    break;
  case 6:
    temp = c5.tab.get(c5.tab.size()-1);
    break;
  case 7:
    temp = c6.tab.get(c6.tab.size()-1);
    break;
  case 8:  
    temp = c7.tab.get(c7.tab.size()-1);
    break;
  case 9:
    if (pileCoeur!=null) {
      temp = pileCoeur.get(pileCoeur.size()-1);
    } else {
      print("la pile est vide");
    }
    break;
  case 10:

    if (pilePique!=null) {
      temp = pilePique.get(pilePique.size()-1);
    } else {
      print("la pile est vide");
    }
    break;
  case 11:
    if (pileCarreau!=null) {
      temp = pileCarreau.get(pileCarreau.size()-1);
    } else {
      print("la pile est vide");
    }
    break;
  case 12:
    print();
    if (pileTrefle!=null) {
      temp = pileTrefle.get(pileTrefle.size()-1);
    } else {
      print("la pile est vide");
    }
    break;
  }

  return temp;
}

int convertNombreToInt(String nombre) {
  int temp = 0;
  switch(nombre) {
  case "A":
    temp = 1;
    break;
  case "2":
    temp = 2;
    break;
  case "3":
    temp = 3;
    break;
  case "4":
    temp = 4;
    break;
  case "5":
    temp = 5;
    break;
  case "6":
    temp = 6;
    break;
  case "7":
    temp = 7;
    break;
  case "8":
    temp = 8;
    break;
  case "9":
    temp = 9;
    break;
  case "10":
    temp = 10;
    break;
  case "V":
    temp = 11;
    break;
  case "Q":
    temp = 12;
    break;
  case "K":
    temp = 13;
    break;
  }
  return temp;
}

boolean verifieCouleur(String couleur1, String couleur2) {
  boolean temp = false;
  println("------------------------");
  println(couleur1);
  println(couleur2);
  if (couleur1!=couleur2) {
    if (couleur1 == "C" && couleur2 == "P" ) {
      temp = true;
    } else if (couleur1 == "C" && couleur2 == "T") {
      temp = true;
    } else if (couleur1 == "K" && couleur2 == "P") {
      temp = true;
    } else if (couleur1 == "K" && couleur2 == "T") {
      temp = true;
    } else if (couleur1 == "P" && couleur2 == "C" ) {
      temp = true;
    } else if (couleur1 == "T" && couleur2 == "C") {
      temp = true;
    } else if (couleur1 == "P" && couleur2 == "K") {
      temp = true;
    } else if (couleur1 == "T" && couleur2 == "K") {
      temp = true;
    }
  } else {
    temp = false;
  }
  return temp;
}

boolean autorise() {
  Colone cSel;
  Colone cDest;

  println("autorise");
  if (verifieCouleur(carteSelectionne.couleur, carteDestination.couleur)) {
    if (convertNombreToInt(carteSelectionne.nombre)+1 == convertNombreToInt(carteDestination.nombre)) {
      println("true22222");
      cSel = chercheCarte(carteSelectionne);
      cDest = chercheCarte(carteDestination);
      cSel.tab.remove(carteSelectionne);
      cDest.tab.add(carteSelectionne);
      print(cDest.tab);
      print(cSel.tab);
      cDest.visible.add(true);
    } else {
      println("false22222");
    }
    print("true");
    return true;
  } else {
    print("false");
    return false;
  }
}

Colone chercheCarte(Card card) {
  for (Colone c : colones) {
    if (c.tab.contains(card)) {
      for (int i = 0; i<c.tab.size(); i++) {
        if (c.tab.get(i).equals(card)) {
          return c;
        }
      }
    }
  }
  return null;
}

void selectionne() {
  if (selectionPosition == 0) {
    selectionPosition = currentPosition;
    carteSelectionne = selectionPosition(selectionPosition);
  } else {
    println("currentpos : " + currentPosition);
    carteDestination = selectionPosition(currentPosition);
    selectionPosition = 0;
    if (autorise()) {
    }
  }
  println("carteDestination" + carteDestination);
  println("carteSelectionne" + carteSelectionne);
}


void changeDroite() {
  // selectionner la derniere carte de la colone de droite
  if (currentPosition<12) {
    currentPosition++;
  } else {
    print("max droite");
  }
}

void repartirPositions() {
  for (int i = 0; i < positions.length; i++) {
    positions[i]= i+1;
  }
}

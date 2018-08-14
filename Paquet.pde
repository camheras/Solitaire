class Paquet {
  public ArrayList<Card> paquet = new ArrayList<Card>();
  public void genererCartes() {
    for (int i = 0; i<4; i++) {
      for (int j = 0; j<13; j++) {
        Card c = new Card(convertirCouleur(i), convertCardToDisplay(j));
        paquet.add(c);
      }
    }
  }

  private String convertirCouleur(int nb) {
    String temp = "";
    switch(nb) {
    case 0:
      temp= "T";
      break;
    case 1:
      temp= "K";
      break;
    case 2:
      temp= "P";
      break;
    case 3:
      temp= "C";
      break;
    }
    return temp;
  }

  public void contenuPaquet() {
    for (int i = 0; i<paquet.size(); i++) {
      System.out.println(paquet.get(i).toString());
    }
  }

  public void melangerPaquet() {
    for (int i = 0; i<paquet.size(); i++) {
      int random = (int)(Math.random()*paquet.size());
      Card temp = null;
      temp=paquet.get(i);
      paquet.set(i, paquet.get(random));
      paquet.set(random, temp);
    }
  }
  String convertCardToDisplay(int nombre) {
    String temp="error";
    switch(nombre) {
    case 0:
      temp = "A";
      break;
    case 1:
      temp = "2";
      break;
    case 2:
      temp = "3";
      break;
    case 3:
      temp = "4";
      break;
    case 4:
      temp = "5";
      break;
    case 5:
      temp = "6";
      break;
    case 6:
      temp = "7";
      break;
    case 7:
      temp = "8";
      break;
    case 8:
      temp = "9";
      break;
    case 9:
      temp = "10";
      break;
    case 10:
      temp = "V";
      break;
    case 11:
      temp = "Q";
      break;
    case 12:
      temp = "K";
      break;
    }
    return temp;
  }
}

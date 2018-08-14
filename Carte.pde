class Card {
  public String couleur;
  public String nombre;

  public String[] listeCouleur = {"T", "K", "P", "C"};
  public String[] listeNombre = {"A", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Q", "V", "K"};

  Card(String couleur, String nombre) {
    for (String nb : listeCouleur) {
      if (nb.matches(couleur)) {
        this.couleur = couleur;
      }
    }
    for (String nb : listeNombre) {
      if (nb.matches(nombre)) {
        this.nombre = nombre;
      }
    }
  } 
  String toString() {
    return couleur +" "+ nombre;
  }

  void draw() {
  }
  String getCouleur() {
    return couleur;
  }
  String getNombre(){
  return nombre;
  }
}

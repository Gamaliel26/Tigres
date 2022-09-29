class Canasta {
  FBox canasta = new FBox(100, 130);

  Canasta(String name, float x, float y, PImage imagen) {


    canasta.setStatic(true);
    // Ubico el circulo
    canasta.setPosition(x, y);


    // Configuro el rebote
    canasta.setRestitution(0.1);
    // Configuro agarrabilidad
    canasta.setGrabbable(false);
    canasta.setName(name);
    canasta.attachImage(imagen);
  }

  void dibujar() {
    mundo.add(canasta);
  }
}

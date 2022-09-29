class Lechuga {
  FCircle lechuga = new FCircle(50); 

  Lechuga(String name, PImage img, float x, float y) {
    lechuga.setStatic(false);

    // Ubico el circulo
    lechuga.setPosition(x, y);

    //Color círculo
    lechuga.setStrokeWeight(5);

    // Configuro el rebote
    lechuga.setRestitution(1);
    //  plataforma.setRestitution(1);

    // Configuro agarrabilidad
    lechuga.setGrabbable(true);
    lechuga.setName(name);
    lechuga.attachImage(img);
  }

  void dibujar() {
    mundo.add(lechuga);
  }

  void remover () {
    mundo.remove(lechuga);
  }
}

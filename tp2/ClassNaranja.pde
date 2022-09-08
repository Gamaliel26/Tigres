class Naranja {
  FCircle naranja = new FCircle(50);

  Naranja(String name, PImage img, float x, float y) {
    naranja.setStatic(false);

    // Ubico el circulo
    naranja.setPosition(x, y);

    //Color círculo
    naranja.setStrokeWeight(5);

    // Configuro el rebote
    naranja.setRestitution(1);
    //  plataforma.setRestitution(1);

    // Configuro agarrabilidad
    naranja.setGrabbable(true);
    naranja.setName(name);
    naranja.attachImage(img);
  }

  void dibujar() {
        if (contNar == 1) {
      mundo.add(naranja);
    }
  }

  void remover () {
    mundo.remove(naranja);
  }
}

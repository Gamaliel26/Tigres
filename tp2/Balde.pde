PImage IMGBalde;

class Balde {
  FBox balde = new FBox(100, 130);
  Balde(float x, float y) {
    IMGBalde = loadImage("IMGBalde.png");

    balde.setStatic(true);
    // Ubico el circulo
    balde.setPosition(x, y);


    // Configuro el rebote 
    balde.setRestitution(0.1);
    // Configuro agarrabilidad
    balde.setGrabbable(false);
    balde.setName("balde");
    balde.attachImage(IMGBalde);
  }

  void dibujar() {
    mundo.add(balde);
  }
}

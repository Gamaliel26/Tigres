PImage IMGBalde;

class Balde {
  FBox balde = new FBox(100, 120);
  Balde() {
    IMGBalde = loadImage("IMGBalde.png");

    balde.setStatic(false);
    // Ubico el circulo
    balde.setPosition(random(100,1000), 710);


    // Configuro el rebote 
    balde.setRestitution(0.1);
    // Configuro agarrabilidad
    balde.setGrabbable(true);
    balde.setName("Balde");
    balde.attachImage(IMGBalde);
  }

  void dibujar() {
    mundo.add(balde);
  }
}

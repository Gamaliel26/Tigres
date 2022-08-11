PImage IMGPinchos;

class Pinchos {
  FBox pinchos = new FBox(100, 30);
  Pinchos() {
    IMGPinchos = loadImage("IMGPinchos.png");
    pinchos.setStatic(true);
    pinchos.setPosition(random(100,1000), 710);
    pinchos.setGrabbable(false);
    pinchos.setName("pinchos");
    pinchos.attachImage(IMGPinchos);
  }

  void dibujar() {
    mundo.add(pinchos);
  }
}

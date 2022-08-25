PImage IMGPinchos;


class Pinchos {
  FBox pinchos = new FBox(100, 30);
  Pinchos(float x, float y) {
    IMGPinchos = loadImage("IMGPinchos.png");
    pinchos.setStatic(true);
        if (x < 1000) {
      x = x + 1;
    } else  if (x > 1000) {
      x = x + 1;
    }
    pinchos.setPosition(x, y);

    pinchos.setGrabbable(false);
    pinchos.setName("pinchos");
    pinchos.attachImage(IMGPinchos);
  }

  void dibujar() {
    mundo.add(pinchos);
  }
}

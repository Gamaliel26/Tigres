class Pinchos {
  FBox pinchos = new FBox(100, 100);


  Pinchos(float x, float y, PImage img) {
    pinchos.setStatic(true);
    pinchos.setPosition(x, y);
    if (x < 1000) {
      x= x+1;
    } else if (x>1000) {
      x= x-1;
    }
    pinchos.setGrabbable(false);
    pinchos.setName("pinchos");
    pinchos.attachImage(img);
  }

  void dibujar() {
    mundo.add(pinchos);
  }
}

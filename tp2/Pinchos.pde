class Pinchos {
  FPoly pinchos = new FPoly ();
  Pinchos() {

    pinchos.vertex(100, 800);
    pinchos.vertex(120, 700);
    pinchos.vertex(140, 800);

    pinchos.setNoStroke();
    pinchos.setStatic(true);
    pinchos.setName("pinchos");
  }

  void dibujar() {
    mundo.add(pinchos);
  }
}

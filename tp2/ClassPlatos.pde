class Platos {
  FCircle platos = new FCircle(100);

  Platos(String name, float x, float y, PImage img) {
    platos.setStatic(true);
    platos.setPosition(x, y);
    platos.setGrabbable(true);
    platos.setName(name);
    platos.attachImage(img);
  }


  void dibujar() {
    //mundoMenu.add(platos);
    mundo.add(platos);
  }
}

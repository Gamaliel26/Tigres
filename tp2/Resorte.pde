PImage IMGResorte;

class Resorte {
  FBox resorte = new FBox(60, 60);
  Resorte() {
    IMGResorte = loadImage("IMGResorte.png");

    resorte.setStatic(false);
    // Ubico el circulo
    resorte.setPosition(random(100, 1000), 710);


    // Configuro el rebote 
    resorte.setRestitution(0.1);
    // Configuro agarrabilidad
    resorte.setGrabbable(true);
    resorte.setName("resorte");
    resorte.attachImage(IMGResorte);
    resorte.addForce(1,1 );
  }

  void dibujar() {
    mundo.add(resorte);
  }
}

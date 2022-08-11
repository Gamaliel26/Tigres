PImage IMGpelota;

class Pelota {
  FCircle circulo = new FCircle(50);
  Pelota() {
    IMGpelota = loadImage("IMGpelota.png");

    circulo.setStatic(false);
    // Ubico el circulo
    circulo.setPosition(500, 100);

    //Color círculo
    circulo.setStrokeWeight(5);

    // Configuro el rebote 
    circulo.setRestitution(1);
    //  plataforma.setRestitution(1);

    // Configuro agarrabilidad
    circulo.setGrabbable(true);
    circulo.setName("pelota");
    circulo.attachImage(IMGpelota);
  }

  void dibujar() {
    mundo.add(circulo);
  }
}

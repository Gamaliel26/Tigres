String conseguirNombre(FBody cuerpo) {
  String nombre = "nada";

  if (cuerpo != null ) {
    nombre = cuerpo.getName();
  }
  if (nombre == null) {
    nombre = "nada";
  }

  return nombre;
}

void dividirCirculo(FCircle circulo) {

  float d = circulo.getSize() /4;
  float x = circulo.getX();
  float y = circulo.getY();

  mundo.remove(circulo);

  for (int i = 0; i < 6; i++) {
    FCircle hijo = new FCircle(d);
    hijo.setPosition(x + random (-d, d), y+ random (-d, d));
    hijo.setFill(255,0,0);
    hijo.setNoStroke();
    mundo.add(hijo);
  }
}
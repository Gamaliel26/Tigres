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

void darNombre(FBox borde){
  borde.setName("Piso");
}

void dividirCirculo(FCircle circulo, PImage img) {

  float d = circulo.getSize()/4;
  float x = circulo.getX();
  float y = circulo.getY();

  mundo.remove(circulo);

  for (int i = 0; i < 6; i++) {
    FCircle hijo = new FCircle(d);
    hijo.setPosition(x + random (-d, d), y+ random (-d, d));
    hijo.setFill(200, 100, 0);
    hijo.setNoStroke();
    hijo.attachImage(img);
    mundo.add(hijo);
  }
}

void personaje (PImage img, int x, int y) {
  push();
  imageMode(CENTER);
  image(img, x, y);
  pop();
}

void texto(String texto, int x, int y, int tam, PFont fuente) {
  push();
  fill(0);
  textFont(fuente);
  textSize(tam);
  textAlign(CENTER, CENTER);
  text(texto, x, y);
  pop();
}

void ranura(int x, int y, int tam) {
  push();
  noFill();
  ellipse(x, y, tam, tam);
  ellipse(x, y, tam, tam);
  ellipse(x, y, tam, tam);
  pop();
}

void timer1 () {
  push();
    ms1 = ms1+1;
  pop();
}

void timer2 () {
  push();
  if (ms<=59) {
    ms = ms+1;
  } else {
    s = s + 1;
    ms = 0;
  }
  pop();
}

void vidas(PImage img, int x, int y, int tamImg, PFont fuente, int tamFuente) {
  push();

  imageMode(CENTER);
  image(img, x, y, tamImg, tamImg);
  textFont(fuente, tamFuente);
  textAlign(CENTER, CENTER);
  fill(0);
  text(vidas, x+tamImg, y);

  pop();
}

void resetTimer1() {
  ms1 = 0;
}

void resetTimer2() {
  ms = 0;
  s = 0;
}

void EmpezarJuego(FBody nombrePlato) {
  String nombre = conseguirNombre(nombrePlato);

  if (nombre == "plato 4") {
    nombrePlato.getX();
  }
  if (nombrePlato.getX() > width/2+100) {
    pantalla = 1;
  } else if (nombrePlato.getX() < width/2-100) {
    pantalla = 1;
  }
}

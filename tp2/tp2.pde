import fisica.*;
FWorld mundo;
Pelota pelota;
Balde balde;
Pinchos pinchos;
Resorte resorte;


void setup() {
  size(1200, 800);
  Fisica.init(this);
  mundo = new FWorld();
  pelota = new Pelota();
  balde = new Balde();
  pinchos = new Pinchos();
  resorte = new Resorte();

  mundo.setEdges();

  //FDistanceJoint articula = new FDistanceJoint (circulo, circulo2);

  pinchos.dibujar();
  pelota.dibujar();
  balde.dibujar();
  resorte.dibujar();
}

void draw() {


  fill(0, 100, 100, 100);
  rect(0, 0, width, height);
  mundo.step();
  mundo.draw();
}

void keyPressed() {
  FBox plataforma = new FBox(120, 10);
  plataforma.setPosition(mouseX, mouseY);
  plataforma.setGrabbable(true);
  plataforma.setStatic(true);
  plataforma.setFill(0);
  mundo.add(plataforma);
}


void contactStarted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (nombre1 == "pelota" && nombre2 == "pinchos") dividirCirculo((FCircle)cuerpo2);
  if (nombre2 == "pelota" && nombre1 == "pinchos") dividirCirculo((FCircle)cuerpo2);
}

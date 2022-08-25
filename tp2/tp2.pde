import fisica.*;
FWorld mundo;
Pelota pelota;
Balde balde;
Pinchos pinchos, pinchos2, pinchos3, pinchos4;
int pantalla = 0, s = 0, ms = 0;


void setup() {
  size(1200, 800);
  Fisica.init(this);
  mundo = new FWorld();
  pelota = new Pelota();
  balde = new Balde();
  pinchos = new Pinchos(random (100, 300), 200);
  pinchos2 = new Pinchos(random (350, 500), 400);
  pinchos3 = new Pinchos(random (550, 700), 600);
  pinchos4 = new Pinchos(random (750, 900), 700);

  mundo.setEdges();

  //FDistanceJoint articula = new FDistanceJoint (circulo, circulo2);

  pinchos.dibujar();
  pinchos2.dibujar();
  pinchos3.dibujar();
  pinchos4.dibujar();
  pelota.dibujar();
  balde.dibujar();
}

void draw() {

  background(255);
  if (pantalla == 0) {
    texto("Bajation", width/2, height/3, 90);
    texto("Presiona cualquier tecla para empezar", width/2, height/2+height/3, 30);
    if (keyPressed) {
      pantalla = 1;
    }
  }

  if (pantalla == 1) {
    mundo.draw();
    if (ms<=59) {
      texto(""+s, width/2, height/10, 50);
      ms = ms+1;
    } else {
      s = s + 1;
      ms = 0;
      texto (""+s, width/2, height/10, 50);
    }

    if (s >= 5) {
      mundo.step();
    }
  } else if (pantalla == 2) {
    texto("GANASTE (≧ v ≦)", width/2, height/4, 50);
  } else if (pantalla == 3) {
    mundo.step();
    mundo.draw();
    texto("PERDISTE (⇀‸↼“)", width/2, height/4, 50);
  }
}

void keyPressed () {
  if (keyCode == ' ') {
    FCircle plataforma = new FCircle(65);
    plataforma.setFill(0);
    plataforma.setStatic(true);
    plataforma.setPosition(mouseX, mouseY);
    plataforma.setGrabbable(false);
    plataforma.setName("plataforma");
    mundo.add(plataforma);
  }
}


void contactStarted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (nombre1 == "pelota" && nombre2 == "pinchos") { 
    pantalla = 3; 
    dividirCirculo((FCircle)cuerpo2);
  }
  if (nombre2 == "pelota" && nombre1 == "pinchos") { 
    pantalla = 3; 
    dividirCirculo((FCircle)cuerpo2);
  }

  if (nombre1 == "pelota" && nombre2 == "balde") {
    pantalla = 2;
  }

  if (nombre2 == "pelota" && nombre1 == "balde") {
    pantalla = 2;
  }
}

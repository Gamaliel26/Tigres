import fisica.*;
FWorld mundo;
Pelota pelota;
Balde balde, balde2, balde3;
Pinchos pinchos, pinchos2, pinchos3, pinchos4;
int pantalla = 0, s = 0, ms = 0;
PImage IMGFondo;


void setup() {
  size(1500, 1000);
  IMGFondo = loadImage("IMGFondo.png");
  Fisica.init(this);
  mundo = new FWorld();
  pelota = new Pelota();
  balde = new Balde(width/2, 750);
  balde2 = new Balde(width/2+width/3, 750);
  balde3 = new Balde(width/2-width/3, 750);
  pinchos = new Pinchos(random (50, 400), 300);
  pinchos2 = new Pinchos(random (450, 700), 400);
  pinchos3 = new Pinchos(random (750, 1000), 500);
  pinchos4 = new Pinchos(random (1050, 1450), 600);

  mundo.setEdges();

  //FDistanceJoint articula = new FDistanceJoint (circulo, circulo2);

  pinchos.dibujar();
  pinchos2.dibujar();
  pinchos3.dibujar();
  pinchos4.dibujar();
  pelota.dibujar();
  balde.dibujar();
  balde2.dibujar();
  balde3.dibujar();
}

void draw() {

  image(IMGFondo,0,0);
  if (pantalla == 0) {
    texto("Tutti-Frutti", width/2, height/3, 90);
    texto("Ubica los tres platos en la pantalla para comenzar", width/2, height/2+height/5, 30);
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
    texto("¡HOY SE COME GENTE!", width/2, height/4, 50);
  } else if (pantalla == 3) {
    mundo.step();
    mundo.draw();
    texto("SIEMPRE LOGRAS DECEPCIONARME", width/2, height/4, 50);
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

// Alumnos: Moreira, Abril ; Paoletti Jade ; Piga, Gamaliel
// Materia: Tecnología Multimedial 2
// Comisión: Prof. Lisandro Peralta

import fisica.*;
import ddf.minim.*;

int pantalla = 0; // Pantallas
int s = 0, ms = 0; // Timer
int vidas = 3; //Cantidad de vidas
int yCanastas = 800; // Posicion Y de las canastas
int tamRanura = 65; // Tamaño de las ranuras
int bordeLimite = 100;

PImage IMGPlatos;
PFont fuente;
int frame = 0;

PImage [] IMGImagen;
int cantImagenes = 2;
PImage [] IMGPincho;
int cantPinchos = 3;
PImage [] IMGCanasta;
int cantCanastas = 3;
PImage [] IMGPelota;
int cantPelota = 4;
PImage [] IMGParticula;
int cantParticulas = 2;
PImage [] IMGMonigote;
int cantMonigotes = 2;
int inicioMonigotes = 0;
int contNar = 0, contLec = 0;

float posPlatoX, posPlatoY; // Plato
float posPlatoX1, posPlatoY1; // Plato 1
float posPlatoX2, posPlatoY2; // Plato 2
float posPelotasX, posPelotasY;

//boolean isPlatoOver(int tam, int x, int y) {
//  return mouseX >= x-tam/2 && mouseX <=tam/2 + x && mouseY >= y-tam/2 && mouseY <= tam/2 + y;
//}
boolean sonidoOn;
boolean LechugaChar, NaranjaChar;
boolean colision;

//--------------------------------------------------CLASES DEC.
Minim minim;

AudioPlayer [] musica;
int cantMusica = 2;
AudioPlayer [] sonido;
int cantSonidos = 6;

FWorld mundo, mundoMenu;
Naranja naranja;
Lechuga lechuga;
Platos platos, platos2, platos3;
Canasta canastaBasura, canastaFruta, canastaVerdura;
Pinchos pinchos, pinchos2, pinchos3, pinchos4;

// ------------------------------------------------------------------------------------------------SETUP
void setup() {
  size(1500, 850);
  minim = new Minim(this);

  IMGPlatos = loadImage("plato.png");
  fuente = createFont("fuente0.ttf", 30);

  IMGImagen = new PImage[cantImagenes];
  IMGPincho = new PImage[cantPinchos];
  IMGCanasta = new PImage [cantCanastas];
  IMGPelota = new PImage[cantPelota];
  IMGParticula = new PImage[cantParticulas];
  IMGMonigote = new PImage[cantMonigotes];
  musica = new AudioPlayer[cantMusica];
  sonido = new AudioPlayer[cantSonidos];

  for (int i = 0; i < cantImagenes; i++) {
    IMGImagen[i] = loadImage("imagen"+i+".png");
  }
  for (int i = 0; i < cantPinchos; i++) {
    IMGPincho[i] = loadImage("pincho"+i+".png");
  }
  for (int i = 0; i < cantCanastas; i++) {
    IMGCanasta[i] = loadImage("canasta"+i+".png");
  }
  for (int i = 0; i < cantPelota; i++) {
    IMGPelota[i] = loadImage("pelota"+i+".png");
  }
  for (int i = 0; i < cantMusica; i++) {
    musica [i] = minim.loadFile("musica"+i+".wav");
  }
  for (int i = 0; i < cantSonidos; i++) {
    sonido [i] = minim.loadFile("sonido"+i+".wav");
  }
  for (int i = 0; i < cantParticulas; i++) {
    IMGParticula[i] = loadImage("particula"+i+".png");
  }
  for (int i = 0; i < cantMonigotes; i++) {
    IMGMonigote[i] = loadImage("monigote"+i+".png");
  }

  posPlatoX= random(bordeLimite, width-bordeLimite);
  posPlatoY = random(bordeLimite, height-bordeLimite);
  posPlatoX1= random(bordeLimite, width-bordeLimite);
  posPlatoY1 = random(bordeLimite, height-bordeLimite);
  posPlatoX2= random(bordeLimite, width-bordeLimite);
  posPlatoY2 = random(bordeLimite, height-bordeLimite);
  posPelotasX = random(bordeLimite, width-bordeLimite);
  posPelotasY = bordeLimite;

  //--------------------------------------------------CLASES INIT.
  Fisica.init(this);


  mundo = new FWorld();
  mundoMenu = new FWorld();

  platos = new Platos("plato 1", posPlatoX, posPlatoY, IMGPlatos);
  platos2 = new Platos("plato 2", posPlatoX1, posPlatoY1, IMGPlatos);
  platos3 = new Platos("plato 3", posPlatoX2, posPlatoY2, IMGPlatos);

  naranja = new Naranja("Naranja", IMGPelota[1], posPelotasX, posPelotasY);
  lechuga = new Lechuga("Lechuga", IMGPelota[0], posPelotasX, posPelotasY);

  canastaBasura = new Canasta("canastaBasura", width/2, yCanastas, IMGCanasta[2]);
  canastaVerdura = new Canasta("canastaVerdura", width/2+width/3, yCanastas, IMGCanasta[0]);
  canastaFruta = new Canasta("canastaFruta", width/2-width/3, yCanastas, IMGCanasta[1]);

  pinchos = new Pinchos(random (50, 400), random(250, 850), IMGPincho[0]);
  pinchos2 = new Pinchos(random (450, 700), random(250, 850), IMGPincho[1]);
  pinchos3 = new Pinchos(random (750, 1000), random(250, 850), IMGPincho[2]);
  pinchos4 = new Pinchos(random (1050, 1450), random(250, 850), IMGPincho[0]);

  mundo.setEdges();

  //--------------------------------------------------CLASES DIB.
  platos.dibujar();
  platos2.dibujar();
  platos3.dibujar();

  pinchos.dibujar();
  pinchos2.dibujar();
  pinchos3.dibujar();
  pinchos4.dibujar();

  canastaBasura.dibujar();
  canastaVerdura.dibujar();
  canastaFruta.dibujar();
}
// ------------------------------------------------------------------------------------------------DRAW
void draw() {
  image(IMGImagen[0], 0, 0);
  //--------------------------------------------------------------------------------------MENU
  if (pantalla == 0) {

    sonido[3].rewind(); //reset timer

    musica[0].play();
    mundoMenu.draw();

    timer1(width/2, height/6, fuente, 50);
    texto("Verdutti-Frutti", width/2, height/4, 90, fuente);
    texto("Elegí tu personaje", width/2, height/2+height/5, 30, fuente);
    //monigotes();
    if (mouseX < width/2) {
      personaje(IMGPelota[2], width/2-width/3, height/2);
      personaje(IMGPelota[1], width/2+width/3, height/2);
      LechugaChar = true;
      NaranjaChar = false;
    } else if (mouseX > width/2) {
      LechugaChar = false;
      NaranjaChar = true;
      personaje(IMGPelota[0], width/2-width/3, height/2);
      personaje(IMGPelota[3], width/2+width/3, height/2);
    }
    if (s>=5) {
      pantalla = 1;
      resetTimer();
    }
    //--------------------------------------------------------------------------------------JUEGO
  } else if (pantalla == 1 && NaranjaChar == true) {
    naranja.dibujar();
    contNar = contNar + 1;
    lechuga.remover();
    musica[1].play();
    musica[0].rewind(); //reset menu
    //sonido[1].rewind(); //reset colision
    //sonido[4].rewind(); //reset victoria
    //sonido[5].rewind(); //reset derrota

    sonido[3].play();
    musica[0].pause();
    mundo.draw();

    timer2();
    // vidas(IMGImagen[1], width/10, height/10, 45, fuente, 50);
    if (s >= 5) {
      mundo.step();
    }
  } else if (pantalla == 1 && LechugaChar == true) {
    lechuga.dibujar();
    contLec = contLec + 1;
    naranja.remover();
    musica[1].play();
    musica[0].rewind(); //reset menu
    //sonido[1].rewind(); //reset colision
    //sonido[4].rewind(); //reset victoria
    //sonido[5].rewind(); //reset derrota

    sonido[3].play();
    musica[0].pause();
    mundo.draw();

    //vidas(IMGImagen[1], width/10, height/6, 50, fuente, 50);
    timer2();
    if (s >= 5) {
      mundo.step();
    }
    //--------------------------------------------------------------------------------------VICTORIA
  } else if (pantalla == 2) {
    musica[1].pause();
    musica[1].rewind();
    sonido[4].play();
    ms = 0;
    s = 0;
    texto("¡Ganaste!", width/2, height/4, 50, fuente);
    texto("Presiona M para volver al menú", width/2, height/2+height/5, 30, fuente);
    //--------------------------------------------------------------------------------------DERROTA
  } else if (pantalla == 3) {
    musica[1].pause();
    musica[1].rewind();
    sonido[5].play();
    ms = 0;
    s = 0;
    mundo.draw();
    mundo.step();

    texto("Perdiste...", width/2, height/4, 50, fuente);
    texto("Presiona M para volver al menú", width/2, height/2+height/5, 30, fuente);
  }
}
// ------------------------------------------------------------------------------------------------KEYPRESSED
void keyPressed () {
  if (pantalla == 2 || pantalla == 3 && keyCode == 'M') {
    pantalla = 0;
    contNar = 0;
    contLec = 0;
  }
}

// ------------------------------------------------------------------------------------------------CONTACTOS
void contactStarted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();


  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  //NARANJA | DERROTA
  if (nombre2 == "Naranja" && nombre1 == "pinchos" || nombre2 == "Naranja" && nombre1 == "canastaVerdura" || nombre2 == "Naranja" && nombre1 == "canastaBasura") {

    pantalla = 3;

    if (nombre2 == "Naranja" && nombre1 == "pinchos") {
      sonido[1].play();
      dividirCirculo((FCircle)cuerpo2, IMGParticula[1]);
    }

    //NARANJA | VICTORIA
  } else if (nombre2 == "Naranja" && nombre1 == "canastaFruta") {
    pantalla = 2;

    //LECHUGA | DERROTA
  } else if (nombre2 == "Lechuga" && nombre1 == "pinchos" || nombre2 == "Lechuga" && nombre1 == "canastaFruta" || nombre2 == "Lechuga" && nombre1 == "canastaBasura") {

    pantalla = 3;
    if (nombre2 == "Lechuga" && nombre1 == "pinchos") {
      sonido[1].play();
      dividirCirculo((FCircle)cuerpo2, IMGParticula[0]);
    }

    //LECHUGA | VICTORIA
  } else if (nombre2 == "Lechuga" && nombre1 == "canastaVerdura") {
    pantalla = 2;
  }
}

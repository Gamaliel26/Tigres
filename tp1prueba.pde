ArrayList<Caminante> caminantes;
Paleta p;

void setup() {
  size (800, 600);

  //capa1 = createGraphics(width, height);


  /* for (int i = 0; i< manchas.length; i++) {
   manchas [i] = loadImage("mancha"+i+".png");
   }*/
  background(25, 2);
  caminantes = new ArrayList<Caminante>();
  p = new Paleta("img_2.jpg");
  for (int i = 0; i<3; i++) {
    caminantes.add(new Caminante(p.darUnColor()));
  }
}

void draw() {

  fill(10, 2);
  rect(0, 0, 800, 600);

  if (mousePressed) {
    for (Caminante c : caminantes) {
      c.mover();
      c.dibujar();
      c.borde();
    }
  }
}

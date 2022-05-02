class Caminante {

  float x, y;
  float t1,t2;
  float vel;
  float dir;
  color c;

  Caminante(color c_) {
    x=width/2;
    y=height/2;
    t1= 20;
    t2= 20;
    vel=1;
    dir= random(200,270);
    c = c_;
  }


  void dibujar() {
    push();
    fill(c);
    noStroke();
    ellipse(x, y, t1, t2);
    pop();
  }

  void mover() {
   

    x=x+vel*cos(radians(dir));
    y=y+vel*sin(radians(dir));
  }

  /*void acercarse() {
    float angulo= degrees(atan2(mouseY-y, mouseX-x));
    dir =angulo;
  }

  void alejarse() {
    float angulo= degrees(atan2(mouseY-y, mouseX-x)+180);
    dir =angulo;
  }*/

  void borde() {
    if (x>=width) {
      x=0;
    }
    if (x<=0) {
      x=width-1;
    }
    if (y>=height) {
      y=0;
    }
    if (y<=0) {
      y=height-1;
    }
  }
}

Megaman megaman;
void setup() {
  size(106, 106);
  megaman = new Megaman(new PVector(width/2,height/2));
}

void draw() {
  megaman.dibujar();
}

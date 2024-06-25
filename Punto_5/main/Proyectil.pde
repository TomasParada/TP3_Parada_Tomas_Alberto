class Proyectil {
  float x, y, velocidad;
  PImage img;
  float direction;

  Proyectil(float x, float y, float velocidad, PImage img, float direction) {
    this.x = x;
    this.y = y;
    this.velocidad = velocidad * direction;
    this.img = img;
    this.direction = direction;
  }
  
  void update() {
    x += velocidad;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    if (direction == -1) {
      rotate(PI);
    }
    imageMode(CENTER);
    image(img, 0, 0);
    popMatrix();
  }
}

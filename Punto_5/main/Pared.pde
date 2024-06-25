class Pared {
  private PImage imagen;
  private PVector posicion;
  private boolean impactado = false;
  private boolean cambiado = false;
  private int currentFrame = 0;
  private int frameStart1;
  private int frameEnd1;
  private int frameStart2;
  private int frameEnd2;
  
  public Pared(PVector posicion, int frameStart1, int frameEnd1, int frameStart2, int frameEnd2) {
    this.posicion = posicion;
    this.frameStart1 = frameStart1;
    this.frameEnd1 = frameEnd1;
    this.frameStart2 = frameStart2;
    this.frameEnd2 = frameEnd2;
    imagen = loadImage("pared.png");
  }
  
  void dibujar() {
    pushMatrix();
    imageMode(CORNER);
    int frameWidth = currentFrame == 0 ? frameEnd1 - frameStart1 : frameEnd2 - frameStart2;
    int frameX = currentFrame == 0 ? frameStart1 : frameStart2;
    PImage frameImage = imagen.get(frameX, 0, frameWidth, imagen.height);
    frameImage.resize(150, 150);
    image(frameImage, 670, 220);
    popMatrix();
  }

  void checkCollision(ArrayList<Proyectil> proyectiles) {
    for (Proyectil p : proyectiles) {
      if (dist(p.x, p.y, this.posicion.x, this.posicion.y) < 50) {
        if (!cambiado) {
          this.impactado = true;
          this.cambiado = true;
        }
        break;
      }
    }
  }

  void update() {
    if (impactado) {
      currentFrame = (currentFrame + 1) % 2;
      impactado = false;
    }
  }

  void resetImpact() {
    cambiado = false;
  }
}

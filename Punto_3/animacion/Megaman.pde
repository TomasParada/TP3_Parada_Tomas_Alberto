class Megaman {
  private PImage imagen;
  private PVector posicion;
  private float posNewX;
  private float posNewY;
  private float pixelX;
  private float velT;
  
  public Megaman(PVector posicion){
    this.posicion=posicion;
    pixelX = 0;
    posNewX = 0;
    velT = 3200;
  }
  
  void dibujar() {
    imagen= loadImage("megaman.png");
    imageMode(CENTER);
    image(imagen.get((int)posNewX,(int)posNewY,105,106),this.posicion.x,this.posicion.y);
    float deltaTime = 1.0/round(frameRate);
    pixelX += velT * deltaTime;
    if(pixelX>105){
      posNewX+= 105;
      pixelX = 0;
    }
    if(posNewX>imagen.width){
      posNewX=0;
      if(posNewY == 0){
        posNewY= 106;
      }else{
        if(posNewY==106){
          posNewY=0;
        }
      }
    }
  }
}

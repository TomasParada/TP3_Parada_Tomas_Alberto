PlataformaL plataforma;
PlataformaHorizontal plataformaH;
PlataformaVertical plataformaV;
float lastFrameTime;

void setup() {
  size(800, 800);
  plataforma = new PlataformaL(50, 50);
  plataformaH = new PlataformaHorizontal(50);
  plataformaV = new PlataformaVertical(350);
  lastFrameTime = millis() / 1000.0;
}


void draw() {
  background(#ECFC0F);
  float currentTime = millis() / 1000.0;
  float deltaTime = currentTime - lastFrameTime;
  
  fill(#FF0000);
  plataforma.actualizar(deltaTime);
  rect(plataforma.x, plataforma.y, 60, 20);
  
  fill(#0000FF);
  plataformaH.actualizarH(deltaTime);
  rect(plataformaH.x, 300, 60, 20);

  fill(#00FF00);
  plataformaV.actualizarV(deltaTime);
  rect(50, plataformaV.y, 60, 20);

  fill(0);
  textSize(16);
  text("Tiempo de actividad: " + plataforma.tiempoActividad + "s", 10, 30);

  lastFrameTime = currentTime;
}

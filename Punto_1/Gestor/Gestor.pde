PlataformaMovil plataforma;
float lastFrameTime;

void setup() {
  size(400, 400);
  plataforma = new PlataformaMovil(50, 50);
  lastFrameTime = millis() / 1000.0;
}

void draw() {
  background(#31F0F5);
  float currentTime = millis() / 1000.0;
  float deltaTime = currentTime - lastFrameTime;
  
  plataforma.actualizar(deltaTime);
  rect(plataforma.x, plataforma.y, 60, 20);
  
  fill(0);
  textSize(16);
  text("Tiempo de actividad: " + plataforma.tiempoActividad + "s", 10, 30);

  lastFrameTime = currentTime;
}

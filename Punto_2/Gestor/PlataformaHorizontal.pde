class PlataformaHorizontal {
  float x;
  float velocidadHorizontal = 50;
  int estado = 0;
  float tiempoTranscurrido = 0;
  float inicioX;
  int tiempoActividad = 0;

  PlataformaHorizontal(float inicioX) {
    this.x = inicioX;
    this.inicioX = inicioX;
  }

  void actualizarH(float deltaTime) {
    tiempoActividad = millis() / 1000;

    tiempoTranscurrido += deltaTime;

    switch (estado) {
      case 0:
        if (tiempoTranscurrido <= 10) {
          x += velocidadHorizontal * deltaTime;
        } else {
          estado = 1;
          tiempoTranscurrido = 0;
        }
        break;
      case 1:
        if (x > inicioX) {
          x -= velocidadHorizontal * deltaTime;
        } else {
          estado = 0;
          tiempoTranscurrido = 0;
        }
        break;
    }
  }
}

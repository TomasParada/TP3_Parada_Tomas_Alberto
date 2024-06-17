class PlataformaMovil {
  float x, y;
  float velocidadVertical = 50;
  float velocidadHorizontal = 50;
  int estado = 0;
  float tiempoTranscurrido = 0;
  float inicioX, inicioY;
  int tiempoActividad = 0;
  
  PlataformaMovil(float inicioX, float inicioY) {
    this.x = inicioX;
    this.y = inicioY;
    this.inicioX = inicioX;
    this.inicioY = inicioY;
  }

  void actualizar(float deltaTime) {
    tiempoActividad = millis() / 1000;

    tiempoTranscurrido += deltaTime;

    switch (estado) {
      case 0:
        if (tiempoTranscurrido <= 4) {
          y += velocidadVertical * deltaTime;
        } else {
          estado = 1;
          tiempoTranscurrido = 0;
        }
        break;
      case 1:
        if (tiempoTranscurrido <= 3) {
          x += velocidadHorizontal * deltaTime;
        } else {
          estado = 2;
          tiempoTranscurrido = 0;
        }
        break;
      case 2:
        if (x > inicioX) {
          x -= velocidadHorizontal * deltaTime;
        } else {
          estado = 3;
          tiempoTranscurrido = 0;
        }
        break;
      case 3:
        if (y > inicioY) {
          y -= velocidadVertical * deltaTime;
        } else {
          y = inicioY;
          x = inicioX;
          estado = 0;
          tiempoTranscurrido = 0;
        }
        break;
    }
  }
}

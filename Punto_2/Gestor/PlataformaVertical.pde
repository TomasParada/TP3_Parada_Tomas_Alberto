class PlataformaVertical {
  float y;
  float velocidadVertical = 50;
  int estado = 0;
  float tiempoTranscurrido = 0;
  float inicioY;
  int tiempoActividad = 0;

  PlataformaVertical(float inicioY) {
    this.y = inicioY;
    this.inicioY = inicioY;
  }

  void actualizarV(float deltaTime) {
    tiempoActividad = millis() / 1000;

    tiempoTranscurrido += deltaTime;

    switch (estado) {
      case 0:
        if (tiempoTranscurrido <= 6) {
          y += velocidadVertical * deltaTime;
        } else {
          estado = 1;
          tiempoTranscurrido = 0;
        }
        break;
      case 1:
        if (y > inicioY) {
          y -= velocidadVertical * deltaTime;
        } else {
          estado = 0;
          tiempoTranscurrido = 0;
        }
        break;
    }
  }
}

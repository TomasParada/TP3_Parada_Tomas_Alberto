enum GameState {
  MOVE_LEFT, MOVE_RIGHT, FIRE;
}

class Tank {
  float x, y;
  PImage img;
  GameState currentState;
  float direction = 1;
  float rightBoundary;
  float leftBoundary;

  float rightProjectileOffsetX = 45;
  float leftProjectileOffsetX = 45;
  float rightProjectileOffsetY = -2.5;
  float leftProjectileOffsetY = -2.5;

  Tank(float x, float y, PImage img, float rightBoundary, float leftBoundary) {
    this.x = x;
    this.y = y;
    this.img = img;
    this.rightBoundary = rightBoundary;
    this.leftBoundary = leftBoundary;
    currentState = GameState.MOVE_RIGHT;
  }

  void update(ArrayList<Proyectil> proyectiles, PImage proyectilImage) {
    switch(currentState) {
      case MOVE_RIGHT:
        moveRight();
        break;
      case MOVE_LEFT:
        moveLeft();
        break;
      case FIRE:
        fire(proyectiles, proyectilImage);
        break;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    if (direction == -1) {
      scale(-1, 1);
    }
    imageMode(CENTER);
    image(img, 0, 0);
    popMatrix();
  }

  void moveRight() {
    if (x + img.width / 2 < rightBoundary) {
      x += 2;
      direction = 1;
    }
  }

  void moveLeft() {
    if (x - img.width / 2 > leftBoundary) {
      x -= 2;
      direction = -1;
    }
  }

  void fire(ArrayList<Proyectil> proyectiles, PImage proyectilImage) {
    float proyectilX;
    float proyectilY;
    if (direction > 0) {
      proyectilX = x + rightProjectileOffsetX;
      proyectilY = y + rightProjectileOffsetY;
    } else {
      proyectilX = x - leftProjectileOffsetX;
      proyectilY = y + leftProjectileOffsetY;
    }
    proyectiles.add(new Proyectil(proyectilX, proyectilY, 5, proyectilImage, direction));
    currentState = direction > 0 ? GameState.MOVE_RIGHT : GameState.MOVE_LEFT;
  }
}

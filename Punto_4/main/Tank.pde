enum GameState {
  MOVE_LEFT, MOVE_RIGHT, FIRE;
}

class Tank {
    float x, y;
    PImage img;
    GameState currentState;
    float direction = 1;

    Tank(float x, float y, PImage img) {
        this.x = x;
        this.y = y;
        this.img = img;
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
        image(img, -img.width / 2, -img.height / 2);
        popMatrix();
    }

    void moveRight() {
        if (x + img.width / 2 < width) {
            x += 2;
            direction = 1;
        }
    }

    void moveLeft() {
        if (x - img.width / 2 > 0) {
            x -= 2;
            direction = -1;
        }
    }

    void fire(ArrayList<Proyectil> proyectiles, PImage proyectilImage) {
        float proyectilX = x + (img.width / 2 * direction);
        proyectiles.add(new Proyectil(proyectilX, y, direction * 5, proyectilImage));
        currentState = direction > 0 ? GameState.MOVE_RIGHT : GameState.MOVE_LEFT;
    }
}

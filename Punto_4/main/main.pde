Tank tank;
ArrayList<Proyectil> proyectiles;
PImage tankImage;
PImage proyectilImage;

void setup() {
    size(800, 600);
    tankImage = loadImage("tanque.png");
    tankImage.resize(100, 100);
    proyectilImage = loadImage("proyectil.png");
    proyectilImage.resize(15, 10);
    tank = new Tank(width / 2, height / 2, tankImage);
    proyectiles = new ArrayList<Proyectil>();
}

void draw() {
    background(#1CE5CC);
    tank.update(proyectiles, proyectilImage);
    tank.display();
    for (Proyectil p : proyectiles) {
        p.update();
        p.display();
    }
}

void keyPressed() {
    if (key == 'd') {
        tank.currentState = GameState.MOVE_RIGHT;
    } else if (key == 'a') {
        tank.currentState = GameState.MOVE_LEFT;
    } else if (key == 'f') {
        tank.currentState = GameState.FIRE;
    }
}

class Proyectil {
    float x, y, speed;
    PImage img;
    float angle;

    Proyectil(float x, float y, float speed, PImage img) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.img = img;
        if (speed > 0) {
            angle = 0;
        } else {
            angle = PI;
        }
    }

    void update() {
        x += speed;
    }

    void display() {
        pushMatrix();
        translate(x, y);
        rotate(angle);
        image(img, -img.width / 2, -img.height / 2);
        popMatrix();
    }
}

public abstract class Laser extends GameObject {

    public int x, y;
    protected float speed;
    protected float angle; // in radians
    protected PImage img;

    public Laser(int x, int y, float speed, float angle, PImage img) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.angle = angle;
        this.img = img;
    }

    public void update() {
        x += speed * cos(angle);
        y -= speed * sin(angle);
    }

    public void render() {
        image(img, x, y);
    }
}
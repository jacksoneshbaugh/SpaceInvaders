public abstract class Laser extends GameObject {

    public int x, y, dmg;
    public float speed;
    public float angle;
    private PImage img;

    public void update() {
        x += speed*cos(angle);
        y -= speed*sin(angle);
    }
}
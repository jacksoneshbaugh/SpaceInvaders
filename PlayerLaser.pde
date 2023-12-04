public class PlayerLaser extends Laser {

    private PImage img;

    // Angle is in Radians 
    public PlayerLaser(int x, int y, int speed, float angle) {
        this.angle = angle;
        this.speed = speed;
        this.x = x;
        this.y = y;
        img = loadImage("img/player_laser.png");
    }

    public void render() {
        image(img, x, y, 4, 20);
    }

}
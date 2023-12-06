public class PlayerLaser extends Laser {

    // Angle is in Radians 
    public PlayerLaser(int x, int y, float speed, float angle) {
        super(x, y, speed, angle, loadImage("img/player_laser.png"));
    }

    public void render() {
        image(img, x, y, 4, 20);
    }

}
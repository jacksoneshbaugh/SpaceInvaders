public class BlueAlien extends Alien {
    public BlueAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement, int laserSpeed) {
        super(x, y, 25, 25, loadImage("img/blue_alien.png"), loadImage("img/blue_laser.png"), laserSpeed, movementSpeed, numMovesBeforeVerticalMovement);
    }
}
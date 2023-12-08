public class GreenAlien extends Alien {
    public GreenAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement, int laserSpeed) {
        super(x, y, 25, 25, loadImage("img/green_alien.png"), loadImage("img/green_laser.png"), 10, laserSpeed, movementSpeed, numMovesBeforeVerticalMovement, 1);
    }
}
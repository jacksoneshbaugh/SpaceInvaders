public class PinkAlien extends Alien {
    public PinkAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement, int laserSpeed) {
        super(x, y, 25, 25, loadImage("img/pink_alien.png"), loadImage("img/pink_laser.png"), laserSpeed, movementSpeed, numMovesBeforeVerticalMovement);
    }
}
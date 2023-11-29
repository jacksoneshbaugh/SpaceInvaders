public class BlueAlien extends Alien {
    public BlueAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement) {
        super(x, y, 25, 25, loadImage("img/blue_alien.png"), movementSpeed, numMovesBeforeVerticalMovement);
    }
}
public class BlueAlien extends Alien {
    public BlueAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement) {
        super(x, y, loadImage("img/blue_alien.png"), movementSpeed, numMovesBeforeVerticalMovement);
    }
}
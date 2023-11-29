public class PinkAlien extends Alien {
    public PinkAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement) {
        super(x, y, 25, 25, loadImage("img/pink_alien.png"), movementSpeed, numMovesBeforeVerticalMovement);
    }
}
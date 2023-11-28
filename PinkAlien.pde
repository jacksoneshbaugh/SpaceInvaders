public class PinkAlien extends Alien {
    public PinkAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement) {
        super(x, y, loadImage("img/pink_alien.png"), movementSpeed, numMovesBeforeVerticalMovement);
    }
}
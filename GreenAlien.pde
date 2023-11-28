public class GreenAlien extends Alien {
    public GreenAlien(int x, int y, int movementSpeed, int numMovesBeforeVerticalMovement) {
        super(x, y, loadImage("img/green_alien.png"), movementSpeed, numMovesBeforeVerticalMovement);
    }
}
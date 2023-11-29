public class Alien extends GameObject {

    private int x, y;
    private int xWidth, yWidth;
    private PImage img;
    private char movementDirection = 'R';
    private int movementSpeed = 1;
    private final int numMovesBeforeVerticalMovement;
    private int movementTracker;
    private int frameCounter = 0;
    

    public Alien(int x, int y, int xWidth, int yWidth, PImage img, int movementSpeed, int numMovesBeforeVerticalMovement) {
        this.x = x;
        this.y = y;
        this.xWidth = xWidth;
        this.yWidth = yWidth;
        this.img = img;
        this.movementSpeed = movementSpeed;
        this.numMovesBeforeVerticalMovement = numMovesBeforeVerticalMovement;
        this.movementTracker = numMovesBeforeVerticalMovement;
    }

    // Algorithm for moving the alien:
    // 1. If the alien has taken the number of steps specified by numMovesBeforeVerticalMovement, move down and change direction
    // 2. Otherwise, move in the current direction.
    private void move() {
        if (movementTracker == 0) {
            y += 10;
            if (movementDirection == 'R') {
                movementDirection = 'L';
            } else {
                movementDirection = 'R';
            }
            movementTracker = numMovesBeforeVerticalMovement;
        } else {
            if (movementDirection == 'R') {
                x += movementSpeed;
            } else {
                x -= movementSpeed;
            }
            movementTracker--;
        }
    }

    // movement should occur every 20 frames.
    public void update() {
        frameCounter++;
        if (frameCounter == 20) {
            move();
            frameCounter = 0;
        }
    }

    public void render() {
        image(img, x, y, xWidth, yWidth);
    }

}
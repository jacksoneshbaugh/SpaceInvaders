public class Alien extends GameObject {

    public int x, y, laserSpeed;
    public int xWidth, yWidth;
    private PImage img, laser;
    private char movementDirection = 'R';
    private int movementSpeed = 1;
    private final int numMovesBeforeVerticalMovement;
    private int movementTracker;
    private int frameCounter = 0;
    private boolean isDead = false;
    private int points;
    private int lives;
    

    public Alien(int x, int y, int xWidth, int yWidth, PImage img, PImage laser, int points, int laserSpeed, int movementSpeed, int numMovesBeforeVerticalMovement, int lives) {
        this.x = x;
        this.y = y;
        this.xWidth = xWidth;
        this.yWidth = yWidth;
        this.img = img;
        this.laser = laser;
        this.points = points;
        this.movementSpeed = movementSpeed;
        this.numMovesBeforeVerticalMovement = numMovesBeforeVerticalMovement;
        this.movementTracker = numMovesBeforeVerticalMovement;
        this.laserSpeed = laserSpeed;
        this.lives = lives;
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

    // movement should occur every 40 frames.
    public void update() {
        frameCounter++;
        if (frameCounter == 40) {
            move();
            frameCounter = 0;
        }
    }

    // Shoot a laser from the alien's position
    public AlienLaser shootLaser() {
        return new AlienLaser(x + xWidth / 2, y + yWidth, this.laserSpeed, this.laser);
    }


    public void render() {
        if (!isDead) {
            image(img, x, y, xWidth, yWidth);
        }
    }

    public void looseLife() {
        lives--;
        if(lives == 0) {
            setDead(true);
        }
    }

    public boolean isDead() {
        return isDead;
    }

    public void setDead(boolean dead) {
        this.isDead = dead;
    }

    public int getPoints() {
        return points;
    }

}
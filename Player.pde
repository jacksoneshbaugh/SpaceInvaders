public class Player extends GameObject {
    
    public int x, y;
    private PImage img;
    public int fireDelay = 3;
    public int fireTime;
    public int laserSpeed = 10;
    public boolean fireLocked = false;
    public ArrayList<PlayerLaser> lasers = new ArrayList<PlayerLaser>();

    public Player() {

        this.x = (width / 2) - 40;
        this.y = height - 100;
        this.img = loadImage("img/player.png");

    }

    public void update() {
    }

    public void moveLeft() { 
        if (x > 0) {
            x -= 10;
        }
    }

    public void moveRight() {
        if (x < width - 80) {
            x += 10;
        }
    }

    // Creates laser at player position
    public void fire() {
        if (fireTime <= millis()){
            lasers.add(new PlayerLaser(x+38, y, laserSpeed, PI/2));
            fireTime = millis() + 100*fireDelay;
        }
    }

    public int getX() {
        return x;
    }

    public void render() {
        image(img, x, y, 80, 40);

    }

}

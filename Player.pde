public class Player extends GameObject {
    
    private int x, y;
    private PImage img;

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

    // TODO : Fire laser
    public void fire() {

    }

    public int getX() {
        return x;
    }

    public void render() {

        image(img, x, y, 80, 40);

    }

}

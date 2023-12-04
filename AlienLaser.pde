public class AlienLaser extends Laser {

    // Scaling Variables
    private int w = 10, h = 20;

    public AlienLaser(int x, int y, int speed, PImage image) {
        super(x, y, speed, PI/2, image);
    }


    // Override update method because the laser needs to move down, not up.
    @Override
    public void update() {
        x += speed*cos(angle);
        y += speed*sin(angle); // Add to y because the laser needs to move down.
    }

    // Override render method because the laser has different scaling variables.
    @Override
    public void render() {
        image(img, x, y, w, h);
    }



}
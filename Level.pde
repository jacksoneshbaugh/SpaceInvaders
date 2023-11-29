public class Level extends GameObject {
    
    Player player;
    Alien[][] aliens;
    boolean isOver;
    int score;
    int lives;

    public Level() {
        player = new Player();

        // fill row with aliens, bottom two rows GreenAlien, 2nd row BlueAlien, and top row PinkAlien
        // Aliens need to be instantiated with their x and y coordinates, a movement speed, and a number of moves before a vertical movement should happen.
        // THE ONLY PARAMETERS THAT SHOULD BE DIFFERENT BETWEEN ALIENS ARE THEIR X AND Y COORDINATES.
        // The first row of aliens should be 50 pixels below the top of the screen.
        // The second row of aliens should be 100 pixels below the top of the screen.
        // The third row of aliens should be 150 pixels below the top of the screen.
        // The fourth row of aliens should be 200 pixels below the top of the screen.
        // The aliens should be spaced 50 pixels apart from each other.

        aliens = new Alien[4][10];
        for (int i = 0; i < aliens.length; i++) {
            for (int j = 0; j < aliens[i].length; j++) {
                if (i >= 2) {
                    aliens[i][j] = new GreenAlien(50 + j * 50, 50 + i * 50, 1, 10);
                } else if (i == 1) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, 1, 10);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, 1, 10);
                }
            }
        }

        


        isOver = false;
        score = 0;
        lives = 3;
    }


    public void update() {
        if (isOver) {
            return;
        }
        player.update();
        for (Alien[] alienArr : aliens) {
            for(Alien alien : alienArr) {
                alien.update();
            }
        }
    }
    
    public void render() {
        player.render();
        for (Alien[] alienArr : aliens) {
            for(Alien alien : alienArr) {
                alien.render();
            }
        }
    }

}

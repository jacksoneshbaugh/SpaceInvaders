public class Level extends GameObject {
    
    private Player player;
    private Alien[][] aliens;
    private boolean isOver;
    private int score;
    private int lives;

    public Level(int lives) {

        this.lives = lives;

        player = new Player();

        // fill rows with aliens: bottom two rows GreenAlien, 2nd row BlueAlien, and top row PinkAlien
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
                    aliens[i][j] = new GreenAlien(50 + j * 50, 50 + i * 50, 10, 10);
                } else if (i == 1) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, 10, 10);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, 10, 10);
                }
            }
        }

        


        isOver = false;
        score = 0;
        lives = 3;
    }

    public int getScore() {
        return score;
    }

    public int getLives() {
        return lives;
    }


    public void update() {
        if (isOver) {
            return;
        }
        player.update();
        if (player.lasers.isEmpty() == false) {
            for (PlayerLaser laser : player.lasers) {
                laser.update();
            }
        }
        for (Alien[] alienArr : aliens) {
            for (Alien alien : alienArr) {
                alien.update();
                //Collision code (Broken currently)
                if (player.lasers.isEmpty() == false) {
                    for (PlayerLaser laser : player.lasers) {
                        if (laser.x >= alien.x && laser.x <= alien.xWidth && laser.y >= alien.y && laser.y <= alien.yWidth && alien.getIsDead() == false) {
                            alien.setIsDead(true);
                        }
                    }
                }
            }
        }
    }
    
    public void render() {
        player.render();
        if(player.lasers.isEmpty() == false) {
            for (PlayerLaser laser : player.lasers) {
                laser.render();
            }
        }
        for (Alien[] alienArr : aliens) {
            for(Alien alien : alienArr) {
                alien.render();
            }
        }
    }

    /**
    * key can be 'l', 'r' for left and right arrows respectively
    * or ' ' for spacebar
    */

    //While moving and fireing at the same time, you have to press the space bar again, you cant hold it. We need to rethink our rollover.
    public void onKeyPressed(char key) {
        switch(key) {
            case 'l':
                player.moveLeft();
                break;
            case 'r':
                player.moveRight();
                break;
            case ' ':
                player.fire();
                break;
        }
    }

}

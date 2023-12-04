public class Level extends GameObject {
    
    private Player player;
    private Alien[][] aliens;
    private boolean isOver;
    private int score;
    private int lives;
    private Player player;

    public Level(int lives) {

        this.lives = lives;

        player = new Player();

        // fill rows with aliens: bottom two rows GreenAlien, 2nd row BlueAlien, and top row PinkAlien
        // THE ONLY PARAMETERS THAT SHOULD BE DIFFERENT BETWEEN ALIENS ARE THEIR X AND Y COORDINATES.

        aliens = new Alien[4][10];
        for (int i = 0; i < aliens.length; i++) {
            for (int j = 0; j < aliens[i].length; j++) {
                if (i >= 2) {
                    aliens[i][j] = new GreenAlien(50 + j * 50, 50 + i * 50, 10, 20);
                } else if (i == 1) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, 10, 20);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, 10, 20);
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

                // Collision detection
                
                if (player.lasers.isEmpty() == false) {
                    for (PlayerLaser laser : player.lasers) {
                        if (laser.x >= alien.x && laser.x <= alien.x + alien.xWidth && laser.y >= alien.y && laser.y <= alien.y + alien.yWidth && !alien.isDead()) {
                            alien.setDead(true);
                            player.lasers.remove(laser);
                            break;
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
    // Two separate listeners?
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

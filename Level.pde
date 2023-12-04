public class Level extends GameObject {
    
    private Player player;
    private Alien[][] aliens;
    private ArrayList<AlienLaser> alienLasers;
    private int alienArrayLength, alienArrayWidth;
    private boolean isOver;
    private boolean isWon;
    private int score;
    private int fireDelay, fireDelayCounter = 0; // in frames; 60 frames = 1 second
    //                                             i-component           j-component
    public Level(int fireDelay, Player player, int alienArrayLength, int alienArrayWidth) {
        this.fireDelay = fireDelay;
        this.player = player;
        this.alienArrayLength = alienArrayLength;
        this.alienArrayWidth = alienArrayWidth;

        this.alienLasers = new ArrayList<AlienLaser>();

        // fill rows with aliens: bottom two rows GreenAlien, 2nd row BlueAlien, and top row PinkAlien
        // THE ONLY PARAMETERS THAT SHOULD BE DIFFERENT BETWEEN ALIENS ARE THEIR X AND Y COORDINATES.

        aliens = new Alien[alienArrayLength][alienArrayWidth];
        for (int i = 0; i < aliens.length; i++) {
            for (int j = 0; j < aliens[i].length; j++) {
                if (i >= 2) {
                    aliens[i][j] = new GreenAlien(50 + j * 50, 50 + i * 50, 10, 20, 3);
                } else if (i == 1) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, 10, 20, 3);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, 10, 20, 3);
                }
            }
        }

        isOver = false;
        score = 0;
    }

    public int getScore() {
        return score;
    }

    public void update() {
        onInput();
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

        alienFire();

        for(AlienLaser laser : alienLasers) {
            laser.update();

            // Collision detection
            if(laser.x >= player.x && laser.x <= player.x + player.xWidth && laser.y >= player.y && laser.y <= player.y + player.yWidth) {
                player.loseLife();
                alienLasers.remove(laser);

                if(player.getLives() == 0) {
                    isOver = true;
                    isWon = false;
                }
                break;
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

        for(AlienLaser laser : alienLasers) {
            laser.render();
        }
    }

    // Alien Laser Shooting Logic
    // Choose a random column and shoot a laser from the bottom alien in that column.

    public void alienFire() {

        if(fireDelayCounter < fireDelay) {
            fireDelayCounter++;
            return;
        }

        int randomColumn = (int) (Math.random() * alienArrayWidth);
        for (int i = alienArrayLength - 1; i >= 0; i--) {
            if (!aliens[i][randomColumn].isDead()) {
                alienLasers.add(aliens[i][randomColumn].shootLaser());
                println("Alien i = " + i + " Alien j = " + randomColumn + " shot a laser.");
                break;
            }
        }

        fireDelayCounter = 0;
    }


    public boolean isOver() {
        return isOver;
    }

    public boolean isWon() {
        return isWon;
    }


    // check if the level is over and if the player won.
    // Player looses if any alien reaches the bottom of the screen
    // Player wins if all aliens are dead

    public void checkStatus() {
        boolean allDead = true;
        for (Alien[] alienArr : aliens) {
            for (Alien alien : alienArr) {
                if (!alien.isDead()) {
                    allDead = false;
                }
                if (alien.y >= 500) {
                    isOver = true;
                    isWon = false;
                    return;
                }
            }
        }
        if (allDead) {
            isOver = true;
            isWon = true;
        }
    }
    

    /**
    * key can be 'l', 'r' for left and right arrows respectively
    * or ' ' for spacebar
    */

    //While moving and fireing at the same time, you have to press the space bar again, you cant hold it. We need to rethink our rollover.
    // Two separate listeners?
/*
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
*/

    public void onInput(char key){
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

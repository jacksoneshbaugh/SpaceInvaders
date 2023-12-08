class Level2 extends Level {

    public Level2(Player player) {
        super(120, player, 5, 12, 15, 5);
        this.fillAlienArray();
    }

    @Override
    public void fillAlienArray() {
        for (int i = 0; i < aliens.length; i++) {
            for (int j = 0; j < aliens[i].length; j++) {
                if (i == 0) {
                    aliens[i][j] = new GreenAlien(50 + j * 50, 50 + i * 50, alienSpeed, numMovesBeforeVerticalMovement, alienLaserSpeed);
                } else if (i < 3) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, alienSpeed, numMovesBeforeVerticalMovement, alienLaserSpeed);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, alienSpeed, numMovesBeforeVerticalMovement, alienLaserSpeed);
                }
            }
        }
    }
}
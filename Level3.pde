class Level3 extends Level {

    public Level3(Player player) {
        super(60, player, 6, 14, 20, 7);
        this.fillAlienArray();
    }

    @Override
    public void fillAlienArray() {
        for (int i = 0; i < aliens.length; i++) {
            for (int j = 0; j < aliens[i].length; j++) {
                if (i < 2) {
                    aliens[i][j] = new BlueAlien(50 + j * 50, 50 + i * 50, alienSpeed, numMovesBeforeVerticalMovement, alienLaserSpeed);
                } else {
                    aliens[i][j] = new PinkAlien(50 + j * 50, 50 + i * 50, alienSpeed, numMovesBeforeVerticalMovement, alienLaserSpeed);
                }
            }
        }
    }
}
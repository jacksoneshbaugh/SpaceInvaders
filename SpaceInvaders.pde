Level l;

void setup() {

    size(800, 600);
    l = new Level(3);
    

}

void draw() {
    background(0);

    // update & render the active level
    l.update();
    l.render();

    // draw the player's score at the top right
    fill(255);
    textSize(20);
    textAlign(RIGHT);
    text(l.getScore(), width - 10, 20);

    // draw the player's lives at the top left
    textAlign(LEFT);
    text("Lives: " + l.getLives(), 10, 20);


}

void keyPressed() {
    // pass the key press to the active level
    switch(keyCode) {
        case LEFT:
            l.onKeyPressed('l');
            break;
        case RIGHT:
            l.onKeyPressed('r');
            break;
        default:
            switch(key) {
                case ' ':
                    l.onKeyPressed(' ');
                    break;
                default:
                    break;
            }
    }
}
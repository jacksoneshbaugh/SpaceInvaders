Level l;
Player player;

void setup() {
    size(800, 600);

    frameRate(60);

    player = new Player();
    l = new Level(600, player, 4, 10);
    

}

void draw() {
    background(0);

    // update & render the active level
    l.update();
    l.render();
    l.checkStatus();

    // draw the player's score at the top right
    fill(255);
    textSize(20);
    textAlign(RIGHT);
    text(l.getScore(), width - 10, 20);

    // draw the player's lives at the top left
    textAlign(LEFT);
    text("Lives: " + player.getLives(), 10, 20);


}

//Keeps track of multiple keys being pressed. Actual movement and firing in player code.

void keyPressed(){
    if(key == ' '){
        l.player.isFireing = true;
    }
    if(keyCode == LEFT ){
        l.player.movingLeft = true;
    }
    if(keyCode == RIGHT ){
        l.player.movingRight = true;
    }  
}

void keyReleased() {
    if(key == ' '){
        l.player.isFireing = false;
    }
    if(keyCode == LEFT ){
        l.player.movingLeft = false;
    }
    if(keyCode == RIGHT ){
        l.player.movingRight = false;
    }  
}
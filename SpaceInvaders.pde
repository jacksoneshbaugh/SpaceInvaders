import processing.sound.*;
import java.io.*;
import java.util.HashMap;
import javax.swing.JOptionPane;

Level level1, level2, level3, activeLevel;
int levelNum = -1;
Player player;
SoundFile sound;
File scoresFile;

void setup() {
    size(800, 600);
    
    frameRate(60);
    
    player = new Player();
    level1 = new Level1(player);
    level2 = new Level2(player);
    level3 = new Level3(player);
    
    activeLevel = level1;
    
    scoresFile = new File(System.getProperty("user.home") + "/SpaceInvadersScores.txt");
    
    try {
        scoresFile.createNewFile();
    } catch(IOException e) {
        e.printStackTrace();
    }
    
    sound = new SoundFile(this, "sounds/space_invaders.mp3");
    sound.loop();
}

void draw() {
    
    if (levelNum == -1) {
        // Start Screen
        image(loadImage("img/title.png"), 0, 0, width, height);
    } else if (levelNum == -2) {
        image(loadImage("img/leaderboard.png"), 0, 0, width, height);
        // Leaderboard
        // Read the scores from the file
        // Display top 10 scores in a table from highest to lowest
        
        HashMap<String, Integer> scores = new HashMap<String, Integer>();
        
        try {
            BufferedReader reader = new BufferedReader(new FileReader(scoresFile));
            String line = reader.readLine();
            while(line != null) {
                String[] data = line.split(",");
                String name = data[0];
                int score = Integer.parseInt(data[1]);
                scores.put(name, score);
                line = reader.readLine();
            }
            reader.close();
        } catch(IOException e) {
            e.printStackTrace();
        }
        
        // TODO : Sort the scores from highest to lowest
        
        
        // Display the scores
        fill(255);
        textSize(50);
        textAlign(CENTER);
        text("Leaderboard", width / 2, 50);
        
        textSize(20);
        textAlign(CENTER);
        int y = 100;
        for (String name : scores.keySet()) {
            text(name + ": " + scores.get(name), width / 2, y);
            y += 20;
        }
        
        // display a key to return to the start screen
        textSize(20);
        textAlign(CENTER);
        text("Press ENTER to return to the start screen", width / 2, height - 20);
    } else if (levelNum == 0) {
        // Instructions
        image(loadImage("img/instructions.png"), 0, 0, width, height);
    } else {
        // Game
        
        background(0);
        
        // update & render the active level
        activeLevel.update();
        activeLevel.render();
        
        // draw the player's score at the top right
        fill(255);
        textSize(20);
        textAlign(RIGHT);
        text(activeLevel.getScore(), width - 10, 20);
        
        // draw the player's lives at the top left
        textAlign(LEFT);
        text("Lives:" + player.getLives(), 10, 20);
    
        // Win/Lose
        
        if (activeLevel.isOver()) { 
            if (activeLevel.isWon()) {
                // check if there's another level
                if (levelNum == 1) {
                    activeLevel = level2;
                    levelNum++;
                    } else if (levelNum == 2) {
                    activeLevel = level3;
                    levelNum++;
                } else {
                    // check win/loss
                    if (activeLevel.isWon()) {
                        // win
                        fill(255);
                        textSize(50);
                        textAlign(CENTER);
                        text("You Win!", width / 2, height / 2);
                    } else {
                        // loss
                        fill(255);
                        textSize(50);
                        textAlign(CENTER);
                        text("You Lose!", width / 2, height / 2);
                        }
                    // save the score
                    saveScore(activeLevel.getScore());
                    // show the leaderboard
                    levelNum = -2;
                    }
                } else {
                    // loss
                    fill(255);
                    textSize(50);
                    textAlign(CENTER);
                    text("You Lose!", width / 2, height / 2);
                    // save the score
                    saveScore(activeLevel.getScore());
                    // show the leaderboard
                    levelNum = -2;
                }
            
            
            }
        }
    }

// Keeps track of multiple keys being pressed. Actual movement and firing in player code.

void keyPressed() {
    if (key == ' ') {
        activeLevel.player.isFireing = true;
        }
    if (keyCode == LEFT) {
        activeLevel.player.movingLeft = true;
        }
    if (keyCode == RIGHT) {
        activeLevel.player.movingRight = true;
        }
    
    if (keyCode == ENTER) {
        if (levelNum <= 0) {
            levelNum++;
            }
        } else if (key == 'l') {
        // show the leaderboard
        levelNum = -2;
        }
    }

void keyReleased() {
    if (key == ' ') {
        activeLevel.player.isFireing = false;
        }
    if (keyCode == LEFT) {
        activeLevel.player.movingLeft = false;
        }
    if (keyCode == RIGHT) {
        activeLevel.player.movingRight = false;
        }  
    }

// Saving Scores to a file.
// Format : name,score
void saveScore(int score) {
    try {
        // Prompt the user for their name
        String name = JOptionPane.showInputDialog("Enter your name.");
        println("name");
        
        FileWriter writer = new FileWriter(scoresFile);
        writer.write(name + "," + score);
        writer.close();
        } catch(IOException e) {
        e.printStackTrace();
        }
    
    }
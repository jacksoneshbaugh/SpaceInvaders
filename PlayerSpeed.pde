public class PlayerSpeed extends Modifier{

    void applyModifiers(){
        player.playerSpeed += 5;;
    }

    void render(){
        point(0, 0);
    }

    void render(int index){
        rect(index*50, 300, 25, 25);
    }

    void update(){
        applyModifiers();
    }
}
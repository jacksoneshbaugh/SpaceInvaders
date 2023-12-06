public class LaserSpeed extends Modifier{
    //Apply modifiers will be called every level change
    void applyModifiers(){
        player.laserSpeed = player.laserSpeed * 1.1;
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
public enum AlienType {

    GREEN("green"), PINK("pink"), BLUE("blue");

    private String type;

    AlienType(String type) {
        this.type = type;
    }

    public String toString() {
        return type;
    }

}
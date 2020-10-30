package javaservlet.vo;

public class Product {
    private int id;
    private String name;
    private double price;
    private String imgUrl;
    private double weight;
    private String applicableScene;
    private String applicableRange;
    private int leftNum;
    private String color;
    private int numOfKey;
    private int buyNum;

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }

    public Product(int id, String name, double price,
                   double weight, String applicableScene, String imgUrl,
                   String applicableRange, int leftNum, String color, int numOfKey) {
        this.imgUrl = imgUrl;
        this.id = id;
        this.name = name;
        this.price = price;
        this.weight = weight;
        this.applicableScene = applicableScene;
        this.applicableRange = applicableRange;
        this.leftNum = leftNum;
        this.color = color;
        this.numOfKey = numOfKey;
    }
    public Product(){}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getApplicableScene() {
        return applicableScene;
    }

    public void setApplicableScene(String applicableScene) {
        this.applicableScene = applicableScene;
    }

    public String getApplicableRange() {
        return applicableRange;
    }

    public void setApplicableRange(String applicableRange) {
        this.applicableRange = applicableRange;
    }

    public int getLeftNum() {
        return leftNum;
    }

    public void setLeftNum(int leftNum) {
        this.leftNum = leftNum;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getNumOfKey() {
        return numOfKey;
    }

    public void setNumOfKey(int numOfKey) {
        this.numOfKey = numOfKey;
    }

    public String getNumMethod(String attr){
        if(attr.equals("leftNum")) return ""+getLeftNum();
        if(attr.equals("numOfKey")) return ""+getNumOfKey();
        if (attr.equals("id")) return ""+getId();
        if(attr.equals("price")) return ""+getPrice();
        if(attr.equals("weight")) return ""+getWeight();
        return "";
    }
}

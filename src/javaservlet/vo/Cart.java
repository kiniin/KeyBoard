package javaservlet.vo;

public class Cart {
    private int productNo;
    private int number;
    private String name;
    private String color;
    private double price;
    private int leftNum;
    private String imgURL;
    private int NumofKey;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getLeftNum() {
        return leftNum;
    }

    public void setLeftNum(int leftNum) {
        this.leftNum = leftNum;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public int getNumofKey() {
        return NumofKey;
    }

    public void setNumofKey(int numofKey) {
        NumofKey = numofKey;
    }

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}

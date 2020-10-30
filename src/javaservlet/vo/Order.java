package javaservlet.vo;

import java.util.Date;

public class Order {
    private int orderNo;
    private double totalPrice;
    private boolean state;
    private Date date;
    private int addressNo;
    private int userNo;

    public Order(){}
    public Order(int orderNo, double totalPrice, boolean state, Date date, int addressNo, int userNo) {
        this.orderNo = orderNo;
        this.totalPrice = totalPrice;
        this.state = state;
        this.date = date;
        this.addressNo = addressNo;
        this.userNo = userNo;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(int addressNo) {
        this.addressNo = addressNo;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
}

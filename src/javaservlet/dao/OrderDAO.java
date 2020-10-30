package javaservlet.dao;

import javaservlet.vo.Address;
import javaservlet.vo.Cart;
import javaservlet.vo.Order;
import javaservlet.vo.Product;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface OrderDAO {
    ArrayList<Order> getOrdersByUserNo();
    ArrayList<Product> getProductsByOrder(int OrderNo);
    void close();
    Address getOrderAddress(int orderNo);
    int generateOrder(double price, Timestamp date, int addressNo, int userNo) throws Exception;
    int updateItemPurchase(int orderNo, ArrayList<Cart> carts) throws Exception;
}

package javaservlet.dao;

import javaservlet.vo.Cart;


import java.util.ArrayList;

public interface cartDAO {
    public int addintoCart(int userNo,int productNo,int count) throws Exception;
    public ArrayList<Cart> queryCartByUserNo(int userNo) throws Exception;
    public ArrayList<Cart> queryProduct(ArrayList<Cart> cartProduct) throws Exception;
    public int deleteCartProduct(int userNo,int productNo) throws Exception;

    void changeCartProduct(int userNo, int productNo, int up_down) throws Exception;
    void removeCartProduct(int userNo, int productNo) throws Exception;
}

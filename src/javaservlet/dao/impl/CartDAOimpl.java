package javaservlet.dao.impl;

import javaservlet.dao.cartDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.Cart;
import javaservlet.vo.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAOimpl implements cartDAO {
    @Override
    public int addintoCart(int userNo, int productNo,int count) throws Exception {
        int state = 0;
        String sql = "INSERT INTO Cart (Product_productNo,User_userNo,quantity) values(?,?,?)";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(2,userNo);
            pstmt.setInt(1,productNo);
            pstmt.setInt(3,count);
            int rs = pstmt.executeUpdate();
            if (rs > 0) state = 1;
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }
        return state;
    }

    @Override
    public ArrayList<Cart> queryCartByUserNo(int userNo) throws Exception {
        ArrayList<Cart> carts = new ArrayList<>();

        String sql = "Select * from Cart where User_userNo = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,userNo);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Cart cart = new Cart();
                cart.setNumber(rs.getInt("quantity"));
                cart.setProductNo(rs.getInt("Product_productNo"));
                carts.add(cart);
            }
            rs.close();
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return carts;
    }

    @Override
    public ArrayList<Cart> queryProduct(ArrayList<Cart> cartProduct) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select * from Product where Seller_User_userNo = 3636 AND productNo = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            for (Cart x : cartProduct){
                pstmt = dbc.getConnection().prepareStatement(sql);
                pstmt.setInt(1,x.getProductNo());

                ResultSet rs = pstmt.executeQuery();

                while (rs.next()){
                    x.setName(rs.getString("name"));
                    x.setColor(rs.getString("color"));
                    x.setPrice(rs.getDouble("price"));
                    x.setLeftNum(rs.getInt("leftNum"));
                    x.setImgURL(rs.getString("imgURL"));
                    x.setNumofKey(Integer.parseInt(rs.getString("specification")));
                }
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return cartProduct;
    }

    @Override
    public int deleteCartProduct(int userNo, int productNo) throws Exception {
        int valid = 0;
        String sql = "Delete from Cart where User_userNo= ? AND Product_productNo = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,userNo);
            pstmt.setInt(2,productNo);

            int rs = pstmt.executeUpdate();
            if (rs > 0) valid = 1;
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return valid;
    }

    @Override
    public void changeCartProduct(int userNo, int productNo, int up_down) throws Exception {
//        String sql1 = "select Quantity from Cart where User_userNo= ? AND Product_productNo = ?"
        String sql = null;
        if(up_down==1)
            sql = "update Cart set quantity=quantity+1 where User_userNo= ? AND Product_productNo = ?";
        else if(up_down==-1)
            sql = "update Cart set quantity=quantity-1 where User_userNo= ? AND Product_productNo = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        dbc = new DBConnect();
        pstmt = dbc.getConnection().prepareStatement(sql);

        pstmt.setInt(1,userNo);
        pstmt.setInt(2,productNo);
        pstmt.executeUpdate();
        pstmt.close();
        dbc.close();
    }

    @Override
    public void removeCartProduct(int userNo, int productNo) throws Exception {
        String sql = "delete from Cart where User_userNo=? and Product_productNo=?";
        PreparedStatement pstmt;
        DBConnect dbc;

        dbc = new DBConnect();
        pstmt = dbc.getConnection().prepareStatement(sql);
        pstmt.setInt(1,userNo);
        pstmt.setInt(2,productNo);
        pstmt.executeUpdate();
        pstmt.close();
        dbc.close();
    }
}

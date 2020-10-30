package javaservlet.dao.impl;

import javaservlet.dao.OrderDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.Address;
import javaservlet.vo.Cart;
import javaservlet.vo.Order;
import javaservlet.vo.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class OrderDAOImpl implements OrderDAO {
    private int userNo;
    private DBConnect dbconn = new DBConnect();
    private PreparedStatement statement;
    public OrderDAOImpl(int userNo){
        this.userNo=userNo;
    }
    @Override
    public void close() {
        dbconn.close();
    }
    @Override
    public ArrayList<Order> getOrdersByUserNo() {
       ArrayList<Order> orders = new ArrayList<>();
       String sql = "select * from Orders where Customer_User_userNo="+userNo;
       try{
           statement = dbconn.getConnection().prepareStatement(sql);
           ResultSet resultSet = statement.executeQuery();
           while(resultSet.next()){
               Order order = setOrderByResultSet(resultSet);
               orders.add(order);
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
       return orders;
    }
    @Override
    public Address getOrderAddress(int orderNo){
//        ArrayList<Order> orders = getOrdersByUserNo();
         Address address =new Address();
         String sql = "select * from BusinessAddress b, Orders o where b.addressNo = o.BusinessAddress_addressNo and orderNo ="+orderNo;
         try{
            statement = dbconn.getConnection().prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                address.setProvince(resultSet.getString("province"));
                address.setCity(resultSet.getString("city"));
                address.setDetailedAddress(resultSet.getString("detailedAddress"));

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return address;
    }

    @Override
    public int generateOrder(double price, Timestamp date, int addressNo, int userNo) throws Exception {
        int orderNo = 0;
        String sql = "INSERT INTO Orders (totalPrice,state,date,delievryFee,Customer_User_userNo,Seller_User_userNo,BusinessAddress_addressNo) values(?,?,?,null,?,3636,?)";
        String sql2 = "select * from Orders order by orderNo desc limit 1";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setDouble(1,price);
            pstmt.setString(2,"false");
            pstmt.setTimestamp(3,date);
            pstmt.setInt(5,addressNo);
            pstmt.setInt(4,userNo);

            int rs = pstmt.executeUpdate();

            pstmt = dbc.getConnection().prepareStatement(sql2);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()){
               orderNo =  resultSet.getInt("orderNo");
            }
            resultSet.close();;
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return orderNo;
    }

    @Override
    public int updateItemPurchase(int orderNo, ArrayList<Cart> carts) throws Exception {
        int state = 1;
        String sql = "INSERT INTO ItemPurchase (Order_orderNo,Product_productNo,num) values(?,?,?)";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            for (int i = 0;i<carts.size();i++){
                pstmt.setInt(1,orderNo);
                pstmt.setInt(2,carts.get(i).getProductNo());
                pstmt.setInt(3,carts.get(i).getNumber());
                int rs = pstmt.executeUpdate();
                if (rs > 0);else {state = 0;}
            }
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return state;
    }

    @Override
    public ArrayList<Product> getProductsByOrder(int OrderNo) {
        ArrayList<Product> products = new ArrayList<>();
        ProductDAOImpl impl = new ProductDAOImpl();
        String sql =
                "select * from Product p, Orders o, ItemPurchase i where o.orderNo = i.Order_orderNo and " +
                "i.Product_productNo = p.productNo and orderNo="+OrderNo;
        try{
            statement = dbconn.getConnection().prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Product product = impl.setProductByResultSet(resultSet);
                product.setBuyNum(resultSet.getInt("num"));
                products.add(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    private Order setOrderByResultSet(ResultSet resultSet)throws SQLException{
        return new Order(
                resultSet.getInt("orderNo"),
                resultSet.getDouble("totalPrice"),
                Boolean.parseBoolean(resultSet.getString("state")),
                new Date(resultSet.getTimestamp("date").getTime()),
                resultSet.getInt("BusinessAddress_addressNo"),
                resultSet.getInt("Customer_User_userNo")
        );
    }

}

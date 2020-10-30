package javaservlet.dao.impl;

import javaservlet.dao.ProductDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class ProductDAOImpl implements ProductDAO {
    private DBConnect dbconn = null;
    private PreparedStatement statement;
    private ArrayList<Product> products;
    String sql = "select * from Product";

    public ArrayList<Product> getProductsInfo(int start,int max) {
        products = new ArrayList<>();
        dbconn = new DBConnect();
        String sql1 = sql+" where Seller_User_userNo = 3636 "+" limit "+start+","+max;
        try {
            statement = dbconn.getConnection().prepareStatement(sql1);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = setProductByResultSet(resultSet);
                products.add(product);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbconn.close();
        }
        return products;
    }

    @Override
    public ArrayList<Product> searchProduct(String query) {
        ArrayList<Product> products0 = getProductsInfo(0,60);
        ArrayList<Product> targetProducts = new ArrayList<>();
        if (products == null) return null;
        String pattern = ".*"+query+".*";
        for(Product product: products0) {

            if (Pattern.matches(pattern, product.getName()))
            {
                targetProducts.add(product);
                System.out.println(product.getName()+"..");
            }
        }
        if(targetProducts.size()==0) return new ArrayList<>();
        else return targetProducts;

    }

    @Override
    public ArrayList<Product> getProductsByID(int id) {
        dbconn = new DBConnect();
        Product product=null;
        String sql1 = sql+ " where productNo="+id;
        String name = null;
        String applicableRange = null;
        products = new ArrayList<>();
        try{
            Connection conn =  dbconn.getConnection();
            statement = conn.prepareStatement(sql1);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                name = resultSet.getString("name");
            }
            resultSet.close();
            sql1 = "select * from Product where name=?";
            statement =conn.prepareStatement(sql1);
            statement.setString(1, name);
//            statement.setString(2, applicableRange);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                Product product1 =setProductByResultSet(resultSet);
                products.add(product1);
            }
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
        return products;
    }

    @Override
    public ArrayList<Product> getProductsByScene(String scene) {
        String sql1 = "select * from Product where Seller_User_userNo = 3636 AND secondClass = ?" ;
        dbconn = new DBConnect();
        ArrayList<Product> products = new ArrayList<>();
        try{
            statement = dbconn.getConnection().prepareStatement(sql1);
            statement.setString(1,scene);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Product product = setProductByResultSet(resultSet);
                products.add(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return products;
    }
    @Override
    public Product setProductByResultSet(ResultSet resultSet) throws SQLException {
        return new Product(resultSet.getInt("productNo"),
                resultSet.getString("name"),
                resultSet.getDouble("price"),
                resultSet.getDouble("weight"),
                resultSet.getString("secondClass"),
                resultSet.getString("imgURL"),
                resultSet.getString("applicableRange"),
                resultSet.getInt("leftNum"),
                resultSet.getString("color"),
                Integer.parseInt(resultSet.getString("specification")));
    }

    @Override
    public ArrayList<String> getProductDetails(String name) {
        dbconn = new DBConnect();
        String sql1 = "select * from pic where name=?";
        System.out.println("1232");
        ArrayList<String> strings = new ArrayList<>();
        try{
            statement = dbconn.getConnection().prepareStatement(sql1);
            statement.setString(1,name);
            ResultSet resultSet = statement.executeQuery();
            System.out.println("1237");
            System.out.println(name);
            while (resultSet.next()){
                System.out.println(name);
                String url = resultSet.getString("imgURL");

                strings.add(url);
                System.out.println(url);
                System.out.println("123");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
        return strings;
    }
}

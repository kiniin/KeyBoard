package javaservlet.dao;

import javaservlet.vo.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductDAO {
    ArrayList<Product> getProductsInfo(int start, int max);
    ArrayList<Product> searchProduct(String query);
//    ArrayList<Product> searchProduct(int upperPrice);
    ArrayList<Product> getProductsByID(int id);
    ArrayList<Product> getProductsByScene(String scene);
    Product setProductByResultSet(ResultSet resultSet) throws SQLException;
    ArrayList<String> getProductDetails(String name);
//    ArrayList<Product> getProductsByName
//    Product setProductByResultSet(ResultSet resultSet) throws SQLException;
}

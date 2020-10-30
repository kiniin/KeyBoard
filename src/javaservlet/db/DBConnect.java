package javaservlet.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    private final String DBURL = "jdbc:mysql://39.107.221.157:3306/21_4_43?useSSL=false&useUnicode=true&characterEncoding=UTF8&serverTimezone=Asia/Shanghai";
    private final String DBUSER = "root";
    private final String DBPASSWORD = "Sth161510!";


//    private final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
//    private final String DBURL = "jdbc:mysql://127.0.0.1:3306/mu?useSSL=false&useUnicode=true&characterEncoding=UTF8&serverTimezone=Asia/Shanghai";
//    private final String DBUSER = "root";
//    private final String DBPASSWORD = "root";

//    private final String DBDRIVER = "com.mysql.jdbc.Driver";
//    private final String DBURL = "jdbc:mysql://39.107.221.157:3306/Keyboard";
//    private final String DBUSER = "root";
//    private final String DBPASSWORD = "123456";
    private Connection connection = null;

    public DBConnect(){
        try{
            Class.forName(DBDRIVER);
            this.connection = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection(){
        return this.connection;
    }

    public void close(){
        try{
            this.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
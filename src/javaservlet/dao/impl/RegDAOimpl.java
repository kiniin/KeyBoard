package javaservlet.dao.impl;

import javaservlet.dao.RegDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegDAOimpl implements RegDAO {

    @Override
    public int CreateUserinfo(User user) throws Exception {
        int state = 0;
        String sql = "INSERT INTO User (account,password,name,question,answer,phoneNo,isCustomer,email) values(?,?,null,?,?,?,null,?)";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

//        System.out.println(user.getAccount());
//        System.out.println(user.getPassword());
//        System.out.println(user.getQuestion());
//        System.out.println(user.getAnswer());
//        System.out.println(user.getPhoneNo());
//        System.out.println(user.getEmail());

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,user.getAccount());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getQuestion());
            pstmt.setString(4,user.getAnswer());
            pstmt.setString(5,user.getPhoneNo());
            pstmt.setString(6,user.getEmail());

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
    public int queryAccount(String account) throws Exception {
        int valid = 1;
        String sql = "Select * from User where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,account);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                valid = 0;
            }
            rs.close();
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }
        return valid;
    }

    @Override
    public int CreateDetailed(int userNo) throws Exception {
        int state = 0;
        String sql = "INSERT INTO Customer (User_userNo) values(?)";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,userNo);

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
    public int queryUserNo(String account) throws Exception {
        int userNo = 1;
        String sql = "Select * from User where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,account);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                userNo = rs.getInt("userNo");
            }
            rs.close();
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }
        return userNo;
    }
}

package javaservlet.dao.impl;

import javaservlet.dao.UserDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.User;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class UserDAOimpl implements UserDAO {

    @Override
    public int queryByUsername(User user) throws Exception {
        int flag = 0;
        String sql ="Select * from User where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,user.getAccount());

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("password").equals(user.getPassword())) {
                    flag = 1;
                }
            }
                rs.close();
                pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return flag;
    }

    @Override
    public HashMap<String, String> getUserinfo(String account) throws Exception {
        HashMap<String,String> hashMap = new HashMap<>();
        String sql ="Select * from User where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,account);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                hashMap.put("userNo", String.valueOf(rs.getInt("userNo")));
                hashMap.put("question",rs.getString("question"));
                hashMap.put("phoneNo",rs.getString("phoneNo"));
                hashMap.put("email",rs.getString("email"));
            }
            rs.close();
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }

        String sql2 = "Select * from Customer where User_userNo = ?";
        try{
            pstmt = dbc.getConnection().prepareStatement(sql2);
            pstmt.setString(1,hashMap.get("userNo"));
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                hashMap.put("name",rs.getString("name"));
                hashMap.put("DoB", String.valueOf(rs.getDate("DoB")));
                hashMap.put("gender",rs.getString("gender"));
                hashMap.put("nickName",rs.getString("nickName"));
            }
            rs.close();
            pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return hashMap;
    }

    @Override
    public int checkByQuestion(User user) throws Exception {
        int flag = 0;
        String sql ="Select * from User where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,user.getAccount());

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("answer").equals(user.getAnswer())) {
                    flag = 1;
                }
            }
                rs.close();
                pstmt.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }

        return flag;
    }

    @Override
    public int ChangePassword(User user) throws Exception {
        int valid = 0;
        String sql ="Update User set password = ? where account = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,user.getPassword());
            pstmt.setString(2,user.getAccount());

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
    public int ChangeDetailed(User user) throws Exception {
        int state = 0;
        String sql = "Update Customer set name = ?, DoB = ? ,gender = ?, nickName = ? where User_userNo = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);

            pstmt.setString(1,user.getName());
            pstmt.setDate(2, Date.valueOf(user.getDoB()));
            pstmt.setString(3,user.getGender());
            pstmt.setString(4,user.getNickName());
            pstmt.setInt(5,user.getUserNo());

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
}

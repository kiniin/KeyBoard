package javaservlet.dao.impl;

import javaservlet.dao.AddressDAO;
import javaservlet.db.DBConnect;
import javaservlet.vo.Address;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddressDAOImpl implements AddressDAO {
    private DBConnect dbconn =  null;
    private PreparedStatement statement;
    private int userNo;

    public AddressDAOImpl(int userNo){
        this.userNo=userNo;
    }
    @Override
    public void insertAddress(Address address, int id) {
        dbconn = new DBConnect();
        String sql = "insert into BusinessAddress values (0,?,?,?,?,?,?,?) ";

        try{
            statement = dbconn.getConnection().prepareStatement(sql);
            setStatement(address,statement).execute();
            System.out.println("333");
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
    }


    @Override
    public ArrayList<Address> getAddress(int id) {
        dbconn = new DBConnect();
        String sql = "select * from BusinessAddress where User_userNo="+id;
        ArrayList<Address> addresses = new ArrayList<>();
        try{
            statement = dbconn.getConnection().prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Address address = setAddress(resultSet);
                addresses.add(address);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
        return addresses;
    }

    @Override
    public void deleteAddress(int addressNo) {
        dbconn = new DBConnect();
        String sql = "delete from BusinessAddress where addressNo="+addressNo;

        try{
            statement = dbconn.getConnection().prepareStatement(sql);
            statement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
    }

    @Override
    public void editAddress(int addressNo, Address address) {
        dbconn = new DBConnect();
        String sql = "update BusinessAddress set phoneNo=?, province=?, city=?," +
                "detailedAddress=?, receiverName=? ,User_userNo=?,Postcode=?  where addressNo="+addressNo;
        try{
            statement = dbconn.getConnection().prepareStatement(sql);
            setStatement(address, statement).execute();
//            statement.setInt(1,address);
            System.out.println("555");
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            dbconn.close();
        }
    }

    private Address setAddress(ResultSet resultSet) throws SQLException {
        return new Address(
                resultSet.getString("phoneNo"),
                resultSet.getString("province"),
                resultSet.getString("city"),
                resultSet.getString("detailedAddress"),
                resultSet.getString("receiverName"),
                resultSet.getInt("Postcode"),
                resultSet.getInt("User_userNo"),
                resultSet.getInt("addressNo")
        );
    }
    private PreparedStatement setStatement(Address address, PreparedStatement statement) throws  SQLException{
        statement.setString(1,address.getPhoneNum());
        statement.setString(2,address.getProvince());
        statement.setString(3,address.getCity());
        statement.setString(4,address.getDetailedAddress());
        statement.setString(5,address.getReceiver());
        statement.setInt(7,address.getPostcode());
        statement.setInt(6,this.userNo);
        return statement;
    }
}

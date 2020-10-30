package javaservlet.dao;

import javaservlet.vo.Address;

import java.util.ArrayList;

public interface AddressDAO {
    void insertAddress(Address address, int id);
    ArrayList<Address> getAddress(int id);
    void deleteAddress(int addressNo);
    void editAddress(int addressNo, Address address);

}

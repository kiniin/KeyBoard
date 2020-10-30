package javaservlet.vo;

public class Address {
    private int addressNo;
    private String phoneNum;
    private String province;
    private String city;
    private String detailedAddress;
    private String receiver;
    private int Postcode;

    public Address(String phoneNum, String province, String city, String detailedAddress, String receiver, int postcode, int userNo, int addressNo) {
        this.phoneNum = phoneNum;
        this.province = province;
        this.city = city;
        this.detailedAddress = detailedAddress;
        this.receiver = receiver;
        Postcode = postcode;
        UserNo = userNo;
        this.addressNo=addressNo;
    }

    public int getUserNo() {
        return UserNo;
    }

    public void setUserNo(int userNo) {
        UserNo = userNo;
    }

    private int UserNo;

    public Address(){}

    public int getPostcode() {
        return Postcode;
    }

    public void setPostcode(int postcode) {
        Postcode = postcode;
    }
    public int getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(int addressNo) {
        this.addressNo = addressNo;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDetailedAddress() {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

}

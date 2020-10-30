package javaservlet.servlet;

import javaservlet.dao.AddressDAO;
import javaservlet.dao.impl.AddressDAOImpl;
import javaservlet.vo.Address;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class userAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userNo = Integer.parseInt(session.getAttribute("userNo").toString());

        AddressDAO impl = new AddressDAOImpl(userNo);
        if(req.getParameter("deleteAddressNo")!=null){

            int deleteAddressNo = Integer.parseInt(req.getParameter("deleteAddressNo"));
            impl.deleteAddress(deleteAddressNo);
        }

        ArrayList<Address> addressArrayList = impl.getAddress(userNo);
        ArrayList<Address> temp = new ArrayList<>();
        ArrayList<ArrayList<Address>> addressLists = new ArrayList<>();

        int j =0;
        for(Address address:addressArrayList){
            temp.add(address);
            j++;
            if(j%3==0){
                addressLists.add(temp);
                temp = new ArrayList<>();
            }
//            if(j+3>addressArrayList.size()){
//                temp.add(addressArrayList.get(j-2));
//                temp.add(addressArrayList.get(j-1));
//                addressLists.add(temp);
//                break;
//            }
        }
        if(temp.size()!=0) addressLists.add(temp);
        session.setAttribute("addressLists", addressLists);
        resp.sendRedirect("./address.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Address address =new Address();
        address.setReceiver(req.getParameter("nickname"));
        address.setCity(req.getParameter("city"));
        address.setPhoneNum(req.getParameter("phoneNum"));
        address.setDetailedAddress(req.getParameter("detail"));
        address.setPostcode(Integer.parseInt(req.getParameter("postcode")));
        address.setProvince(req.getParameter("province"));

        HttpSession session = req.getSession();
        int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
        AddressDAOImpl impl = new AddressDAOImpl(userNo);
        int flag=0;
        if(!req.getParameter("editAddressNo").equals("")){
            flag=1;
            int editAddressNo = Integer.parseInt(req.getParameter("editAddressNo"));
            System.out.println(editAddressNo);
            impl.editAddress(editAddressNo, address);
        }

        if(flag==0)
            impl.insertAddress(address,userNo);

        this.doGet(req,resp);
    }
}

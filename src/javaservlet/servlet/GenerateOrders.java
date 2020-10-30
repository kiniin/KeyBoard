package javaservlet.servlet;

import javaservlet.dao.AddressDAO;
import javaservlet.dao.OrderDAO;
import javaservlet.dao.impl.AddressDAOImpl;
import javaservlet.dao.impl.OrderDAOImpl;
import javaservlet.vo.Address;
import javaservlet.vo.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class GenerateOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Double price = Double.valueOf(req.getParameter("price"));
        int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
        Date date = new Date();
        Timestamp datetime = new Timestamp(date.getTime());

        ArrayList<Address> addresses = new ArrayList<>();
        AddressDAO dao = new AddressDAOImpl(userNo);
        addresses = dao.getAddress(userNo);
        int addressNo,orderNo;
        addressNo = addresses.get(0).getAddressNo();

        OrderDAO dao1 = new OrderDAOImpl(userNo);
        try {
            orderNo = dao1.generateOrder(price,datetime,addressNo,userNo);
            ArrayList<Cart> carts = (ArrayList<Cart>)session.getAttribute("order");
            dao1.updateItemPurchase(orderNo,carts);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("./ok.jsp");
    }
}

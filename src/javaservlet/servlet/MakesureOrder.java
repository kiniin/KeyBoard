package javaservlet.servlet;

import javaservlet.dao.AddressDAO;
import javaservlet.dao.impl.AddressDAOImpl;
import javaservlet.dao.impl.CartDAOimpl;
import javaservlet.vo.Address;
import javaservlet.vo.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class MakesureOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String cart[] = req.getParameterValues("cartProduct");
//        String productNums[] = req.getParameterValues("productNum");
        ArrayList<Cart> list = new ArrayList<>();


        int proID;

        CartDAOimpl cartDAOimpl = new CartDAOimpl();
        int userID = Integer.parseInt(session.getAttribute("userNo").toString());
        ArrayList<Cart> carts= null;
        try {
            carts = cartDAOimpl.queryCartByUserNo(userID);
            carts = cartDAOimpl.queryProduct(carts);
        } catch (Exception e) {
            e.printStackTrace();
        }

            for (int i=0; i<cart.length;i++ ){
                proID = Integer.parseInt(cart[i]);
                System.out.println(proID);
                Cart cart_ = null;
                for(Cart cart1: carts){
                    if(proID==cart1.getProductNo())
                        cart_=cart1;
                }

                list.add(cart_);

            }
            session.setAttribute("order",list);


            ArrayList<Address> addresses = new ArrayList<>();
            int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
            AddressDAO dao = new AddressDAOImpl(userNo);
            addresses = dao.getAddress(userNo);
            session.setAttribute("orderAddress",addresses);

            resp.sendRedirect("./makesureOrder.jsp");



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

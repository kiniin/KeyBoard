package javaservlet.servlet;

import javaservlet.dao.impl.CartDAOimpl;
import javaservlet.vo.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class getToOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
//
//
//        System.out.println(userNo);
//        ArrayList<Cart> carts = null;
//        try {
//           carts = cartDAOimpl.queryCartByUserNo(userNo);
//           carts = cartDAOimpl.queryProduct(carts);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        session.setAttribute("flag_cart",1);
//        session.setAttribute("carts", carts);
//        resp.sendRedirect("./cart.jsp");
//    }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartDAOimpl cartDAOimpl = new CartDAOimpl();
        System.out.println("enter");
        String[] proIDs =  req.getParameterValues("proList");
        for(String id: proIDs)
            System.out.println(id);

    }
}

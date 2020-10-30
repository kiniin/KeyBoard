package javaservlet.servlet;

import javaservlet.dao.cartDAO;
import javaservlet.dao.impl.CartDAOimpl;
import javaservlet.vo.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
        int productNo;
        cartDAO dao = new CartDAOimpl();
        int position;

//            for (int i = 0; i<cart.length; i++){
//                position = Integer.parseInt(cart[i]);
//                productNo = ((ArrayList<Cart>)session.getAttribute("cartProduct")).get(position).getProductNo();
//                ((ArrayList<Cart>)session.getAttribute("cartProduct")).remove(position);
//                try {
//                    dao.deleteCartProduct(userNo,productNo);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//        }
        resp.sendRedirect("cart.jsp");
    }
}

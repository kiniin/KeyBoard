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
import java.io.PrintWriter;
import java.util.ArrayList;

public class TurntoCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("userNo") == null){
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>alert('Please log in first!')</script>");
            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
        }else {
            cartDAO dao = new CartDAOimpl();
            int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
            ArrayList<Cart> cartProduct = new ArrayList<>();
            try {
                cartProduct = dao.queryCartByUserNo(userNo);
                cartProduct = dao.queryProduct(cartProduct);

            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("cartProduct",cartProduct);
            resp.sendRedirect("cart.jsp");
        }
    }
}

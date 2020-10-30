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

public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        cartDAO dao = new CartDAOimpl();

        if (session.getAttribute("userNo") == null){
            out.println("<script language='javascript'>alert('Please log in first!')</script>");
            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
        }else {
            int userNo =  Integer.parseInt(session.getAttribute("userNo").toString());
            int productNo = Integer.parseInt(req.getParameter("id"));
            String url = req.getParameter("url");
            int count = Integer.parseInt(req.getParameter("count"));

            if (url.equals("S")){
                int state = 0;
                try {
                    state = dao.addintoCart(userNo,productNo,count);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (state == 1){
                    out.println("<script language='javascript'>alert('Product added successfully.')</script>");
                    out.println("<script language='javascript'>window.location.href='./proDetail.jsp'</script>");
                }else {
                    out.println("<script language='javascript'>alert('The product is already in the shopping cart.')</script>");
                    out.println("<script language='javascript'>window.location.href='./proDetail.jsp'</script>");
                }
            }else if (url.equals("T")){

                try {
                    dao.addintoCart(userNo,productNo,count);
                } catch (Exception e) {
                    e.printStackTrace();
                }

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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

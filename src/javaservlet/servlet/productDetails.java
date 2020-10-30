package javaservlet.servlet;

import javaservlet.dao.impl.ProductDAOImpl;
import javaservlet.vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class productDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println("what");
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        ProductDAOImpl impl = new ProductDAOImpl();
        ArrayList<Product> products = impl.getProductsByID(id);
        ArrayList<String> urls = impl.getProductDetails(products.get(0).getName());
        session.setAttribute("urls",urls);
        session.setAttribute("flag1", "1");
        session.setAttribute("id",id);
        session.setAttribute("products", products);
        resp.sendRedirect("./proDetail.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("what..");
    }
}

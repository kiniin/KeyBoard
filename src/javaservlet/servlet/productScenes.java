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

public class productScenes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        ProductDAOImpl impl = new ProductDAOImpl();
        ArrayList<Product> products =  impl.getProductsByScene(type);
        HttpSession session = req.getSession();
        session.setAttribute("products",products);
        session.setAttribute("scene", type);
        resp.sendRedirect("./scenes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

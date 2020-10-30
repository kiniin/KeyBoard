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

public class productView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ProductDAOImpl impl = new ProductDAOImpl();

        ArrayList<Product> products1 = impl.getProductsInfo(0,3);
        ArrayList<Product> products2 = impl.getProductsInfo(3,3);
        ArrayList<Product> products3 = impl.getProductsInfo(6,4);
        ArrayList<Product> products4 = impl.getProductsInfo(10,4);
        ArrayList<Product> products5 = impl.getProductsInfo(14,4);

        ArrayList<ArrayList<Product>> productsList2 = new ArrayList<>();
        ArrayList<ArrayList<Product>> productsList1 = new ArrayList<>();
        productsList1.add(products1);
        productsList1.add(products2);
        productsList2.add(products3);
        productsList2.add(products4);
        productsList2.add(products5);
        session.setAttribute("productsList2", productsList2);
        session.setAttribute("productsList1", productsList1);
        session.setAttribute("products1",products1);
        session.setAttribute("flag", "1");
        resp.sendRedirect("./index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

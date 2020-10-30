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

public class productSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();


        String query = req.getParameter("query");
        System.out.println(query);
        if (query==null||query.equals("")){
            resp.sendRedirect("./index.jsp");
            return;
        }
        ProductDAOImpl impl = new ProductDAOImpl();
        ArrayList<Product> targetProducts = impl.searchProduct(query);

        if(targetProducts!=null)
            for(Product product: targetProducts)
                System.out.println(product.getName());
        assert targetProducts != null;
        String flag="0";
        if (targetProducts.size()==0){
            String errorMessage = "Sorry, we can't find any product satisfying your description.";
            session.setAttribute("errorMessage", errorMessage);

        }
        else {
            session.setAttribute("targetProducts", targetProducts);
            session.setAttribute("query", query);
            flag="1";
        }
        session.setAttribute("flag", flag);
        resp.sendRedirect("./search.jsp");
    }
}

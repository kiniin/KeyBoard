package javaservlet.servlet;

import javaservlet.dao.impl.OrderDAOImpl;
import javaservlet.utils.OrderUtils;
import javaservlet.vo.Address;
import javaservlet.vo.Order;
import javaservlet.vo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;

public class orderView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        System.out.println("111");


        if (session.getAttribute("userNo") == null){
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>alert('Please login first!')</script>");
            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
        }
        else{
            int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
            OrderDAOImpl impl = new OrderDAOImpl(userNo);
            ArrayList<Order> orders = impl.getOrdersByUserNo();
            orders = OrderUtils.compareElem(orders);
//        ArrayList<ArrayList<Product>> productLists ;
            ArrayList<Address> addresses = new ArrayList<>();
            LinkedHashMap<Order,ArrayList<Product>> order_Products = new LinkedHashMap<>();
            SimpleDateFormat ft =
                    new SimpleDateFormat ("yyyy-MM-dd E 'at' hh:mm a", Locale.ENGLISH);
            for(Order order:orders){
                addresses.add(impl.getOrderAddress(order.getOrderNo()));
                ArrayList<Product> products= impl.getProductsByOrder(order.getOrderNo());
                order_Products.put(order, products);
                System.out.println(ft.format(order.getDate()));

            }
            System.out.println("111");
            session.setAttribute("addressOfOrder",addresses);
            session.setAttribute("order_Products",order_Products);
            resp.sendRedirect("./myOrder.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

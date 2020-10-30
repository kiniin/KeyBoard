package javaservlet.servlet;

import javaservlet.dao.impl.CartDAOimpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AlterProInCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        HttpSession session = req.getSession();
        CartDAOimpl cartDAOimpl = new CartDAOimpl();
        int userID = Integer.parseInt(session.getAttribute("userNo").toString());
        int proID = Integer.parseInt(req.getParameter("proID"));
        if( req.getParameter("updown")!=null){
            int up_down = Integer.parseInt(req.getParameter("updown"));

            try {
                cartDAOimpl.changeCartProduct(userID, proID, up_down);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            try {
                cartDAOimpl.removeCartProduct(userID,proID);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

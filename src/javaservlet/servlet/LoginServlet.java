package javaservlet.servlet;

import javaservlet.dao.UserDAO;
import javaservlet.dao.impl.UserDAOimpl;
import javaservlet.vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;


public class LoginServlet extends HttpServlet{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setAccount(req.getParameter("account"));
        user.setPassword(req.getParameter("password"));

        UserDAO dao =  new UserDAOimpl();
        int flag = 0;

        try{
            flag = dao.queryByUsername(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag == 1){
            HashMap<String,String> hashMap = new HashMap<>();
            try {
                hashMap = dao.getUserinfo(user.getAccount());
            } catch (Exception e) {
                e.printStackTrace();
            }
            HttpSession session = req.getSession();
            session.setAttribute("userNo",hashMap.get("userNo"));
            session.setAttribute("account",user.getAccount());
            session.setAttribute("phoneNo",hashMap.get("phoneNo"));
            session.setAttribute("email",hashMap.get("email"));
            session.setAttribute("question",hashMap.get("question"));
            if (hashMap.get("name") != null) session.setAttribute("name",hashMap.get("name"));
            if (hashMap.get("DoB") != null) session.setAttribute("DoB",hashMap.get("DoB"));
            if (hashMap.get("gender") != null) session.setAttribute("gender",hashMap.get("gender"));
            if (hashMap.get("nickName") != null) session.setAttribute("nickName",hashMap.get("nickName"));

            resp.sendRedirect("./index.jsp");
        } else {
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>alert('Username or password is wrong, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
        }
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

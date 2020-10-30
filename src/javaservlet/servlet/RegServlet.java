package javaservlet.servlet;

import javaservlet.dao.RegDAO;
import javaservlet.dao.impl.RegDAOimpl;
import javaservlet.vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RegServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        PrintWriter out = resp.getWriter();
        RegDAO reg = new RegDAOimpl();
        int flag = 1;

        if (req.getParameter("account").equals("") || req.getParameter("password").equals("") ||
                req.getParameter("password2").equals("") || req.getParameter("email").equals("") ||
                req.getParameter("phoneNo").equals("") || req.getParameter("question").equals("") ||
                req.getParameter("answer").equals("")){
            out.println("<script language='javascript'>alert('Input can not be empty, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
            flag = 0;
        }

        try {
            int valid = reg.queryAccount(req.getParameter("account"));
            if (valid == 0){
                out.println("<script language='javascript'>alert('Account has been registered!')</script>");
                out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
                flag = 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (req.getParameter("password").equals(req.getParameter("password2")));
        else {
            out.println("<script language='javascript'>alert('Two passwords are different, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
            flag = 0;
        }

        String email = "\\w+@\\w+(\\.\\w{2,3})*\\.\\w{2,3}";
        if (req.getParameter("email").matches(email));
        else {
            out.println("<script language='javascript'>alert('Email address is illegal, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
            flag = 0;
        }

        if (req.getParameter("phoneNo").length() == 11);
        else {
            out.println("<script language='javascript'>alert('Illegal phone number input, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
            flag = 0;
        }

        if (flag == 1){
            user.setAccount(req.getParameter("account"));
            user.setPassword(req.getParameter("password"));
            user.setEmail(req.getParameter("email"));
            user.setPhoneNo(req.getParameter("phoneNo"));
            user.setQuestion(req.getParameter("question"));
            user.setAnswer(req.getParameter("answer"));

            int state = 0;
            int state2 = 0;

            try{
                state = reg.CreateUserinfo(user);
                int userNo = reg.queryUserNo(user.getAccount());
                state2 = reg.CreateDetailed(userNo);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (state == 1 && state2 == 1){
                out.println("<script language='javascript'>alert('Registration success')</script>");
                out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
            }else {
                out.println("<script language='javascript'>alert('Registration failed')</script>");
                out.println("<script language='javascript'>window.location.href='./reg.jsp'</script>");
            }
        }

    }
}

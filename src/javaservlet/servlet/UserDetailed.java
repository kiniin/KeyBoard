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

public class UserDetailed extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        PrintWriter out = resp.getWriter();
        UserDAO dao = new UserDAOimpl();
        HttpSession session = req.getSession();
        user.setUserNo( Integer.parseInt(session.getAttribute("userNo").toString()));
        int flag = 1;

        if (req.getParameter("name").equals("") || req.getParameter("nickName").equals("") ||
        req.getParameter("birthday").equals("")){
            out.println("<script language='javascript'>alert('Input can not be empty, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./mygrxx.jsp'</script>");
            flag = 0;
        }

        String birthday = "\\d{4}-\\d{2}-\\d{2}";
        if (req.getParameter("birthday").matches(birthday));
        else {
            out.println("<script language='javascript'>alert('Birthday is illegal, please re-enter!')</script>");
            out.println("<script language='javascript'>window.location.href='./mygrxx.jsp'</script>");
            flag = 0;
        }

        int gender = Integer.parseInt(req.getParameter("gender"));

        if (flag==1){
            user.setName(req.getParameter("name"));
            user.setNickName(req.getParameter("nickName"));
            user.setDoB(req.getParameter("birthday"));
            if (gender == 0) user.setGender("Male");
            if (gender == 1) user.setGender("Female");

            int state = 0;
            try {
                state = dao.ChangeDetailed(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (state == 1){
                out.println("<script language='javascript'>alert('Update success')</script>");
                session.setAttribute("name",user.getName());
                session.setAttribute("nickName",user.getNickName());
                session.setAttribute("DoB",user.getDoB());
                session.setAttribute("gender",user.getGender());
                out.println("<script language='javascript'>window.location.href='./mygrxx.jsp'</script>");
            }else if (state == 0){
                out.println("<script language='javascript'>alert('Update failed')</script>");
                out.println("<script language='javascript'>window.location.href='./mygrxx.jsp'</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

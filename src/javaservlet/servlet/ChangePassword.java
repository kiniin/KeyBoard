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

public class ChangePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int flag = 0;
        HttpSession session = req.getSession();
        if (session.getAttribute("account") == null){
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>alert('Please login first!')</script>");
            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
        }else {
            String method = req.getParameter("method");
            User user = new User();
            user.setAccount(session.getAttribute("account").toString());
            UserDAO dao = new UserDAOimpl();
            if (method.equals("0")){
                String oldPassword = req.getParameter("oldPassword");
                String newPassword = req.getParameter("newPassword");
                String newPassword2 = req.getParameter("newPassword2");
                if (oldPassword.equals("") || newPassword.equals("") || newPassword2.equals("")){
                    PrintWriter out = resp.getWriter();
                    out.println("<script language='javascript'>alert('Input can not be empty, please re-enter!')</script>");
                    out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                }else {
                    user.setPassword(oldPassword);
                    try {
                        flag = dao.queryByUsername(user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (flag == 0){
                        PrintWriter out = resp.getWriter();
                        out.println("<script language='javascript'>alert('The original password is incorrect, password cannot be updated!')</script>");
                        out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                    }else if (flag == 1){
                        if (newPassword.equals(newPassword2)){
                            int valid = 0;
                            user.setPassword(newPassword);
                            try {
                                valid = dao.ChangePassword(user);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            if (valid == 1){
                                PrintWriter out = resp.getWriter();
                                out.println("<script language='javascript'>alert('Succeeded!Please login again.')</script>");
                                session.removeAttribute("account");
                                out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
                            }else {
                                PrintWriter out = resp.getWriter();
                                out.println("<script language='javascript'>alert('Failed!')</script>");
                                out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
                            }
                        }else {
                            PrintWriter out = resp.getWriter();
                            out.println("<script language='javascript'>alert('Two passwords are different, please re-enter!')</script>");
                            out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                        }
                    }
                }
            }else if (method.equals("1")){
                String answer = req.getParameter("answer");
                String newPassword = req.getParameter("newPassword");
                String newPassword2 = req.getParameter("newPassword2");
                if (answer.equals("") || newPassword.equals("") || newPassword2.equals("")){
                    PrintWriter out = resp.getWriter();
                    out.println("<script language='javascript'>alert('Input can not be empty, please re-enter!')</script>");
                    out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                }else {
                    user.setAnswer(answer);
                    try {
                        flag = dao.checkByQuestion(user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (flag == 0){
                    PrintWriter out = resp.getWriter();
                    out.println("<script language='javascript'>alert('The answer is incorrect, password cannot be updated!')</script>");
                    out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                }else if (flag == 1){
                    if (newPassword.equals(newPassword2)){
                        int valid = 0;
                        user.setPassword(newPassword);
                        try {
                            valid = dao.ChangePassword(user);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (valid == 1){
                            PrintWriter out = resp.getWriter();
                            out.println("<script language='javascript'>alert('Succeeded!Please login again.')</script>");
                            session.removeAttribute("account");
                            out.println("<script language='javascript'>window.location.href='./login.jsp'</script>");
                        }else {
                            PrintWriter out = resp.getWriter();
                            out.println("<script language='javascript'>alert('Failed!')</script>");
                            out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                        }
                    }else {
                        PrintWriter out = resp.getWriter();
                        out.println("<script language='javascript'>alert('Two passwords are different, please re-enter!')</script>");
                        out.println("<script language='javascript'>window.location.href='./remina.jsp'</script>");
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

package com.servlet;

import com.bean.Connect;
import java.util.*;
import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
        response.setCharacterEncoding("UTF-8");
        response.setHeader("content-type","text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        Connect con = new Connect();
        String username = request.getParameter("username");
        String passwd = request.getParameter("password");
        boolean flag = con.isuser(username,passwd);
        if(flag)
        {
            String permission =con.getPermission(username);
            session.setAttribute("permission",permission);
            session.setAttribute("username",username);
            response.getWriter().println("<script>confir" +
                    "m('welcome，"+permission+"');\n" +
                    "window.location.href='index.jsp';</script>");
            if(Objects.equals(permission,"error"))
            {
                response.getWriter().println("设置权限时出现未知错误");
            }
        }
        else
        {
            response.getWriter().println("<script>confirm('用户名或密码错误');\n" +
                    "window.location.href='login.jsp';</script>");
        }
    }
}
package com.servlet;

import com.bean.Connect;

import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Add_user")
public class Add_user extends HttpServlet {
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
            response.getWriter().println("该用户已存在");
        }
        else
        {
            String s = "INSERT INTO users (ID,passwd) VALUES ('"+username+"',md5('"+passwd+"'))";
            boolean result = con.exec(s);
            if(result){
                response.getWriter().println("添加用户成功");
            }
            else {
                response.getWriter().println("添加用户失败");
            }
        }
    }
}

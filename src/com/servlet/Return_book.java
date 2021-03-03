package com.servlet;

import com.bean.Connect;

import java.io.*;
import java.lang.*;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Return_book")
public class Return_book extends HttpServlet {
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
        String book_name = request.getParameter("book_name");
        String username = (String) session.getAttribute("username");
        Connect con = new Connect();
        try {
            int flag = 0;
            String s2 = "update books set book_number = (book_number+1) where book_name = "+book_name+";";
            String s3 ="update users SET book_return_time=curdate() where users.ID="+username+";";
            con.execupdate(s2);
            flag = con.execupdate(s3);
            if(flag==0) {
                response.getWriter().println("还书失败");
            }
            else {
                response.getWriter().println("还书成功");
            }
        }
        catch (Exception e)
        {
            response.getWriter().println("没有找到这本书");
        }
    }
}

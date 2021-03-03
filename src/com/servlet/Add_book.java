package com.servlet;

import com.bean.Connect;

import java.io.*;
import java.lang.*;
import java.sql.ResultSet;
import java.util.Objects;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Add_book")//在servlet3.0以后，我们可以不用再web.xml里面配置servlet，只需要加上@WebServlet注解就可以修改该servlet的属性了。
public class Add_book extends HttpServlet {
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
        response.setHeader("content-type","text/html;charset=UTF-8");//设置编码为UTF8，否则servlet会乱码
        HttpSession session = request.getSession(true);
        Connect con = new Connect();
        String book_name = request.getParameter("book_name");
        String book_number = request.getParameter("book_number");
        int number = Integer.parseInt(book_number);
        String s = "insert into books(book_name,book_number) values ('"+book_name+"',"+number+");";
        boolean flag = con.exec(s);
        if(flag)
        {
            response.getWriter().println("添加成功");
        }
        else{
            response.getWriter().println("添加失败");
        }
    }
}

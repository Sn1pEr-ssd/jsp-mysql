package com.servlet;

import com.bean.Connect;

import java.io.*;
import java.lang.*;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Borrow")
public class borrow extends HttpServlet {
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
        String username = request.getParameter("username");
        String book_name = request.getParameter("book_name");
        String day_time = request.getParameter("day_time");
        int time = Integer.parseInt(day_time);
        Connect con = new Connect();
        String s1 = "select book_number from books where book_name='"+book_name+"';";//查询书籍数量，为0则不能添加
        boolean result = con.exec(s1);
        try {
            if (!result){
                response.getWriter().println("该书没有存货了");
            }
            else{
                int flag = 0;
                String s2 = "update books set book_number = IF(book_number < 1, 0, book_number -1) where name = '"+book_name+"';";//书籍数量减一
                String s3 = "update users SET book_name='"+book_name+"',book_start_time=curdate(),book_end_time=(SELECT DATE_ADD(curdate(),INTERVAL "+day_time+" DAY)) where users.ID="+username+";";
                con.execupdate(s2);
                flag = con.execupdate(s3);
                if(flag==0) {
                    response.getWriter().println("添加失败");
                }
                else {
                    response.getWriter().println("添加成功");
                }
            }
        }
        catch (Exception e)
        {
            response.getWriter().println("没有找到这本书");
        }
    }
}

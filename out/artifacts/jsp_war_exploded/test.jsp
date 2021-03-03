<%@ page import="java.io.*,java.util.*,java.lang.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Connect"%>
<%--<jsp:include page="top.jsp"></jsp:include>--%>
<%
    String username = (String) session.getAttribute("username");
    ResultSet rs = null;
    Connect con = new Connect();
    String s = "select book_name,book_start_time,book_end_time,book_return_time from users where users.ID="+username+";";
    rs = con.execquary(s);
    try {
        while(rs.next()){
            out.println(rs.getString(1));
            out.println(rs.getString(2));
            out.println(rs.getString(3));
            out.println(rs.getString(4));
        }
        con.close();
    }
    catch (Exception e){
        out.println("没有查询到该用户数据");
    }
%>
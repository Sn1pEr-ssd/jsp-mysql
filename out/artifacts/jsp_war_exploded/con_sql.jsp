<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.lang.*" %>
<%
    Connection conn=null;
    Statement smt=null;
    ResultSet rs=null;    String username="root";
    String passwd="root";
    String url="jdbc:mysql://localhost:3306/test?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url,username,passwd);
        smt=conn.createStatement();
        String sql="select * from websites";
        rs=smt.executeQuery(sql);
        out.println("<table bgcolor=\"#9999dd\" border=\"1\" width=\"300\">\n" +
                "    <tr>\n" +
                "        <th>id:</th>\n" +
                "        <th>name:</th>\n" +
                "        <th>url:</th>\n" +
                "    </tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.print("<td>" + rs.getString(1) + "</td>");
            out.print("<td>" + rs.getString(2) + "</td>");
            out.print("<td>" + rs.getString(3) + "</td>");
            out.println("</tr>");
        }
    }
    catch (Exception e){
        e.printStackTrace();
    }
    finally {
        if(rs!=null)
        {
            rs.close();
        }
        if(conn!=null)
        {
            conn.close();
        }
        if(smt!=null)
        {
            smt.close();
        }
    }
%>
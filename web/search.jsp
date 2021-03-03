<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.lang.*,java.sql.*,com.bean.Connect" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>查询借书情况</title>
</head>
<body>
<%
String permission = (String) session.getAttribute("permission");
String username = (String) session.getAttribute("username");
if(!Objects.equals("admin",permission))//不同权限有不同的功能
{
    ResultSet rs = null;
    Connect con = new Connect();
    String s = "select book_name,book_start_time,book_end_time,book_return_time from users where users.ID="+username+";";
    rs = con.execquary(s);
    try {
        while(rs.next()){
            out.println("<br><a>书名："+rs.getString(1)+"</a>");
            out.println("<br><a>借书时间："+rs.getString(2)+"</a>");
            out.println("<br><a>预计还书时间："+rs.getString(3)+"</a>");
            out.println("<br><a>还书时间："+rs.getString(4)+"</a>");
        }
        con.close();
    }
    catch (Exception e){
        out.println("没有查询到该用户数据");
    }
}
else
    {
        out.println("<form action=\"\" method=\"POST\">\n" +
                "    <a>请输入你要查看的学生ID</a>\n" +
                "    <br>\n" +
                "    <a>一卡通号:</a>\n" +
                "    <br>\n" +
                "    <input type=\"text\" name=\"search_name\"/>\n" +
                "    <br>\n" +
                "    <input type=\"submit\" value=\"submit\"/>\n" +
                "</form>");
        String search_name = request.getParameter("search_name");
        ResultSet rs = null;
        Connect con = new Connect();
        String s ="select ID,book_name,book_start_time,book_end_time,book_return_time from users where users.ID="+search_name+";";
        rs = con.execquary(s);
        try {
            while(rs.next()){
                out.println("<br><a>ID:"+rs.getString(1)+"</a>");
                out.println("<br><a>书名："+rs.getString(2)+"</a>");
                out.println("<br><a>借书时间："+rs.getString(3)+"</a>");
                out.println("<br><a>预计还书时间："+rs.getString(4)+"</a>");
                out.println("<br><a>还书时间："+rs.getString(5)+"</a>");
            }
            con.close();
        }
        catch (Exception e){
            out.println("没有查询到该用户数据");
        }
    }
%>
</body>
</html>

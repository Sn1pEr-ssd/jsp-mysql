<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: #111;
        }
    </style>
</head>
<body>
<%
    String permission = (String)session.getAttribute("permission");
    if(Objects.equals(permission,"admin")) {
        out.println("<ul>\n" +
                "    <li><a href=\"search.jsp\">查看借书数据</a></li>\n"+
                "    <li><a href=\"Add_book.jsp\">添加书籍</a></li>\n" +
                "    <li><a href=\"add_user.jsp\">添加用户</a></li>\n" +
                "    <li><a href=\"borrow.jsp\">借阅图书</a></li>\n" +
                "    <li><a href=\"return.jsp\">归还图书</a></li>\n" +
                "    <li><a href=\"#\" onclick=exit()>退出登陆</a></li>\n" +
                "</ul>");
    }
    else if (Objects.equals(permission,"user")){
        out.println("<ul>\n" +
    "    <li><a href=\"search.jsp\">我的借书</a></li>\n" +
    "    <li><a href=\"#\" onclick=exit()>退出登陆</a></li>\n" +
    "</ul>");
    }
    else {
        out.println("<script>confirm('你还没有登陆，请登陆。');\n" +
                "window.location.href='login.jsp';</script>");
    }
%>
<script>
    function exit()
    {
        var is_exit = confirm("确定要退出吗？");
        if(is_exit==true)
        {
            window.location.href='login.jsp';
        }
    }
</script>
</body>
</html>

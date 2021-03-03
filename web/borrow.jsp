<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="identity.jsp"></jsp:include>
<%@ page import="java.io.*,java.util.*,java.lang.*,java.sql.*,com.bean.Connect" %>
<html>
<head>
    <title>书籍借阅</title>
</head>
<body>
<form action="Borrow" method="post">
    <a>请输入借书人的ID、要借的书和借的天数</a>
    <br>
    <a>ID：</a><input type="text" name="username"/>
    <br>
    <a>书名：</a><input type="text" name="book_name"/>
    <br>
    <input type="number" name="day_time"/><a>天</a>
    <br>
    <input type="submit" value="submit"/>
</form>
</body>
</html>

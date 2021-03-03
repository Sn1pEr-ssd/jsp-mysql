<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.lang.*,java.sql.*,com.bean.Connect" %>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="identity.jsp"></jsp:include>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<form action="Add_user" method="POST">
    <a>请输入添加的一卡通号和密码</a>
    <br>
    <a>一卡通号:</a>
    <br>
    <input type="text" name="username"/>
    <br>
    <a>密码:</a>
    <br>
    <input type="text" name="password"/>
    <br>
    <input type="submit" value="submit"/>
</form>
</body>
</html>
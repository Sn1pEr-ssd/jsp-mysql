<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.lang.*,java.sql.*,com.bean.Connect" %>
<html>
<head>
    <title>登陆</title>
</head>
<body>
<form action="Login" method="POST">
    <a>请输入你的一卡通号和密码</a>
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
<%
    session.removeAttribute("permission");//清除上一次会话
    session.removeAttribute("username");
%>

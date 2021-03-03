<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="identity.jsp"></jsp:include>
<html>
<head>
    <title>图书归还</title>
</head>
<body>
<form action="Return_book" method="post">
    <a>请输入你要还的书</a>
    <br>
    <a>书名：</a>
    <br>
    <input type="text" name="book_name"/>
    <br>
    <input type="submit" value="submit"/>
</form>
</body>
</html>

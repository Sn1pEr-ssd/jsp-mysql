<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="identity.jsp"></jsp:include>
<html>
<head>
    <title>添加书籍</title>
</head>
<body>
<form action="Add_book" method="POST">
    <a>请输入添加的书籍名和数量</a>
    <br>
    <a>书籍名:</a>
    <input type="text" name="book_name"/>
    <br>
    <a>数量:</a>
    <input type="number" name="book_number"/>
    <br>
    <input type="submit" value="submit"/>
</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% String name = (String)session.getAttribute("permission");
if(Objects.equals("admin",name)) {
}
else
    {
        out.println("<script>confirm('你不是管理员，无权访问。');\n" +
                "window.location.href='login.jsp';</script>");
    }
%>
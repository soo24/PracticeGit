<%--
  Created by IntelliJ IDEA.
  User: ahngilung
  Date: 2022/11/18
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<%
    session.removeAttribute("UserId");
    session.removeAttribute("userName");
    session.invalidate();
    response.sendRedirect("LoginForm.jsp");
%>
</body>
</html>
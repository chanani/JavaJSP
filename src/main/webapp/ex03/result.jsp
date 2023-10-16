<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${empty param.userID}">
    아이디를 입력하세요.
    <a href="login.jsp">로그인 창</a>
</c:if>
<c:if test="${not empty param.userID}">
    <h1>환영합니다. <c:out value="${param.userID}"/>님^^</h1>
</c:if>
</body>
</html>

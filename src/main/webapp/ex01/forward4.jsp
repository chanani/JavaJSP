<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
    request.setAttribute("id", "hong");
    request.setAttribute("pwd", "1234");
    session.setAttribute("name", "차나니");
    application.setAttribute("email", "bb@bb.bb");
    request.setAttribute("address", "서울시 관악구");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:forward page="member04.jsp"/>
</body>
</html>

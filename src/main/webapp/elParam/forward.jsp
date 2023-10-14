<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    request.setAttribute("address", "서울시 관악구");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:forward page="member2.jsp"></jsp:forward>
</body>
</html>

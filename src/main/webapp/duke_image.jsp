<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String imgName = request.getParameter("imgName");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <br>
    <br>
    <h1>이름은 <%=name%>입니다.</h1><br><br>
    <img src="./image/<%=imgName%>" alt=""/>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>출력할 구구단의 수</h1>
  <form action="guguResult1.jsp">
    출력할 구구단 : <input type="text" name="dan"/><br>
    <input type="submit" value="구구단 출력">
  </form>

</body>
</html>

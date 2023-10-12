<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 11:53 PM
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
    <h1>쇼핑물의 시작 JSP !!!</h1>
    <br>
    <jsp:include page="duke_image.jsp" flush="true">
        <jsp:param name="name" value="농담곰2"/>
        <jsp:param name="imgName" value="qwe.png"/>
    </jsp:include>
    <h1>쇼핑몰의 시작 끝부분 !!!</h1>
</body>
</html>

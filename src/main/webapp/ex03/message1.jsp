<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <fmt:setLocale value="en_US"/>
    <h1>
        회원정보<br><br>
        <fmt:bundle basename="resources.member">
            이름 : <fmt:message key="mem.name"/> <br>
            주소 : <fmt:message key="mem.address"/> <br>
            직업 : <fmt:message key="mem.job"/> <br>
        </fmt:bundle>
    </h1>
</body>
</html>

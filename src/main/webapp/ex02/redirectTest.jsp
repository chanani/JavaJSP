<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
  <title>Title</title>
</head>
<body>
<c:redirect url="member01.jsp">
  <c:param name="id" value="hong"/>
  <c:param name="pwd" value="1541"/>
  <c:param name="name" value="홍길길"/>
  <c:param name="email" value="asd@aa.aa"/>
</c:redirect>

</body>
</html>

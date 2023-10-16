<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.Date" %>
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
<h2>fmt의 number 태그를 이용한 숫자 포맷팅 예제.</h2>
<c:set var="price" value="1000000"/>
<fmt:formatNumber value="${price}" type="number" var="priceNumber"/>
통화로 표시 :
<fmt:formatNumber type="currency" currencySymbol="$" value="${price}"
        groupingUsed="true" /><br>
퍼센트로 표시 :
<fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/><br>
일반 숫자로 표현시 : ${priceNumber}<br>

<h2>formatDate</h2>
<c:set var="now" value="<%=new Date()%>"/>
<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br>
<fmt:formatDate value="${now}" type="date" dateStyle="short"/><br>
<fmt:formatDate value="${now}" type="date" /><br>
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
<fmt:formatDate value="${now}" pattern="YYYY-MM-dd :hh:mm:ss"/><br>

<br><br>
한국 현재 시간 :
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br><br>

<fmt:timeZone value="America/New York">
    뉴욕 현재 시간 :
    <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>


</body>
</html>

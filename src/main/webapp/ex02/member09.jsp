<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<c:set var="id" value="hong" scope="page" />
<c:set var="pwd" value="1234" scope="page" />
<c:set var="name" value="${'홍길동'}" scope="page" />
<c:set var="age" value="${22}" scope="page" />
<c:set var="height" value="${177}" scope="page" />
<html>
<head>
    <title>Title</title>
</head>
<body>

<table align="center" width="100%">
    <tr align="center" bgcolor="#7fffd4">
        <td width="20%">아이디</td>
        <td width="20%">비밀번호</td>
        <td width="20%">이름</td>
        <td width="20%">이메일</td>


    </tr>
    <c:choose>
        <c:when test="${empty name}">
            <tr align="center">
                <td colspan="5">이름을 입력해주세요.</td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr align="center">
                <td><c:out value="${param.id}"/></td>
                <td><c:out value="${param.pwd}"/></td>
                <td><c:out value="${param.name}"/></td>
                <td><c:out value="${param.email}"/></td>
            </tr>
        </c:otherwise>
    </c:choose>


</table>


</body>
</html>

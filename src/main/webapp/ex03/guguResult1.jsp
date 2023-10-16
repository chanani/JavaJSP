<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var="dan" value="${param.dan}"/>
    <table border="1" width="800" align="center">
        <tr align="center" bgcolor="#d2691e">
            <td colspan="2">
                <c:out value="${dan}" />단 출력
            </td>
        </tr>
        <c:forEach var="i" begin="1" end="9" step="1">
            <tr align="center">
                <td width="400">
                    <c:out value="${dan}"/> *
                    <c:out value="${i}"/>
                </td>
                <td width="400">
                    <c:out value="${dan * i}"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

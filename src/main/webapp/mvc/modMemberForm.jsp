<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/18
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${contextPath}/member/modMember.do?id=${memInfo.id}" method="post">
    <h1 style="text-align: center">회원가입창</h1>
    <table align="center">
        <tr>
            <td width="200">
                <p align="right">아이디</p>
            </td>
            <td width="400">
                <input type="text" name="id" value="${memInfo.id}">
            </td>

            <td width="200">
                <p align="right">비밀번호</p>
            </td>
            <td width="400">
                <input type="password" name="pwd" value="${memInfo.pwd}">
            </td>

            <td width="200">
                <p align="right">이름</p>
            </td>
            <td width="400">
                <input type="text" name="name" value="${memInfo.name}">
            </td>

            <td width="200">
                <p align="right">이메일</p>
            </td>
            <td width="400">
                <input type="text" name="email" value="${memInfo.email}">
            </td>
            <td width="200">
                <p align="right">가입일</p>
            </td>
            <td width="400">
                <input type="text" name="email" value="${memInfo.joinDate}" disabled>
            </td>
        </tr>

        <td width="200">
            <p align="right">&nbsp</p>
        </td>
        <td width="400">
            <input type="submit" value="수정하기">
            <input type="reset" value="다시입력">
        </td>
    </table>
</form>
</body>
</html>

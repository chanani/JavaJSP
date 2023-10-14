<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    session.setAttribute("address", "천안시 서북구");
%>
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
        <td width="20%">주소</td>

    </tr>

    <tr align="center">
        <td>${id}</td>
        <td>${pwd}</td>
        <td>${name}</td>
        <td>${email}</td>
        <td>${address}</td>
    </tr>

</table>

</body>
</html>

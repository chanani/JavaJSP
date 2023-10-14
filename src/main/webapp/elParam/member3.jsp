
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="ex02.MemberBean"/>
<jsp:setProperty name="m" property="*"/>
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

    <tr align="center">
        <td>${m.id} </td>
        <td>${m.pwd} </td>
        <td>${m.name} </td>
        <td>${m.email} </td>
    </tr>
</table>
</body>
</html>

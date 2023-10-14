<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pwd");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
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
        </tr>

        <tr align="center">
            <td><%= id%> </td>
            <td><%= pw%> </td>
            <td><%= name%> </td>
            <td><%= email%></td>
        </tr>

        <tr align="center">
            <td>${param.id} </td>
            <td>${param.pwd} </td>
            <td>${param.name} </td>
            <td>${param.email} </td>
        </tr>
    </table>
</body>
</html>

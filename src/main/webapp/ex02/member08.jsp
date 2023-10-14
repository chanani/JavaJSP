<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="ex02.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    List memberList = new ArrayList<>();
    MemberBean m1 = new MemberBean("son", "1234", "손흥민", "son@naver.com");
    MemberBean m2 = new MemberBean("ki", "4321", "기성용", "ki@naver.com");
    MemberBean m3 = new MemberBean("park", "1212", "박지성", "park@naver.com");
    memberList.add(m1);
    memberList.add(m2);
    memberList.add(m3);
%>
<c:set var="memberList" value="<%=memberList%>"/>

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
        <td width="20%">나이</td>
    </tr>
    <c:forEach var="member" items="${memberList}">
        <tr align="center">
            <td>${member.id}</td>
            <td>${member.pwd}</td>
            <td>${member.name}</td>
            <td>${member.email}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

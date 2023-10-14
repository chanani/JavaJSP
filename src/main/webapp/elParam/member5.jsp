<%@ page import="ex02.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m1" class="ex02.MemberBean"/>
<jsp:setProperty name="m1" property="*"/>
<jsp:useBean id="memberList" class="java.util.ArrayList"/>
<jsp:useBean id="membersMap" class="java.util.HashMap"/>
<%
    membersMap.put("id", "park");
    membersMap.put("pwd", "4321");
    membersMap.put("name", "박지성");
    membersMap.put("email", "park@naver.com");
    MemberBean m2 = new MemberBean("son", "1234", "손흥민", "son@aa.aaa");
    memberList.add(m1);
    memberList.add(m2);
    membersMap.put("memberList", memberList);
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
        <td>${membersMap.id} </td>
        <td>${membersMap.pwd} </td>
        <td>${membersMap.name} </td>
        <td>${membersMap.email} </td>
    </tr>
    <tr align="center">
        <td>${membersMap.memberList[0].id} </td>
        <td>${membersMap.memberList[0].pwd} </td>
        <td>${membersMap.memberList[0].name} </td>
        <td>${membersMap.memberList[0].email} </td>
    </tr>
    <tr align="center">
        <td>${membersMap.memberList[1].id} </td>
        <td>${membersMap.memberList[1].pwd} </td>
        <td>${membersMap.memberList[1].name} </td>
        <td>${membersMap.memberList[1].email} </td>
    </tr>
</table>

</body>
</html>

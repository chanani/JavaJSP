<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="ex02.MemberBean"/>
<jsp:setProperty name="m" property="*"/>
<jsp:useBean id="addr" class="ex02.Address"/>
<jsp:setProperty name="addr" property="city" value="서울" />
<jsp:setProperty name="addr" property="zipcode" value="07123" />
<%
    m.setAddr(addr);
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<table align="center" width="100%">
    <tr align="center" bgcolor="#7fffd4">
        <td width="7%">아이디</td>
        <td width="7%">비밀번호</td>
        <td width="5%">이름</td>
        <td width="5%">이메일</td>
        <td width="5%">도시</td>
        <td width="5%">우편번호</td>
    </tr>
    <tr align="center">
        <td>${m.id} </td>
        <td>${m.pwd} </td>
        <td>${m.name} </td>
        <td>${m.email} </td>
        <td><%=m.getAddr().getCity()%> </td>
        <td><%=m.getAddr().getZipcode()%> </td>
    </tr>
    <tr align="center">
        <td>${m.id} </td>
        <td>${m.pwd} </td>
        <td>${m.name} </td>
        <td>${m.email} </td>
        <td>${m.addr.city} </td>
        <td>${m.addr.zipcode} </td>
    </tr>

</table>

</body>
</html>

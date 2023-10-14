<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/13
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="ex02" %>
<%@ page import="ex02.MemberBean" %>
<%@ page import="ex02.MemberDAO" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="ex02.MemberBean" scope="page"/>
<jsp:setProperty name="m" property="*"/>
<%
    MemberDAO dao = new MemberDAO();
    dao.addMember(m);
    List list = dao.listMembers();
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
        <td width="11%">이메일</td>
        <td width="5%">가입일</td>
    </tr>

    <%
        if(list.size() == 0){
    %>
    <tr>
        <td colspan="5">
            <p align="center">
                <b><span style="font-size: 9pt;">등록된 회원이 없습니다.</span></b>
            </p>
        </td>
    </tr>
    <%
    } else {
        for (int i = 0; i < list.size(); i++) {
            MemberBean bean = (MemberBean) list.get(i);
    %>
    <tr align="center">
        <td>
            <%= bean.getId()%>
        </td>
        <td>
            <%= bean.getPwd()%>
        </td>
        <td>
            <%= bean.getName()%>
        </td>
        <td>
            <%= bean.getEmail()%>
        </td>
        <td>
            <%= bean.getJoinDate()%>
        </td>
    </tr>


    <%
            }
        }
    %>
    <tr height="1" bgcolor="#008b8b">
        <td colspan="5"></td>
    </tr>
</table>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="ex02.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    MemberBean m = new MemberBean(id, pwd, name, email);
    MemberDAO memberDAO = new MemberDAO();
    memberDAO.addMember(m);
    List memberList = memberDAO.listMembers();
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
            if(memberList.size() == 0){
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
                for (int i = 0; i < memberList.size(); i++) {
                    MemberBean bean = (MemberBean) memberList.get(i);
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

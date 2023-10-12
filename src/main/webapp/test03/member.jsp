<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    import="java.util.*"
    import="ex01.*"%>
<%@ page import="ex01.MemberVO" %>
<%@ page import="ex01.MemberDAO" %>

<html>
<head>
    <style>
        h1{
            text-align: center;
        }
    </style>
    <title>Title</title>
</head>
<body>
    <h1>회원 정보 출력</h1>
<%
    request.setCharacterEncoding("utf-8");
    String _name = request.getParameter("name");
    MemberVO vo = new MemberVO();
    vo.setName(_name);
    MemberDAO dao = new MemberDAO();
    List memberList = dao.listMembers(vo);
%>
    <table border="1" width="800" align="center">
        <tr align="center" bgcolor="olive">
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이름</td>
            <td>이메일</td>
            <td>가입일자</td>
        </tr>

        <%
            for (int i = 0; i < memberList.size(); i++) {
                MemberVO vo2 = (MemberVO) memberList.get(i);
                String id = vo2.getId();
                String pwd = vo2.getPwd();
                String name = vo2.getName();
                String email = vo2.getEmail();
                Date joinData = vo2.getJoinDate();
        %>
            <tr>
                <td><%=id%></td>
                <td><%=pwd%></td>
                <td><%=name%></td>
                <td><%=email%></td>
                <td><%=joinData%></td>
            </tr>

        <%
            }
        %>
    </table>


</body>
</html>

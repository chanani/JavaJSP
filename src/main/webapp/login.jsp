<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>아이디를 입력하지 않았습니다. </h1>
    <%
      String msg = request.getParameter("msg");
      if (msg != null){
    %>
    <h4 style="color: red"><%=msg%></h4>
    <%
      }
    %>

  <form action="loginResult.jsp" name="frmLogin" method="post" enctype="utf-8">
    아이디 : <input type="text" name="userID"><br>
    비밀번호 : <input type="password" name="userPW"><br>
    <input type="submit" value="로그인">
    <input type="reset" value="다시 입력">
  </form>

</body>
</html>

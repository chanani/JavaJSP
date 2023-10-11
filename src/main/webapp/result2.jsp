<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%
    request.setCharacterEncoding("utf-8");
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    if(user_id == null || user_id.length() == 0){
  %>
  아이디를 입력하세요. <br>
  <a href="login.html">로그인하기</a>
  <%} else {
  %>
  <h1>환영합니다. <%=user_id%>님 !</h1>
  <%
    }
  %>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 12:02 AM
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
    <%
        String userID = request.getParameter("userID");
        if (userID.length() == 0){
    %>
    <jsp:forward page="login.jsp">
        <jsp:param name="msg" value="아이디를 입력해주세요."/>
    </jsp:forward>
    <%
        }
    %>
    <h1>환영합니다. <%=userID%>님 ~~</h1>
</body>
</html>

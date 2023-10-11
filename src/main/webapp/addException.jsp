<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  =============toString() 내용===============<br>
  <h1><%=exception.toString()%></h1>
  =============getMessage() 내용===============<br>
  <h1><%=exception.getMessage()%></h1>
  =============printStackTrack() 내용===============<br>
  <h1><% exception.printStackTrace(); %></h1>

  <h3>
    숫자만 입력 가능합니다.
    <a href="add.html">다시 하기</a>

  </h3>


</body>
</html>

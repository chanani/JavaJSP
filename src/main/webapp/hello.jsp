<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String name = "듀크";
    public String getName(){return name;}
%>
<% String age = request.getParameter("age"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>hello jsp</h1>
    <h1>안녕하세요 <%=name %>님!!</h1>
    <h1>나이는 <%=age %>살 입니다.</h1>
    <h1>나이 + 10은 <%=Integer.parseInt(age) + 10 %>살입니다.</h1>
</body>
</html>

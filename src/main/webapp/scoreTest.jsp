<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int score = Integer.parseInt(request.getParameter("score"));
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>시험 점수 <%=score%>점</h1>
    <%if(score >= 90) {%>
    <h1>A학점입니다.</h1>
    <%} else if (score >= 80 && score <90){%>
    <h1>B학점입니다.</h1>
    <%} else if (score >= 70 && score <80){%>
    <h1>c학점입니다.</h1>
    <%} else if (score >= 60 && score <70){%>
    <h1>D학점입니다.</h1>
    <%} else {%>
    <h1>F학점입니다.</h1>
    <%}%>
    <br>
    <a href="scoreTest.html">시험 점수 입력</a>
</body>
</html>

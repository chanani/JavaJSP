<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/14
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>표현 언어로 여러 가지 데이터 출력하기</h1>
    <h1>
        \${100} : ${100}<br>
        \${"안녕하세요"} : ${"안녕하세요"} <br>
        \${10 + 1} : ${10 + 1} <br>
        \${"10" + 1} : ${"10" + 1}<br> <%-- 열을 자동으로 숫자로 변환하여 더합니다.--%>

    </h1>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPate}" />
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="member02.jsp" name="frmLogin" method="post" enctype="utf-8">
    아이디 : <input type="text" name="userID"><br>
    비밀번호 : <input type="password" name="userPW"><br>
    <input type="submit" value="로그인">
    <input type="reset" value="다시 입력">
</form>

<a href="${contextPath}/ex02/member02.jsp">회원가입하기</a>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<c:if test="${empty param.userID}">
  아이디를 입력하세요.
  <a href="login.jsp">로그인 창</a>
</c:if>
<c:if test="${not empty param.userID}">
  <c:if test="${param.userID == 'admin'}">
    <h1>관리자로 로그인 했씁니다.</h1>
    <form action="#">
      <input type="button" value="회원정보 수정하기">
      <input type="button" value="회원정보 삭제하기">
    </form>
  </c:if>
  <c:if test="${param.userID != 'admin'}">
  <h1>환영합니다. <c:out value="${param.userID}"/>님^^</h1>
  </c:if>
</c:if>
</body>
</html>

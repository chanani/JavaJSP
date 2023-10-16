<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 11:04 AM
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
  <ul class="lst_type">
    <li>
      <span style="margin-left: 50px">이미지</span>
      <span>이미지 이름</span>
      <span>선택하기</span>
    </li>
    <c:forEach var="i" begin="1" end="9" step="1">
      <li>
        <a href="#" style="margin-left: 50px">
          <img src="../image/asd.png" alt="#">
        </a>
        <a href="#"><strong>이미지 이름 : 농담곰${i}</strong></a>
        <a href="#"><input type="checkbox" name="chk${i}"></a>
      </li>
    </c:forEach>
  </ul>
</body>
</html>

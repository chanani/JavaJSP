<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/19
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1 style="text-align: center">답글쓰기</h1>
  <form action="${contextPath}/board/addReply.do" method="post" name="frmReply">
    <table align="center">
      <tr>
        <td align="right">글쓴이 : ${articleNO}</td>
        <td><input type="text" size="5" value="lee" disabled/></td>
      </tr>
      <tr>
        <td align="right">글제목 : </td>
        <td><input type="text" size="67" maxlength="100" name="title"></td>
      </tr>
      <tr>
        <td align="right" valign="top"><br/>글내용 : </td>
        <td><textarea name="content" cols="65" rows="10" maxlength="4000"></textarea></td>
      </tr>
      <tr>
        <td align="right"></td>
        <td>
          <input type="submit" value="답글 반영하기"/>
          <input type="button" value="취소" onclick="backToList(this.form)">
          <input type="hidden" name="articleNO" value="${aricleNO}">

        </td>
      </tr>
    </table>
  </form>
</body>
</html>

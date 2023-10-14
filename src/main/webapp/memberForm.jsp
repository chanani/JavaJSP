<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

  <form action="elParam/forward.jsp" method="post">
    <h1 style="text-align: center">회원가입 창</h1>
    <table align="center">
      <tr>
        <td width="200">
          <p align="right">아이디</p>
        </td>
        <td width="400">
          <input type="text" name="id">
        </td>
      </tr>
      <tr>
        <td width="200">
          <p align="right">비밀번호</p>
        </td>
        <td width="400">
          <input type="password" name="pwd">
        </td>
      </tr>
      <tr>
        <td width="200">
          <p align="right">이름</p>
        </td>
        <td width="400">
          <input type="text" name="name">
        </td>
      </tr>

      <tr>
        <td width="200">
          <p align="right">이메일</p>
        </td>
        <td width="400">
          <input type="text" name="email">
        </td>
      </tr>

      <tr>
        <td width="200">
          <p align="right">&nbsp</p>
        </td>
        <td width="400">
          <input type="submit" value="가입하기">
          <input type="reset" value="다시입력">
        </td>
      </tr>

    </table>
  </form>

</body>
</html>

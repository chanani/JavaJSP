<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/12
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="loginResult.jsp" name="frmLogin" method="post" enctype="utf-8">
    아이디 : <input type="text" name="userID"><br>
    비밀번호 : <input type="password" name="userPW"><br>
    <input type="submit" value="로그인">
    <input type="reset" value="다시 입력">
</form>

<a href="memberForm.jsp">회원가입하기</a> <%--직접 컨텐스트 이름을 입력해 요청합니다.--%>
<a href="<%=request.getContextPath()%>/elParam/memberForm.jsp">회원가입하기</a> <%--request의 getContextPath() 메서드를 이용해 컨텍스트 이름을 가져옵니다.--%>
<a href="${pageContext.request.contextPath}/elParam/memberForm.jsp">회원가입하기</a>

</body>
</html>

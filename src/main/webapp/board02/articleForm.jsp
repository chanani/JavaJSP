<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/18
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        function backToList(obj){
            obj.action = "${contextPath}/board/listArticles.do"
            obj.submit();
        }
    </script>
</head>
<body>
    <h1 style="text-align: center">새 글 쓰기</h1>
    <form action="${contextPath}/board/addArticle.do" name="articleForm" method="post">
        <table border="0" align="center">
            <tr>
                <td align="right">글 제목 : </td>
                <td colspan="2"><input type="text" size="67" maxlength="500" name="title"/></td>
            </tr>
            <tr>
                <td align="right">글 내용 : </td>
                <td colspan="2"><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
            </tr>

            <tr>
                <td align="center"></td>
                <td colspan="2">
                    <input type="submit" value="글쓰기"/>
                    <input type="button" value="목록보기" onclick="backToList(this.form)">
                </td>
            </tr>
        </table>
    </form>

</body>
</html>

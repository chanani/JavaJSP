<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/18
  Time: 8:16 PM
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
    <style>
        .cls1{
            text-decoration: none;
        }
        .cls2{
            text-align: center;
            font-size: 30px;
        }
    </style>
</head>
<body>

    <table align="center" border="1" width="80%">
        <tr height="10" align="center" bgcolor="#ff7f50">
            <td>글번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>작성일</td>
        </tr>
        <c:choose>
            <c:when test="${articlesList.size() == 0}">
                <tr height="10">
                    <td colspan="4">
                        <p align="center">
                            <b><span style="font-size: 20px">등록된 게시글이 없습니다.</span></b>
                        </p>
                    </td>
                </tr>
            </c:when>
            <c:when test="${articlesList != null}">
                <c:forEach var="article" items="${articlesList}" varStatus="articleNum">
                    <tr align="center">
                        <td width="5%">${articleNum.count}</td>
                        <td width="10%">${article.id}</td>
                        <td width="35%" align="left">
                            <span style="padding-right:30px"></span>
                            <c:choose>
                                <c:when test="${article.level > 1}">
                                    <c:forEach begin="1" end="${article.level}" step="1">
                                        <span style="padding-left: 20px"></span>
                                    </c:forEach>
                                    <span style="font-size: 12px">[답변]</span>
                                    <a class="cls1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="cls1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td width="10%">
                            <fmt:formatDate value="${article.writeDate}"/>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
        <a class="cls1" href="${contextPath}/board/articleForm.do">
            <p class="cls2">글쓰기</p>
        </a>
    </table>

</body>
</html>

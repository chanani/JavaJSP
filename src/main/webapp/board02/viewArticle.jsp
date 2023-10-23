<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/19
  Time: 3:30 PM
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
        #tr_btn_modify {
            display: none;
        }
        #tr_btn{
            display: block;
        }
    </style>
    <script type="text/javascript">
        function fn_enable(obj){
            document.getElementById("i_title").disabled = false;
            document.getElementById("i_content").disabled = false;
            document.getElementById("tr_btn_modify").style.display = "block";
            document.getElementById("tr_btn").style.display = "none";
        }
        function fn_modify_article(obj){
            obj.action = "${contextPath}/board/modArticle.do";
            obj.submit();
        }
        function backToList(obj){
            obj.action = "${contextPath}/board/listArticles.do";
            obj.submit();
        }

        function fn_reply_form(url, parentNO, articleNO){
            var form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", url);
            var parentNOInput = document.createElement("input");
            var articleNOInput = document.createElement("input");

            parentNOInput.setAttribute("type", "hidden");
            parentNOInput.setAttribute("name", "parentNO");
            parentNOInput.setAttribute("value", parentNO);
            articleNOInput.setAttribute("type", "hidden");
            articleNOInput.setAttribute("name", "articleNO");
            articleNOInput.setAttribute("value", articleNO);
            form.appendChild(parentNOInput);
            form.appendChild(articleNOInput);
            document.body.appendChild(form);
            form.submit();
        }

        function fn_remove_article(url, articleNO){
            var form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", url);
            var articleNOInput = document.createElement("input");
            articleNOInput.setAttribute("type", "hidden");
            articleNOInput.setAttribute("name", "articleNO");
            articleNOInput.setAttribute("value", articleNO);
            form.appendChild(articleNOInput);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>
    <form action="${contextPath}" name="frmArticle" method="post">
        <table border="0" align="center">
            <tr>
                <td width="150" align="center" bgcolor="#2f4f4f">
                    글번호
                </td>
                <td>
                    <input type="text" value="${article.articleNO}" disabled />
                    <input type="hidden" name="articleNO" value="${article.articleNO}"/>
                </td>
            </tr>
            <tr>
                <td width="150" align="center" bgcolor="#2f4f4f">
                    작성자 아이디
                </td>
                <td>
                    <input type="text" value="${article.id}" name="id" id="i_id" disabled>
                </td>
            </tr>
            <tr>
                <td width="20%" align="center" bgcolor="#2f4f4f">
                    글제목
                </td>
                <td>
                    <input type="text" value="${article.title}" name="title" id="i_title" disabled>
                </td>
            </tr>
            <tr>
                <td width="20%" align="center" bgcolor="#2f4f4f">
                    글내용
                </td>
                <td>
                    <textarea rows="20" clos="60" name="content" id="i_content" disabled>${article.content}</textarea>
                </td>
            </tr>
            <tr>
                <td width="20%" align="center" bgcolor="#2f4f4f">
                    등록일자
                </td>
                <td>
                    <input type="text" value="<fmt:formatDate value="${article.writeDate}"/>" disabled>
                </td>
            </tr>
            <tr id="tr_btn_modify">
                <td colspan="2" align="center">
                    <input type="button" value="수정반영하기" onclick="fn_modify_article(frmArticle)">
                    <input type="button" value="취소" onclick="backToList(frmArticle)">
                </td>
            </tr>
            <tr id="tr_btn">
                <td colspan="2" align="center">
                    <input type="button" value="수정하기" onclick="fn_enable(this.form)">
                    <input type="button" value="삭제하기" onclick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
                    <input type="button" value="리스트로 돌아가기" onclick="backToList(this.form)">
                    <input type="button" value="답글쓰기" onclick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO}, ${article.articleNO})">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

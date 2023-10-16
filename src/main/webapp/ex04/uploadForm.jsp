<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${contextPath}/upload.do" method="post" enctype="multipart/form-data">
    파일1 : <input type="file" name="file1"><br>
    파일2 : <input type="file" name="file2"><br>
    매개변수1 : <input type="text" name="param1"> <br>
    매개변수2 : <input type="text" name="param2"> <br>
    매개변수3 : <input type="text" name="param3"> <br>
    <input type="submit" value="업로드">

</form>
</body>
</html>

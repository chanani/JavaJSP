<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/11
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int dan = Integer.parseInt(request.getParameter("dan"));
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1" width="800">
    <tr align="center" bgcolor="#7fffd4">
        <td colspan="2"><%=dan%>단 출력</td>
    </tr>
    <%
        for (int i = 1; i < 10; i++) {
    %>
    <tr align="center">
        <td width="400">
            <%=dan %> * <%=i %>
        </td>
        <td width="400">
            <%=dan * i%>
        </td>
    </tr>
    <%}%>
</table>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ichanhan
  Date: 2023/10/16
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#checkJson").click(function(){
                var jsonStr = '{"name" : ["홍길동", "이순신", "홍길길"]}';
                var jsonInfo = JSON.parse(jsonStr);
                var output = "회원이름<br>";
                output += "============<br>";
                for(var i in jsonInfo.name){
                    output += jsonInfo.name[i] + "<br>";
                }
                $('#output').html(output);
            });
        });
    </script>
</head>
<body>
<input type="button" id="checkJson" value="출력">
<div id="output"></div>
</body>
</html>

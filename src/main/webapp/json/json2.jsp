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
                var jsonStr = '{"members" : [{"name" : "박지성", "age" : 37, "gender" : "남자", "nickname" : "산소통"},'
                    + '{"name" : "손흥민", "age" : 30, "gender" : "남자", "nickname" : "쏘니"}]}';

                var jsonInfo = JSON.parse(jsonStr);
                console.log(jsonInfo);
                var output = "회원정보<br>";
                output += "============<br>";
                for(var i in jsonInfo.members){
                    output += "이름 : " + jsonInfo.members[i].name + "<br>";
                    output += "나이 : " + jsonInfo.members[i].age + "<br>";
                    output += "성별 : " + jsonInfo.members[i].gender + "<br>";
                    output += "별명 : " + jsonInfo.members[i].nickname + "<br><br>";
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

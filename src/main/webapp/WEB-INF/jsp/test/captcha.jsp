<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/17
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>test</title>

</head>
<body>
<img id="myImage1" src="<%=path%>/captcha.do" alt="My Image">

<!-- JavaScript 代码 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 获取图片元素
        var imgElement = document.getElementById("myImage1");
        // 添加点击事件监听器
        imgElement.addEventListener("click", function() {
            // 在控制台输出消息
            imgElement.src = "<%=path%>/captcha.do";
            console.log("已点击图片");
        });
    });
</script>
</body>
</html>

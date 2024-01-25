<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<% response.sendRedirect("/agricshop/agricshop.do"); %>

<html>
<head>
    <title>test</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<img id="myImage" src="<%=path%>/captcha.do" alt="My Image" onclick="change()">
<script>
    function change() {
        console.log('点击事件触发成功');
        $('#myImage').attr('src', '<%=path%>/captcha.do');
    }
</script>
</body>
</html>

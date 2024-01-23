<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/19
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String imgPath = "https://sk308465.oss-cn-hangzhou.aliyuncs.com/img";
%>
<html>
<head>
    <title>图片上传</title>
</head>
<body>

<form method="post" action="<%=path%>/test/uploadAction.do" enctype="multipart/form-data">
    添加图片
    <input type="file" name="photo" id="photo">
    <button type="submit" value="添加图片">添加图片</button>
    <img src="<%=imgPath%>/450b8596-85b4-400a-9af9-f60c29d666e7.jpg"/>
</form>

</body>
</html>

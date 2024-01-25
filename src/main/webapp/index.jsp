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

</head>
<body>
<img id="myImage" src="<%=path%>/captcha.do" alt="My Image">

</body>
</html>

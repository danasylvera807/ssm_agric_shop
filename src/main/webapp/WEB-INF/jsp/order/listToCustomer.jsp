<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/18
  Time: 16:01
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
    <title>农产品管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .product-container {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #navbar {
            display: flex;
            list-style: none;
        }

        #navbar li {
            margin-right: 10px;
        }

        #refreshBtn {
            margin-left: 10px;
        }
    </style>
</head>
<body>
顾客订单
</body>
</html>

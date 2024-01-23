<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/19
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String imgPath = "https://sk308465.oss-cn-hangzhou.aliyuncs.com/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.6.8/css/layui.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-color: #f0f0f0; /* 淡灰色背景 */
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .main-container {
            width: 80%; /* 占比三分之二 */
            margin-top: 50px; /* 与上方保持一定距离 */
            background-color: white; /* 主页面背景色 */
            padding: 20px; /* 内边距 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #3CC; /* 头部背景色 */
            color: #fff; /* 文字颜色 */
        }

        .header-left {
            display: flex;
            align-items: center;
        }

        .header-icon {
            margin-right: 10px;
        }

        .header-search {
            margin-right: 10px;
        }

        .header-username {
            position: relative;
            cursor: pointer;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            display: none;
            min-width: 120px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .dropdown-item {
            padding: 8px;
            cursor: pointer;
            color: #333;
            text-decoration: none;
            display: block;
        }

        .header-username:hover .dropdown-menu {
            display: block;
        }
    </style>
    <title>农产品销售</title>
</head>
<body>

<div class="main-container">
    <div class="header">
        <div class="header-left">
            <div class="header-icon" >
                <img src="<%=path%>/img/shop.png"/>
            </div>
            <h2 align="center">农产品销售</h2>
        </div>
        <div class="header-username">
            <span>${user.userName}</span>
            <div class="dropdown-menu">
                <a id="personalInfo" href="#" class="dropdown-item">个人资料</a>
                <a id="myOrder" href="#" class="dropdown-item">我的订单</a>
                <a id="myCart" href="#" class="dropdown-item">购物车</a>
                <a id="logout" href="#" class="dropdown-item">退出</a>
            </div>
        </div>
    </div>

    <!-- 主要内容 -->
    <div id="shopContent">

    </div>


</div>
<script src="https://cdn.staticfile.org/layui/2.6.8/layui.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    layui.use('element', function(){
        var element = layui.element;

        // 使用 jQuery 发送 GET 请求
        $.ajax({
            url: '<%=path%>/admin/product.do',
            type: 'GET',
            success: function (response) {
                // 请求成功，处理返回的数据
                $('#shopContent').html(response);
            },
            error: function (error) {
                // 请求失败时的处理
                console.error('Error:', error);
            }
        });
    });
</script>

</body>
</html>


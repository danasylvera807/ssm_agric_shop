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
<html>
<head>
    <title>农产品管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
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
    <title>销售管理</title>
</head>
<body>

<div class="main-container">
    <div class="header">
        <div class="header-left">
            <div class="header-icon">
                <img src="<%=path%>/img/admin.png"/>
            </div>
            <h2 align="center">农产品销售管理平台</h2>
        </div>
        <div class="header-username">
            <span>${user.userName}</span>
            <div class="dropdown-menu">
                <a onclick="getProductsToAdmin()" class="dropdown-item">农产品管理</a>
                <a onclick="getCategoriesToAdmin()" class="dropdown-item">分类管理</a>
                <a onclick="getOrdersToAdmin()" class="dropdown-item">订单管理</a>
                <a href="#" class="dropdown-item">可视化管理</a>
                <a onclick="logout()" class="dropdown-item">退出登录</a>
            </div>
        </div>
    </div>

    <!-- 主要内容 -->
    <div id="AdminContent">
    </div>
</div>

<script>
    var viewerPath;
    //加载主页面时默认加载农产品列表视图
    getProductsToAdmin();

    function getProductsToAdmin() {
        var contentId = $('#AdminContent');
        viewerPath = '<%=path%>/admin/product.do';
        getViewer(viewerPath,contentId);
    }
    function getOrdersToAdmin() {
        var contentId = $('#AdminContent');
        viewerPath = '<%=path%>/admin/order.do';
        getViewer(viewerPath,contentId);
    }

    function getCategoriesToAdmin() {
        var contentId = $('#AdminContent');
        viewerPath = '<%=path%>/admin/category.do';
        getViewer(viewerPath,contentId);
    }
    function logout() {
        sessionStorage.removeItem('userInfo');
        // 返回到启动页
        window.location.href = '<%=path%>/logout.do';
    }

    function getViewer(viewerPath,contentId) {
        layui.use('element', function(){
            var element = layui.element;
            // 使用 jQuery 发送 GET 请求
            $.ajax({
                url: viewerPath,
                type: 'GET',
                success: function (response) {
                    // 请求成功，处理返回的数据
                    contentId.html(response);
                },
                error: function (error) {
                    // 请求失败时的处理
                    console.error('Error:', error);
                }
            });
        });
    }

</script>

</body>
</html>


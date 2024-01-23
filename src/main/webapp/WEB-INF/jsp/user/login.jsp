<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/15
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>用户登录</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
            width: 80%;
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
        .header-username:hover .dropdown-menu {
            display: block;
        }
    </style>
    <title>用户登录</title>
</head>
<body style="background-image: url('<%=path%>/img/background.jpg'); background-size: cover;">

<div class="layui-container">
    <div class="layui-row" style="margin-top: 100px;">
        <!-- 登录板块 -->
        <div class="layui-col-md-offset3 layui-col-md6" style="background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px 0px #000;">
            <!-- 标题 -->
            <div class="layui-row">
                <div class="layui-col-md-offset4 layui-col-md4" style="text-align: center; font-size: 24px; font-weight: bold;">
                    用户登录
                </div>
            </div>

            <!-- 导航栏 -->
            <div class="layui-row" style="margin-top: 20px; text-align: center;">
                <div class="layui-col-md6 layui-btn-group">
                    <button class="layui-btn layui-btn-sm" onclick="pwdLogin()">用户名密码</button>
                    <button class="layui-btn layui-btn-sm" onclick="msgLogin()">短信验证</button>
                </div>
            </div>

            <!-- Ajax 请求的子页面容器 -->
            <div id="verifyContent" style="margin-top: 20px;"></div>
        </div>
    </div>
</div>

<script>
    pwdLogin();
    function msgLogin() {
        console.log('msgLogin');
        var contentId = $('#verifyContent');
        viewerPath = '<%=path%>/msgLogin.do';
        getViewer(viewerPath,contentId);
    }
    function pwdLogin() {
        var contentId = $('#verifyContent');
        viewerPath = '<%=path%>/pwdLogin.do';
        getViewer(viewerPath,contentId);
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


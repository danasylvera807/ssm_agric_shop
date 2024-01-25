<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/18
  Time: 8:50
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
    <title>短信验证</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<!-- 密码登录 -->
<div class="layui-tab-item layui-show">
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="phoneNumber" placeholder="请输入手机号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">验证码</label>
        <div class="layui-input-inline">
            <input type="text" name="code"   placeholder="请输入验证码" autocomplete="off" class="layui-input" style="width: 120px;">
        </div>

        <div class="layui-input-inline">
            <button type="button" id="sendBtn" name="sendBtn" class="layui-btn">发送</button>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="loginBtn" class="layui-btn" lay-submit lay-filter="login">登录</button>
            <button id="registerBtn" class="layui-btn layui-btn-primary" lay-submit lay-filter="register">注册</button>
        </div>
    </div>
</div>
<script>
    layui.use(['table','layer'], function(){
        var $ = layui.jquery;
        $('#sendBtn').on('click', function (event) {
            console.log('发送验证码');
            var phoneNumber = $("#phoneNumber").val();
            // 使用正则表达式验证手机号码格式
            var phoneRegex = /^1[3-9]\d{9}$/;
            if (!phoneRegex.test(phoneNumber)) {
                alert("请输入有效的手机号码");
                return;
            }
            console.log(event);
        });
        // 监听登录按钮点击事件
        $('#loginBtn').on('click', function() {
            // 执行登录逻辑
            // 可以通过 Ajax 发送登录请求等
            console.log('点击了登录按钮==');
        });

        // 监听注册按钮点击事件
        $('#registerBtn').on('click', function() {
            // 执行注册逻辑
            // 可以通过 Ajax 发送注册请求等
            console.log('点击了注册按钮==');
        });
    });

</script>
</body>
</html>

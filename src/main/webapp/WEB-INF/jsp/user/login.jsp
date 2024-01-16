<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/15
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <!-- 引入 layui 样式文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.css">
</head>
<body>

<div class="layui-container">
    <div class="layui-row">

        <div class="layui-col-md6 layui-col-md-offset3" style="margin-top: 50px;">
            <form class="layui-form" action="login" method="post">
                <div><h2 style="text-align: center; margin-bottom: 20px;">用户登录</h2></div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" lay-verify="email" placeholder="请输入邮箱" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">图形验证码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="captcha" lay-verify="required" placeholder="请输入图形验证码"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <!-- 图形验证码显示位置 -->
                        <img src="captcha.jpg" alt="captcha" onclick="this.src='captcha.jpg?'+Math.random()">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="login">登录</button>
                        <a href="register.html" class="layui-btn layui-btn-primary">注册</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 引入 layui 脚本文件 -->
<script src="https://cdn.staticfile.org/layui/2.5.6/layui.js"></script>
<script>
    // layui 初始化
    layui.use(['form', 'jquery'], function () {
        var form = layui.form;
        var $ = layui.jquery;

        // 表单验证规则
        form.verify({
            email: [
                /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/,
                '请输入正确的邮箱格式'
            ],
            pass: [
                /^[\S]{6,12}$/,
                '密码必须6到12位，且不能出现空格'
            ]
        });

        // 表单提交监听
        form.on('submit(login)', function (data) {
            // 这里写登录提交的逻辑
            layer.msg(JSON.stringify(data.field));
            return false; // 阻止表单跳转
        });
    });
</script>
</body>
</html>


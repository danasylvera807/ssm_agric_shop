<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/15
  Time: 14:33
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
    <title>注册</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container">
    <div class="layui-row" style="margin-top: 30px;">
        <div class="layui-col-md6 layui-col-md-offset3">
            <form class="layui-form" id="registerForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required|username" placeholder="用户名必须是4到16位（字母、数字、下划线、减号）" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="confirmPassword" lay-verify="required|confirmPassword" placeholder="请确认密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="register">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;

        // 自定义验证规则
        form.verify({
            username: function (value) {
                if (!/^[a-zA-Z0-9_-]{4,16}$/.test(value)) {
                    return '用户名不规范';
                }
            },
            confirmPassword: function (value) {
                var password = $('#registerForm input[name="password"]').val();
                if (value !== password) {
                    return '两次输入的密码不一致';
                }
            }
        });

        // 监听提交
        form.on('submit(register)', function (data) {
            // 获取用户名和密码
            var username = data.field.username;
            var password = data.field.password;

            // 模拟后端接口地址，替换成您的实际后端地址
            var registerUrl = '<%=path%>/registerAction.do';

            // 发送 Ajax POST 请求
            $.ajax({
                url: registerUrl,
                type: 'POST',
                data: {
                    userName: username,
                    userPwd: password
                },
                success: function (response) {
                    var msg;
                    // 请求成功的处理
                    if(response == 'success'){
                        msg = '注册成功';
                    }else if(response == 'fail'){
                        msg = '注册失败';
                    }else if(response == 'repeat'){
                        msg = '已有账号，请登录';
                    }else{
                        msg = '服务器错误';
                    }
                    layer.alert(msg, {icon: 1}, function () {
                        // 注册成功后的跳转或其他操作
                        layer.closeAll();
                    });
                },
                error: function () {
                    // 请求失败的处理
                    layer.msg('请求失败，请稍后重试');
                }
            });
            return false;
        });
    });
</script>

</body>
</html>

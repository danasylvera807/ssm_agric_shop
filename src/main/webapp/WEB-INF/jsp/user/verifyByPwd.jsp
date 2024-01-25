<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/18
  Time: 8:49
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
    <title>用户名密码登录</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<!-- 密码登录 -->
<form class="layui-form" id="loginByPwdForm">
    <div class="layui-tab-item layui-show">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input id="userNameInput" type="text" required name="userName" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="userPwd" required  placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input id="codeInput" type="text" name="captchaCode" required  placeholder="请输入验证码" autocomplete="off" class="layui-input" style="width: 120px;">
            </div>
            <div class="layui-input-inline">
                <img id="myImage" src="<%=path%>/captcha.do" alt="My Image">看不清？点击更换
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="loginBtn" type="submit" class="layui-btn" lay-submit lay-filter="login">登录</button>
                <button id="registerBtn" type="button" class="layui-btn layui-btn-primary">注册</button>
            </div>
        </div>
    </div>
</form>

<script>

    var storedUserInfo = sessionStorage.getItem('userInfo');
    if(storedUserInfo!=null){
        var userName = JSON.parse(storedUserInfo).userName;
        window.location.href='<%=path%>/shop.do?userName='+userName;
    }

    function saveUserInfo() {
        layui.use(function(){
            var $ = layui.jquery;
            var username = $('#userNameInput').val();
            $.ajax({
                url: "<%=path%>/getUserByName.do",  // 替换成你的后端接口地址
                type: "Get",
                data: {userName: username},
                success: function (response) {
                    var userInfo = { /* 用户信息对象 */ };
                    sessionStorage.setItem('userInfo', JSON.stringify(response));
                    sessionStorage.setItem('userLoggedIn', 'true');
                    },
                error: function (error) {
                    // 请求失败时的处理
                    console.error("请求失败", error);
                }
            });
        })
    }
    layui.use(['layer','form'], function(){
        var $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;
        $('#myImage').on('click', function (event) {
            this.src = '<%=path%>/captcha.do';
            console.log(event);
        });
        // 监听表单提交事件
        form.on('submit(login)', function(data){
            // 使用 Ajax 提交表单数据
            console.log('Ajax请求');
            $.ajax({
                url: "<%=path%>/loginByPwd.do",  //后端接口地址
                type: "POST",
                data: data.field,
                success: function (response) {
                    // 请求成功后的处理
                    if(response == 'user error'){
                        layer.msg("用户名或密码错误");
                    }else if(response == 'code error'){
                        layer.msg('验证码错误');
                        $('#codeInput').val('');
                        $('#myImage').src = '<%=path%>/captcha.do';
                    }else if(response == '顾客'){
                        layer.msg('登录成功');
                        //保存用户名
                        saveUserInfo();
                        window.location.href = "<%=path%>/shop.do?userName="+data.field.userName;
                    }else if(response == '管理员'){
                        layer.msg('登录成功');
                        saveUserInfo();
                        window.location.href = "<%=path%>/manage.do?userName="+data.field.userName;
                    }else{
                        console.log(response);
                        layer.msg('服务器错误');
                    }
                },
                error: function (error) {
                    // 请求失败时的处理
                    console.error("请求失败", error);
                }
            });
            // 阻止表单的默认提交行为
            return false;
        });
        $('#registerBtn').on('click', function (event) {
            layer.open({
                type: 2,
                title: '注册',
                content: '<%=path%>/register.do',
                area: ['500px', '300px'],

            });

        });
    });
</script>
</body>
</html>

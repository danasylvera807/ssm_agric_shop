<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/25
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String imgPath = "https://sk308465.oss-cn-hangzhou.aliyuncs.com/";
%>
<html>
<head>
    <title>用户信息</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <form class="layui-form" method="post" action="<%=path%>/user/update.do">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block" style="width: 70%;">
                <input id="userId" type="text" name="userId" hidden value="${user.userId}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block" style="width: 70%;">
                <input id="userName" type="text" name="userName" readonly  lay-verify="readonly" value="${user.userName}" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline" style="width: 70%;">
                <input id="userEmail" type="text" name="userEmail"  lay-verify="readonly" value="${user.userEmail}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline" style="width: 70%;">
                <input id="phoneNumber" type="text" name="phoneNumber"  lay-verify="readonly" value="${user.phoneNumber}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货地址</label>
            <div class="layui-input-inline" style="width: 70%;">
                <input id="userAddress" type="text" name="userAddress"  lay-verify="readonly" value="${user.userAddress}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-block" style="width: 70%;">
                <input id="registerTime" type="text" name="registerTime" lay-verify="readonly" value="${user.registrationTime}" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="pwdBtn" type="button" class="layui-btn layui-btn-primary">修改密码</button>
                <button class="layui-btn" type="submit" lay-submit lay-filter="userFilter">确定</button>
            </div>
        </div>

    </form>
</div>

<script>

    layui.use(['form','layer','jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery
        // 监听表单提交事件
        form.on('submit(userFilter)', function (data) {
            // 使用 FormData 处理包含文件的表单数据
            var phoneNumber = $('input[name="phoneNumber"]').val();
            var userEmail = $('input[name="userEmail"]').val();
            var phoneRegex = /^1[3456789]\d{9}$/;
            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if(!emailRegex.test(userEmail)){
                layer.msg('不合法的邮箱')
            }else if(!phoneRegex.test(phoneNumber)){
                layer.msg('不合理的手机号');
            }else{
                var formData = {
                    userId: $('input[name="userId"]').val(),
                    userEmail: userEmail,
                    phoneNumber: phoneNumber,
                    userAddress: $('input[name="userAddress"]').val()
                };
                $.ajax({
                    url: '<%=path%>/user/update.do',
                    type: 'post',
                    data: formData,
                    success: function (result) {
                        layer.msg(result);
                    },
                    error: function () {
                        layer.msg("请求错误");
                    }
                });
            }
            // 阻止表单的默认提交行为
            return false;
        });
        $('#pwdBtn').on('click',function () {
            layer.open({
                type: 2,//iframe
                title: '修改密码',
                area: ['400px','400px'],
                closeBtn: 2,
                content: '<%=path%>/user/toPwd.do'
            });
        })
    });
</script>
</body>
</html>

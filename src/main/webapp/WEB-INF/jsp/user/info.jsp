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
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="userName" type="text" name="userName" readonly  lay-verify="readonly" value="${user.userName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input id="userEmail" type="text" name="userEmail" readonly  lay-verify="readonly" value="${user.userEmail}" autocomplete="off" class="layui-input">
            <button id="updateEmailBtn" type="button" class="layui-btn layui-btn-primary">修改</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input id="phoneNumber" type="text" name="phoneNumber" readonly  lay-verify="readonly" value="${user.phoneNumber}" autocomplete="off" class="layui-input">
            <button id="updatePhoneBtn" type="button" class="layui-btn layui-btn-primary">修改</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
            <input id="userOrigin" type="text" name="userOrigin" readonly  lay-verify="readonly" value="${user.userAddress}" autocomplete="off" class="layui-input">
            <button id="updateAddrBtn" type="button" class="layui-btn layui-btn-primary">修改</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-block">
            <input id="registerTime" type="text" name="registerTime" lay-verify="readonly" value="${user.registrationTime}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="pwdBtn" type="button" class="layui-btn layui-btn-primary">修改</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>
    function ajax() {
        console.log('update');
    }
    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;

        $('#updateEmailBtn').on('click',function () {
            ajax()
        })
        $('#updatePhoneBtn').on('click',function () {
            ajax()
        })
        $('#updateAddrBtn').on('click',function () {
            ajax()
        })

        $('#backBtn').on('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
            console.log('back');
        })
    });
</script>
</body>
</html>

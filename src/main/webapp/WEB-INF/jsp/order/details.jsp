<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/25
  Time: 15:04
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
    <title>订单详情</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input id="orderNumber" type="text" name="orderNumber" readonly  lay-verify="readonly" value="${order.orderNumber}" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="userName" type="text" name="userName" readonly  lay-verify="readonly" value="${order.orderUser.userName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
            <input id="userAddr" type="text" name="userAddr" readonly  lay-verify="readonly" value="${order.orderUser.userAddress}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单时间</label>
        <div class="layui-input-block">
            <input id="orderTime" type="text" name="orderTime" readonly  lay-verify="readonly" value="${order.orderTime}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总金额</label>
        <div class="layui-input-block">
            <input id="orderAmount" type="text" name="orderAmount" lay-verify="readonly" value="${order.orderTotalAmount}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发货地址</label>
        <div class="layui-input-block">
            <input id="shippingAddress" type="text" name="shippingAddress" lay-verify="readonly" value="${order.shippingAddress}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-block">
            <input id="orderState" type="text" name="orderState" lay-verify="readonly" value="${order.orderState.getState()}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea id="memo" name="memo" value="${order.logisticInfo}" class="layui-textarea" readonly></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>
    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;
        $('#backBtn').on('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
            console.log('back');
        })
    });
</script>
</body>
</html>

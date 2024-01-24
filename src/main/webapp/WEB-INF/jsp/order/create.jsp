<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/24
  Time: 23:32
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
    <title>订单结算</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input id="orderNumber" type="text" name="orderNumber" readonly  lay-verify="readonly" value="${order.orderNumber}" autocomplete="off" class="layui-input">
        </div>
    </div><div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="userName" type="text" name="userName" readonly  lay-verify="readonly" value="${order.orderUser.userName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址</label>
        <div class="layui-input-block">
            <input id="userAddr" type="text" name="userAddr"  lay-verify="readonly" value="${order.orderUser.userAddress}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总金额</label>
        <div class="layui-input-block">
            <input id="orderAmount" type="text" name="orderAmount" readonly  lay-verify="readonly" value="${order.orderTotalAmount}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发货地址</label>
        <div class="layui-input-block">
            <input id="productOrigin" type="text" name="productOrigin" readonly  lay-verify="readonly" value="${order.shippingAddress}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="textarea-container">
            <textarea id="memo" class="layui-textarea" placeholder="添加备注"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addBtn" type="button" class="layui-btn" >下单</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">我再想想</button>
        </div>
    </div>
</div>

<script>

    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;

        $('#addBtn').on('click',function () {
            var userId = ${order.orderUser.userId};
            var memo = $('#memo').val();
            // 准备要发送的数据
            var requestData = {
                userId: userId,
                memo: memo
            };

            // 发送 POST 请求
            $.ajax({
                url: '<%=path%>/order/add.do', // 替换成你的后端接口地址
                type: 'POST',
                data: requestData,
                success: function (response) {
                    // 请求成功时的处理
                    layer.msg(response);
                },
                error: function (error) {
                    // 请求失败时的处理
                    console.error('失败:', error);
                }
            });
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

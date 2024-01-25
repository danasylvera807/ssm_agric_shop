<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/24
  Time: 19:26
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
    <title>购物车详情</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input id="productName" type="text" name="productName" readonly  lay-verify="readonly" value="${cart.cartProduct.productName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input id="productPrice" type="text" name="productPrice" readonly  lay-verify="readonly" value="${cart.cartProduct.productPrice}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input id="productStock" type="text" name="productStock" readonly  lay-verify="readonly" value="${cart.cartProduct.productStock}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">原产地</label>
        <div class="layui-input-block">
            <input id="productOrigin" type="text" name="productOrigin" readonly  lay-verify="readonly" value="${cart.cartProduct.productOrigin}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上架日期</label>
        <div class="layui-input-block">
            <input id="productProductionDate" type="text" name="productProductionDate" lay-verify="readonly" value="${cart.cartProduct.productProductionDate}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <div class="layui-input-block">
            <img src="<%=imgPath%>/img/${cart.cartProduct.productImageUrl}" height="50px" width="50px" alt="img"/>

        </div>
    </div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md4">
            <div class="layui-input-inline">
                <button id="minusBtn" class="layui-btn layui-btn-primary quantity-button">-</button>
            </div>
            <div class="layui-input-inline">
                <input type="text" class="layui-input quantity-input" id="quantityInput" value="${cart.quantity}" style="text-align: center;">
            </div>
            <div class="layui-input-inline">
                <button id="plusBtn" class="layui-btn layui-btn-primary quantity-button">+</button>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="updateBtn" type="button" class="layui-btn" >确定</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>

    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;
        $('#minusBtn').on('click',function () {
            var quantityInput = $('#quantityInput');
            var currentQuantity = parseInt(quantityInput.val(), 10);

            if (currentQuantity > 1) {
                quantityInput.val(currentQuantity - 1);
            }
        });
        $('#plusBtn').on('click',function () {
            var quantityInput = $('#quantityInput');
            var currentQuantity = parseInt(quantityInput.val(), 10);

            quantityInput.val(currentQuantity + 1);
        });

        $('#updateBtn').on('click',function () {
            var cartId = ${cart.cartId};
            var quantity = $('#quantityInput').val();
            // 准备要发送的数据
            var requestData = {
                cartId: cartId,
                quantity: quantity
            };

            // 发送 POST 请求
            $.ajax({
                url: '<%=path%>/cart/update.do', // 替换成你的后端接口地址
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
